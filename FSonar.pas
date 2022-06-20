// Sonar System Functions
// Date 18.06.22

// Only valid for disc and cylinder shapes

// Based on formulas and equations from the concept study A10019-00-Axx
// "Unterwasser-Navigationssystem für Gerätetaucher" from seanus systems
// and the FPC - Ferroperm Piezoelectric Calculator (Excel Sheet)

unit FSonar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Math, UGlobal;

type
  TFormSonar = class(TForm)
    SonarEquation: TImage;
    btDummy: TButton;
    edNoiseLevel1: TEdit;
    edNoiseLevel2: TEdit;
    edRdirectivity: TEdit;
    edSafetyMargin: TEdit;
    edSignalExcess: TEdit;
    edSignalLevel: TEdit;
    edSourceLevel1: TEdit;
    edSourceLevel2: TEdit;
    edTdirectivity: TEdit;
    edThreshold: TEdit;
    edTransmissionLoss: TEdit;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormBitmap(sSonar: string);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

const
  E0 = 0.008854;  //dielectric constant in vacuum [pF/mm]

  Bessel: array[0..6, 0..3] of Single = (
    ( 0.0,  0.000,  3.830,  1.219),
    ( 3.0,  0.708,  1.614,  0.514),
    ( 6.0,  0.501,  2.212,  0.704),
    ( 9.0,  0.355,  2.620,  0.834),
    (12.0,  0.251,  2.924,  0.931),
    (15.0,  0.178,  3.152,  1.003),
    (18.0,  0.126,  3.327,  1.059));
  // -dB      y       x      x/Pi

var
  FormSonar: TFormSonar;

  function CalcDensity(T, S: Single): Single;
  function CalcSoundSpeed(T, S, D: Single): Single;
  function CalcAbsorptionLoss(T, S, f: Single): Single;
  function CalcWaveLength(c, f: Single): Single;
  function CalcBeamRatio(d, wl: Single): Single;
  function CalcNearField(d, wl: Single): Single;
  function CalcMainLobe(d, wl: Single): Single;
  function CalcBeamWidth(d, wl, bl: Single): Single;
  function CalcBurstDuration(sp, f: Single): Single;
  function CalcEchoSuppression(c, tb: Single): Single;
  function CalcBandWidth(tb: Single): Single;
  function CalcBandPass(tb: Single): Single;
  function CalcRadiatedPower(dt, Pa: Single): Single;
  function CalcCavitation(f, tb: Single): Single;
  function CalcCavitationThreshold(dt, D, DI: Single): Single;
  function CalcAcousticWindow(wl: Single): Single;
  function CalcBeaufort(ws: Single): Single;
  function CalcRepetitionTime(fc, z: Single): Single;
  function CalcMinDistance(c, fc: Single): Single;
  function CalcMaxDistance(c, fc, z: Single): Single;
  function CalcRangeError(c, ac: Single): Single;
  function CalcDirectivityIndex(d, wl: Single): Single;
  function CalcTurbulentNoise(f: Single): Single;
  function CalcShippingNoise(f, st: Single): Single;
  function CalcSurfaceNoise(f, ws: Single): Single;
  function CalcThermalNoise(f: Single): Single;
  function CalcNoiseLevel(N1, N2, N3, N4, Bw: Single): Single;
  function CalcTransmissionLoss(K, r, al: Single): Single;
  function CalcSourceLevel(Pa: Single): Single;
  function CalcDetectionThreshold(tb: Single): Single;
  function CalcSignalLevel(SL, TL, DIt, DIr: Single): Single;
  function CalcSignalExcess(RL, NL: Single): Single;
  function CalcSafetyMargin(SE, DT: Single): Single;

  //09.10.05 nk add ff
  function CalcWeight(d, h, md: Single): Single;
  function CalcCapacitance(d, h, DC: Single): Single;
  function CalcRadialResonance(d, Nr: Single): Single;
  function CalcAxialResonance(h, Na: Single): Single;
  function CalcLengthResonance(d, h, Xa, Xb: Single): Single;

  function BesselJ1(x: Double): Double;
  function PowerSum(x, y: Double): Double;

implementation

uses FMain;

{$R *.dfm}

procedure TFormSonar.FormActivate(Sender: TObject);
begin
  FormSonar.Left := FormMain.Left + FormMain.Width;
  FormSonar.Top  := FormMain.Top  + FormMain.gbTransmitter.Top + 20;
end;

procedure TFormSonar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  SonarShow := fsNone;
end;

procedure TFormSonar.FormBitmap(sSonar: string);
var
  bForm: TBitmap;
begin
  FormSonar.Show;
  btDummy.SetFocus;
  bForm := TBitmap.Create;
  try
    bForm := FormSonar.GetFormImage;
    bForm.SaveToFile(sSonar);
  finally
    bForm.Free;
  end;
end;

function CalcDensity(T, S: Single): Single;
begin
  // T - temperature [°C]
  // S - salinity [ppt]

  // (31b) - density of water [kg/m3]
  Result := 1027.0 - 0.15 * (T - 10.0) + 0.78 * (S - 35.0);
end;

function CalcSoundSpeed(T, S, D: Single): Single;
begin
  // T - temperature [°C]
  // S - salinity [ppt]

  // (10) - sound speed (Medwin 1975)
  Result := 1449.2 + 4.6 * T - 0.055 * Power(T, 2) +
    0.00029 * Power(T, 3) + (1.34 - 0.01 * T) * (S - 35.0) + D * 0.016;
end;

function CalcAbsorptionLoss(T, S, f: Single): Single;
var
  a1, a2, ft: Single;
begin
  // T - temperature [°C]
  // S - salinity [ppt]
  // f - frequency [kHz] (10...500kHz)

  // (17/18) absorption loss [dB/kyd] (Schulkin & Marsh 1962)
  ft := 6.0 - 1520.0 / (T + 273.0);
  ft := 21.9 * Power(10, ft);

  a1 := 0.0186 * S * ft * Power(f, 2) / (Power(ft, 2) + Power(f, 2));
  a2 := 0.0268 * Power(f, 2) / ft; // [dB/kyd]

  // (17b) dB -> km
  Result := 1.094 * (a1 + a2); // [dB/km]
end;

function CalcWaveLength(c, f: Single): Single;
begin
  // c - sound speed [m/s]
  // f - frequency [kHz]

  // (4a) - wave length [mm]
  Result := c / f;
end;

function CalcBeamRatio(d, wl: Single): Single;
begin
  // d - piezo diameter [mm]
  // wl - wave length [mm]

  // (3b) - relative beam ratio (ka)
  Result := d * Pi / wl;
end;

function CalcNearField(d, wl: Single): Single;
begin
  // d - transmitter diameter [mm]
  // wl - wave length [mm]

  // (1a) - transmitter near field [mm]
  Result := Power(d, 2) / (4.0 * wl);
end;

function CalcMainLobe(d, wl: Single): Single;
var
  x: Single;
begin
  // d - piezo diameter [mm]
  // wl - wave length [mm]

  // (7a) - main lobe angle [°]
  x := Bessel[0, 3];
  x := x * wl / d;

  if (x >= -1.0) and (x <= 1.0) then
    Result := 2.0 * RadToDeg(ArcSin(x))
  else
    Result := 0.0;
end;

function CalcBeamWidth(d, wl, bl: Single): Single;
var
  l: Integer;
  x: Single;
begin
  // d - piezo diameter [mm]
  // wl - wave length [mm]
  // bl - beam width level [3/6/9/12/15/18dB]

  // directivity function
  l := Round(bl / 3.0);
  x := Bessel[l, 3];
  x := x * wl / d;

  // (8a) - beam width angle [°]
  if (x >= -1.0) and (x <= 1.0) then
    Result := 2.0 * RadToDeg(ArcSin(x))
  else
    Result := 180.0;
end;

function CalcBurstDuration(sp, f: Single): Single;
begin
  // sp - signal periodes [cycles]
  // f - frequency [kHz]

  // (23b) - burst duration [us]
  Result := 1000.0 * sp / f;
end;

function CalcEchoSuppression(c, tb: Single): Single;
begin
  // c - sound speed [m/s]
  // tb - burst duration [us]

  // (24a) - echo suppression [m]
  Result := c * tb / 1000000.0;
end;

function CalcBandWidth(tb: Single): Single;
begin
  // tb - burst duration [us]

  // (22b) - transducer bandwidth [Hz]
  Result := 1000000.0 / tb;
end;

function CalcBandPass(tb: Single): Single;
begin
  // tb - burst duration [us]

  // (33a) - bandpass filter bandwidth [Hz]
  Result := 1370000.0 / tb;
end;

function CalcRadiatedPower(dt, Pa: Single): Single;
var
  A: Single;
begin
  // dt - transmitter diameter [mm]
  // Pa - acoustic Power [mW]

  // transmitter area [mm2]
  A := Pi * Power(dt, 2) / 4.0;

  //nk// (!!??) - radiated Power [W/cm2]
  Result := 0.1 * Pa / A;
end;

function CalcCavitation(f, tb: Single): Single;
var
  s, o: Single;
begin
  // f - frequency [kHz]
  // tb - burst duration [us]

  o := 2.8;
  s := 0.00001;

  if tb < 10000.0 then begin
    o := 3.5;
    s := 0.0001;
  end;

  if tb < 1000.0 then begin
    o := 6.0;
    s := 0.002;
  end;

  //// set depth formula here !!
  //nk// (!!??) - cavitation threshold @ 5m depth [W/cm2]
  Result := CAVITATION * (o - s * tb) * f / 10.0;
end;

function CalcCavitationThreshold(dt, D, DI: Single): Single;
var
  A: Single;
begin
  // dt - transmitter diameter [mm]
  // D - operation depth [m]
  // DI - transducer directivity index [dB]

  A := dt / 2000.0;      //radius [m]
  A := Power(A, 2) * Pi; //area m2

  Result := 186.0 + 10 * log10(A) + DI + 20 * log10(10 + D);
end;

function CalcAcousticWindow(wl: Single): Single;
begin
  // wl - wave length [mm]

  // (!!??) - acoustic window thickness [mm]
  Result := wl / 4.0;
end;

function CalcBeaufort(ws: Single): Single;
begin
  // ws - wind speed [m/s]

  // beaufort
  Result := Sqrt(9.0 + 6.0 * ws) - 3.0;
end;

function CalcRepetitionTime(fc, z: Single): Single;
begin
  // fc - clock frequency [kHz]
  // z - counter width [bit]

  // (25b) - repetition time [s]
  Result := Power(2, z) / (1000.0 * fc);
end;

function CalcMinDistance(c, fc: Single): Single;
begin
  // c - sound speed [m/s]
  // fc - clock frequency [kHz]

  // (25a) - minimal distance [cm]
  Result := c / (10.0 * fc);
end;

function CalcMaxDistance(c, fc, z: Single): Single;
begin
  // c - sound speed [m/s]
  // fc - clock frequency [kHz]
  // z - counter width [bit]

  // (25b) - maximal distance [m]
  Result := Power(2, z) * c / (1000.0 * fc);
end;

function CalcRangeError(c, ac: Single): Single;
begin
  // c - sound speed [m/s]
  // ac - clock accuracy [ppm*10]

  // (26a) - range error per hour [m/h]
  Result := 360.0 * c * ac * PPM;
end;

function CalcDirectivityIndex(d, wl: Single): Single;
begin
  // d - piezo diameter [mm]
  // wl - wave length [mm]

  // (14a) - directivity index [dB]
  Result := 20 * log10(d * Pi / wl);

  if Result < 0.0 then Result := 0.0;
end;

function CalcTurbulentNoise(f: Single): Single;
begin
  // f - frequency [kHz]

  // (20a) - turbulence noise [dB]
  Result := 17.0 - 30 * log10(f);

  if Result < 0.0 then Result := 0.0;
end;

function CalcShippingNoise(f, st: Single): Single;
begin
  // f - frequency [kHz]
  // st - shipping traffic (0=very light..10=heavy)

  // (20b) - shipping noise [dB]
  Result := 40.0 + 20 * (st / 10.0 - 0.5) + 26 * log10(f) - 60 * log10(f + 0.03);

  if Result < 0.0 then Result := 0.0;
end;

function CalcSurfaceNoise(f, ws: Single): Single;
begin
  // f - frequency [kHz]
  // ws - wind speed [m/s]

  // (20c) - surface noise [dB]
  Result := 50.0 + 7.5 * Power(ws, 0.5) + 20 * log10(f) - 40 * log10(f + 0.4);

  if Result < 0.0 then Result := 0.0;
end;

function CalcThermalNoise(f: Single): Single;
begin
  // f - frequency [kHz]

  // (20d) - thermal noise [dB]
  Result := 20 * log10(f) - 15.0;

  if Result < 0.0 then Result := 0.0;
end;

function CalcNoiseLevel(N1, N2, N3, N4, Bw: Single): Single;
begin
  // Nx - noise spectrum 1..4 [dB]
  // Bw - receiver bandwidth [Hz]

  // (21b) - noise level [dB]
  Result := 10 * log10(Power(10, N1/10) +  Power(10, N2/10) + Power(10, N3/10) + Power(10, N4/10));
  Result := Result + 10 * log10(Bw);

  if Result < 0.0 then Result := 0.0;
end;

function CalcTransmissionLoss(K, r, al: Single): Single;
begin
  // K - transmitter characteristic (10/15/20)
  // r - operating range [m]
  // al - absorption loss [dB/km]

  // (16b) - transmission loss [dB]
  Result := K * log10(r) + al * r / 1000.0;

  if Result < 0.0 then Result := 0.0;
end;

function CalcSourceLevel(Pa: Single): Single;
begin
  // Pa - acoustic Power [mW]

  // (13a) - transmitter source level [dB]
  Result := 10 * log10(Pa / 1000.0) + REFLEVEL;
end;

function CalcDetectionThreshold(tb: Single): Single;
begin
  // tb - burst duration [us]

  // (23a) - detection threshold [dB] for DX=20
  Result := 10 * log10(10000000.0 / tb);
end;

function CalcSignalLevel(SL, TL, DIt, DIr: Single): Single;
begin
  // SL - source level [dB]
  // TL - transmission loss [dB]
  // DI - directivity index [dB]

  // (15a) - receiver signal level [dB]
  Result := SL + DIt + DIr - TL;
end;

function CalcSignalExcess(RL, NL: Single): Single;
begin
  // RL - receiver signal level [dB]
  // NL - noise level [dB]

  // (15b) - signal excess [dB]
  Result := RL - NL;
end;

function CalcSafetyMargin(SE, DT: Single): Single;
begin
  // SE - signal excess [dB]
  // DT - detection threshold [dB]

  // safety margin [dB]
  Result := SE - DT;
end;

function CalcWeight(d, h, md: Single): Single;
var
  v: Single;
begin
  // d - piezo diameter [mm]
  // h - piezo thickness [mm]
  // md - material density [kg/m3]

  // piezo element volume [mm3]
  v := Pi * Sqr(d / 2) * h;

  // piezo element weight [g]
  Result := v * md / 1000000;
end;

function CalcCapacitance(d, h, DC: Single): Single;
begin
  // d - piezo diameter [mm]
  // h - piezo thickness [mm]
  // DC - dielectric constant

  // (FPC) - parallel capacitance [pF] @ 1kHz
  Result := DC * E0 * Pi * Sqr(d / 2) / h;
end;

function CalcRadialResonance(d, Nr: Single): Single;
begin
  // d - piezo diameter [mm]
  // Nr - radial (or planar) frequency constant [m/s]

  // (FPC) - radial (or planar) resonance frequency [Hz]
  Result := Nr / d;
end;

function CalcAxialResonance(h, Na: Single): Single;
begin
  // h - piezo thickness [mm]
  // Na - axial (or longitudinal) frequency constant [m/s]

  // (FPC) - axial (or longitudinal) resonance frequency [Hz]
  Result := Na / h;
end;

function CalcLengthResonance(d, h, Xa, Xb: Single): Single;
var
  Nt: Single;
begin
  // d - piezo diameter [mm]
  // h - piezo thickness [mm]
  // Xa - regression parameter a  (from Ferroperm Calculator
  // Xb - regression parameter b   no further literature found!)

  // corrected length (or thickness) resonance constant [m/s]
  Nt := Xa + (Xb / (d / h));

  // (FPC) - length (or thickness) resonance frequency [Hz]
  Result := Nt / h;
end;

function BesselJ1(x: Double): Double;
var // Bessel function of the 1st kind
  ax, xx, z, y: Double;
  ans, ans1, ans2: Double;

  function Sngl(x: Double): Double;
    begin
      Sngl := x;
    end;

  function Sign(x: Double): Double;
    begin
      if x >= 0.0 then
        Sign := 1.0
      else
        Sign := -1.0;
    end;
   
begin
  try
    if (Abs(x) < 8.0) then begin
      y := Sqr(x);
      ans1 := x * (72362614232.0 + y * (-7895059235.0 + y * (242396853.1 +
        y * (-2972611.439 + y * (15704.48260 + y * (-30.16036606))))));
      ans2 := 144725228442.0 + y * (2300535178.0 + y * (18583304.74 +
        y * (99447.43394 + y * (376.9991397 + y * 1.0))));
      Result := Sngl(ans1 / ans2);
    end else begin
      ax := Abs(x);
      z := 8.0 / ax;
      y := Sqr(z);
      xx := ax - 2.356194491;
      ans1 := 1.0 + y * (0.183105e-2 + y * (-0.3516396496e-4 +
        y * (0.2457520174e-5 + y * (-0.240337019e-6))));
      ans2 := 0.04687499995 + y * (-0.2002690873e-3 +
        y * (0.8449199096e-5 + y * (-0.88228987e-6 + y * 0.105787412e-6)));
      ans := Sqrt(0.636619772 / ax) * (Cos(xx) *
        ans1 - z * Sin(xx) * ans2) * Sign(x);
      Result := Sngl(ans)
    end;
  except
    Result := 0.0;
  end;
end;

function PowerSum(x, y: Double): Double;
begin
  Result := 10 * log10(Power(10, x / 10) + Power(10, y / 10));
end;


end.
