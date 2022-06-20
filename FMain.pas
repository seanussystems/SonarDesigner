// Sonar Designer Main Form
// Date 19.06.22

unit FMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StrUtils, StdCtrls, ExtCtrls, Spin, ComObj, Math, System.UITypes,
  Mask, FileCtrl, RzEdit, RzButton, RzSpnEdt, RzCmboBx, RzRadChk,
  UGlobal, USystem, UInifile, FParameter, FSonar, FChart;

type
  TFormShow = (fsNone, fsTransmitter, fsReceiver, fsSonar);

  TFormMain = class(TForm)
    btAbsorptionLoss: TRzBitBtn;
    btExit: TRzBitBtn;
    btRbeamPattern: TRzBitBtn;
    btReport: TRzBitBtn;
    btSettings: TRzBitBtn;
    btSonar: TRzBitBtn;
    btSoundSpeed: TRzBitBtn;
    btTbeamPattern: TRzBitBtn;
    btTransducerBeamwidth: TRzBitBtn;
    cbRmaterial: TRzComboBox;
    cbTmaterial: TRzComboBox;
    edAbsorptionLoss: TEdit;
    edBandpass: TEdit;
    edBandwidth: TEdit;
    edBeaufort: TEdit;
    edBurstDuration: TEdit;
    edCavitation: TEdit;
    edCavitationLevel: TEdit;
    edDensity: TEdit;
    edDisplacement: TEdit;
    edEchoSuppression: TEdit;
    edMaxDistance: TEdit;
    edMinDistance: TEdit;
    edNearfield: TEdit;
    edNoiseLevel: TEdit;
    edRadiatedPower: TEdit;
    edRangeError: TEdit;
    edRbeamRatio: TEdit;
    edRbeamwidth: TEdit;
    edRcapacit: TEdit;
    edRdirectivity: TEdit;
    edRepetitionTime: TEdit;
    edRaxial: TEdit;
    edRmainLobe: TEdit;
    edRradial: TEdit;
    edRweight: TEdit;
    edRwindow: TEdit;
    edSafetyMargin: TEdit;
    edShippingNoise: TEdit;
    edSignalExcess: TEdit;
    edSignalLevel: TEdit;
    edSoundSpeed: TEdit;
    edSourceLevel: TEdit;
    edSurfaceNoise: TEdit;
    edTbeamRatio: TEdit;
    edTbeamwidth: TEdit;
    edTcapacit: TEdit;
    edTdirectivity: TEdit;
    edThermalNoise: TEdit;
    edThreshold: TEdit;
    edTaxial: TEdit;
    edTmainLobe: TEdit;
    edTradial: TEdit;
    edTransmissionLoss: TEdit;
    edTurbulentNoise: TEdit;
    edTweight: TEdit;
    edTwindow: TEdit;
    edWaveLength: TEdit;
    gbEnvironment: TGroupBox;
    gbMainFrame: TGroupBox;
    gbPerformance: TGroupBox;
    gbPropagation: TGroupBox;
    gbReceiver: TGroupBox;
    gbTransmitter: TGroupBox;
    lbAbsorptionLoss: TLabel;
    lbAbsorptionLossUnit: TLabel;
    lbBandpass: TLabel;
    lbBandpassUnit: TLabel;
    lbBandwidth: TLabel;
    lbBandwidthUnit: TLabel;
    lbBeaufort: TLabel;
    lbBurstDuration: TLabel;
    lbBurstDurationUnit: TLabel;
    lbCavitation: TLabel;
    lbCavitationLevel: TLabel;
    lbCavitationLevelUnit: TLabel;
    lbCavitationUnit: TLabel;
    lbCharacteristic: TLabel;
    lbClockAccuracy: TLabel;
    lbClockAccuracyUnit: TLabel;
    lbClockFrequency: TLabel;
    lbClockFrequencyUnit: TLabel;
    lbCounterBits: TLabel;
    lbDensity: TLabel;
    lbDensityUnit: TLabel;
    lbDisplacement: TLabel;
    lbDisplacementUnit: TLabel;
    lbEcho: TLabel;
    lbEchoUnit: TLabel;
    lbFrequency: TLabel;
    lbFrequencyUnit: TLabel;
    lbMaxDistance: TLabel;
    lbMaxDistanceUnit: TLabel;
    lbMessage: TLabel;
    lbMinDistance: TLabel;
    lbMinDistanceUnit: TLabel;
    lbNearfield: TLabel;
    lbNearfieldUnit: TLabel;
    lbNoiseLevel: TLabel;
    lbNoiseLevelUnit: TLabel;
    lbPeriodes: TLabel;
    lbRadiatedPower: TLabel;
    lbRadiatedPowerUnit: TLabel;
    lbRange: TLabel;
    lbRangeError: TLabel;
    lbRangeErrorUnit: TLabel;
    lbRangeUnit: TLabel;
    lbRbeamRatio: TLabel;
    lbRbeamwidth: TLabel;
    lbRbeamwidthUnit: TLabel;
    lbRcapacit: TLabel;
    lbRcapacitUnit: TLabel;
    lbRdiameter: TLabel;
    lbRdiameterUnit: TLabel;
    lbRdirectivity: TLabel;
    lbRdirectivityUnit: TLabel;
    lbRepetitionTime: TLabel;
    lbRepetitionTimeUnit: TLabel;
    lbRaxial: TLabel;
    lbRaxialUnit: TLabel;
    lbRmainLobe: TLabel;
    lbRmainLobeUnit: TLabel;
    lbRmaterial: TLabel;
    lbRradial: TLabel;
    lbRradialUnit: TLabel;
    lbRthick: TLabel;
    lbRthickUnit: TLabel;
    lbRweight: TLabel;
    lbRweightUnit: TLabel;
    lbRwindow: TLabel;
    lbRwindowUnit: TLabel;
    lbSafetyMargin: TLabel;
    lbSafetyMarginUnit: TLabel;
    lbSalinity: TLabel;
    lbSalinityUnit: TLabel;
    lbShippingNoise: TLabel;
    lbShippingNoiseUnit: TLabel;
    lbShipTraffic: TLabel;
    lbSignalExcess: TLabel;
    lbSignalExcessUnit: TLabel;
    lbSignalLevel: TLabel;
    lbSignalLevelUnit: TLabel;
    lbSoundSpeed: TLabel;
    lbSoundSpeedUnit: TLabel;
    lbSourceLevel: TLabel;
    lbSourceLevelUnit: TLabel;
    lbSurfaceNoise: TLabel;
    lbSurfaceNoiseUnit: TLabel;
    lbTbeamRatio: TLabel;
    lbTbeamwidth: TLabel;
    lbTbeamwidthUnit: TLabel;
    lbTcapacit: TLabel;
    lbTcapacitUnit: TLabel;
    lbTdiameter: TLabel;
    lbTdiameterUnit: TLabel;
    lbTdirectivity: TLabel;
    lbTdirectivityUnit: TLabel;
    lbTemperature: TLabel;
    lbTemperatureUnit: TLabel;
    lbThermalNoise: TLabel;
    lbThermalNoiseUnit: TLabel;
    lbThreshold: TLabel;
    lbThresholdUnit: TLabel;
    lbTaxial: TLabel;
    lbTaxialUnit: TLabel;
    lbTmainLobe: TLabel;
    lbTmainlobeUnit: TLabel;
    lbTmaterial: TLabel;
    lbTradial: TLabel;
    lbTradialUnit: TLabel;
    lbTpower: TLabel;
    lbTpowerUnit: TLabel;
    lbTransmissionLoss: TLabel;
    lbTransmissionLossUnit: TLabel;
    lbTthick: TLabel;
    lbTthickUnit: TLabel;
    lbTurbulentNoise: TLabel;
    lbTurbulentNoiseUnit: TLabel;
    lbTweight: TLabel;
    lbTweightUnit: TLabel;
    lbTwindow: TLabel;
    lbTwindowUnit: TLabel;
    lbWaveLength: TLabel;
    lbWaveLengthUnit: TLabel;
    lbWindSpeed: TLabel;
    lbWindSpeedUnit: TLabel;
    pnMessage: TPanel;
    seCharacteristic: TRzSpinEdit;
    seClockAccuracy: TRzSpinEdit;
    seClockFrequency: TRzSpinEdit;
    seCounterBits: TRzSpinEdit;
    seFrequency: TRzSpinEdit;
    sePeriodes: TRzSpinEdit;
    seRange: TRzSpinEdit;
    seRdiameter: TRzSpinEdit;
    seRthick: TRzSpinEdit;
    seSalinity: TRzSpinEdit;
    seShipTraffic: TRzSpinEdit;
    seTdiameter: TRzSpinEdit;
    seTemperature: TRzSpinEdit;
    seTpower: TRzSpinEdit;
    seTthick: TRzSpinEdit;
    seWindSpeed: TRzSpinEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DoCalculations(Sender: TObject);
    procedure btSoundSpeedClick(Sender: TObject);
    procedure btExitClick(Sender: TObject);
    procedure btReportClick(Sender: TObject);
    procedure btAbsorptionLossClick(Sender: TObject);
    procedure btTbeamPatternClick(Sender: TObject);
    procedure btRbeamPatternClick(Sender: TObject);
    procedure btSonarClick(Sender: TObject);
    procedure btTransducerBeamwidthClick(Sender: TObject);
    procedure btSettingsClick(Sender: TObject);
    procedure edTbeamRatioChange(Sender: TObject);
    procedure edRbeamRatioChange(Sender: TObject);
  private
    function CreateReport(ExcelReport: OleVariant; aRow, aCol: Integer; Control: TControl): Integer;
  public
    procedure DispMessage(MsgText: string; MsgColor: TColor);
    function SaveParameter(ParFile: string): Boolean;
    function LoadParameter(ParFile: string): Boolean;
    function LoadMaterials(MatFile: string): Integer;
  end;

const
  DEFBEAMS       = 1;        // standard transmitter beams
  MAXBEAMS       = 16;       // max number of transmitter beams
  MAXRANGE       = 50;       // max beam level range [-dB]
  REFBEAM        = 3;        // standard beam width [-dB]
  REFDEPTH       = 3.0;      // standard operation depth [m]
  FRESHSALT      = 0.0;      // standard fresh water salinity [ppt]
  FRESHTEMP      = 8.0;      // standard fresh water temperature [°C]
  SEASALT        = 35.0;     // standard sea water salinity [ppt]
  SEATEMP        = 10.0;     // standard sea water temperature [°C]
  REFSOUND       = 1490.0;   // standard sound speed [m/s] @ 10°C / 35ppt
  REFLEVEL       = 170.8;    // reference source level [dB re 1uPa @ 1m]
  CAVITATION     = 0.2;      // cavitation threshold @ 5m depth [W/cm2]
  MAXMATERIALS   = 10;       // number of piezo materials
  MAXPROPERTIES  = 8;        // number of material properties
  DEFZOOM        = 72;       // default zoom magnifier [%]
  DEFANGLE       = -45;      // default angular offset [°]

//FORM_DATE      = 'DD.MM.YY'; // 19.02.22 obsolete - replaced
//FORM_TIME      = 'hh:nn:ss'; // by local date/time settings

  COL_ERR        = clRed;    // error color = red
  COL_NORM       = clNavy;   // message color = navy blue
  COL_BEAM       = clRed;    // beam angle color = red
  COL_DATA       = clBlue;   // beam data color = blue
  COL_ENV        = clBlack;  // beam envelope color = black

  EXCEL_APP      = 'Excel.Application';
  EXCEL_ERR      = 'Cannot open Excel Report!';
  EXCEL_TABLE    = 'Tabelle';
  EXCEL_GRAPH    = 'Grafik';
  EXCEL_DATA     = 'Sonar';
  EXCEL_TYPE     = '.xls';
  CHART_TYPE     = '.bmp';
  MATERIAL_END   = 'sdm';
  PARAMETER_END  = 'sdp';
  MATERIAL_TYPE  = cDOT + MATERIAL_END;
  PARAMETER_TYPE = cDOT + PARAMETER_END;
  PARAMETER_REG	= 'Sonar Parameter';
  PARAMETER_FILE = PARAMETER_REG + ' (*' + PARAMETER_TYPE + ')|*' + PARAMETER_TYPE;

  LOAD_ERR       = 'Loading Parameters from File failed!';
  SAVE_ERR       = 'Saving Parameters to File failed!';
  DEFTYPE        = 'Navy1';
  ULEVEL         = 'dB';
  USPEED         = 'm/s';

  //default piezo material properties (PZ26)
  DefProperty: array[1..MAXPROPERTIES] of Integer = (
    1300,   //1 = DC  - dielectric constant [-]
    2210,   //2 = NP  - planar frequency constant [m/s]
    1800,   //3 = NL  - length or longitudinal frequency constant [m/s]
    2038,   //4 = NT  - thickness frequency constant [m/s]
    7700,   //5 = MD  - material density [kg/m3]
      28,   //6 = G33 - voltage coefficient [mVm/N]
     300,   //7 = D33 - charge coefficient [pC/N]
      68);  //8 = K33 - coupling factor [%]

var
  FormMain: TFormMain;
  ChartShow: TFormShow;
  SonarShow: TFormShow;
  ShowBeamwidth: Boolean;
  ShowEnvelope: Boolean;
  ExcelApp: OleVariant;
  ExcelSheet: OleVariant;
  ExcelFile: string;
  ProjectName: string;
  ProjectFile: string;
  DesignerName: string;
  DefaultName: string;
  DataFolder: string;  //19.06.22 old=DefaultDir
  DefaultPar: string;
  DefaultMat: string;
  LeftOffset: Integer;
  TopOffset: Integer;
  BeamLevel: Integer;
  BeamRange: Integer;
  TransBeams: Integer;
  BeamZoom: Integer;
  BeamAngle: Integer;
  DiveDepth: Single;
  Tka, Rka, Tbw, Rbw: Single;

  MatProperties: array[0..MAXMATERIALS, 1..MAXPROPERTIES] of Integer;

  PenColors: array[1..MAXBEAMS] of TColor = (
    clBlue, clGreen, clRed, clMaroon,
    clFuchsia, clTeal, clNavy, clLime,
    clOlive, clPurple, clAqua, clSilver,
    clGray, clBlack, clYellow, clWhite);

implementation

{$R *.dfm}

procedure TFormMain.FormCreate(Sender: TObject);
begin
  Position      := poDesktopCenter;
  Caption       := ProductAgent; //19.06.22 old=ProductHeader;
  LeftOffset    := -6;
  TopOffset     := -10;

  ChartShow     := fsNone;
  SonarShow     := fsNone;
  ShowBeamwidth := True;
  ShowEnvelope  := False;

  DiveDepth     := REFDEPTH;
  BeamLevel     := REFBEAM;
  BeamRange     := MAXRANGE;
  TransBeams    := DEFBEAMS;
  BeamZoom      := DEFZOOM;
  BeamAngle     := DEFANGLE;

  DesignerName  := cEMPTY;
  ProjectName   := Application.Title;
  DefaultName   := ExtractFileName(Application.ExeName);
  DefaultName   := LeftStr(DefaultName, StrLen(PChar(DefaultName)) - 4);
  DataFolder    := ExtractFilePath(Application.ExeName);
  DataFolder    := IncludeTrailingPathDelimiter(DataFolder) + 'Data\'; // 19.06.22 add Data subfolder
  DefaultPar    := DataFolder + DefaultName + PARAMETER_TYPE;
  DefaultMat    := DataFolder + DefaultName + MATERIAL_TYPE;
  IniFile       := DefaultPar;  //14.07.05 nk add
  ProjectFile   := ExtractFileName(IniFile);

  //register Sonar Parameter Files to SonarDesigner application
  //RegisterFileType(PARAMETER_END, PARAMETER_REG, Application.ExeName); //19.06.22 del needs Administrator rights
  LoadMaterials(DefaultMat);
  DoCalculations(self);
end;

procedure TFormMain.FormActivate(Sender: TObject);
begin
  if DefaultPar <> cEMPTY then begin
    if ParamCount > 0 then DefaultPar := ParamStr(1);
    if LoadParameter(DefaultPar) then begin
      DoCalculations(self);
      DispMessage(DefaultPar, COL_NORM);
    end else begin
      DispMessage(LOAD_ERR, COL_ERR);
    end;
    DefaultPar := cEMPTY;
  end else begin
    DispMessage('Ready...', COL_NORM);
  end;

  Left       := Left + LeftOffset;
  Top        := Top  + TopOffset;
  LeftOffset := 0;
  TopOffset  := 0;
end;

procedure TFormMain.DoCalculations(Sender: TObject);
var
  Td, Th, Pa, K, Rd, Rh, MPt, MPr, ws, st, f, r, T, S, fc, ac, sp, z: Integer;
  Ln, Mt, wd, c, wl, tb, N1, N2, N3, N4, Mr, Ra, bf, tr, re: Single;
  Bt, Br, Kt, Kr, al, Bw, Bp, Pr, Pc, aw, es, dmin, dmax, bl: Single;
  SL, DIt, TL, RL, DT, NL, DIr, SE, SM, CT, MDt, MDr, Wt, Wr: Single;
  DCt, DCr, RAt, RAr, RRt, RRr, CPt, CPr, NAt, NAr, NRt, NRr: Single;

begin
  DispMessage(cEMPTY, COL_NORM);
  lbRbeamwidth.Caption := lbRbeamwidth.HelpKeyword + cMINUS + IntToStr(BeamLevel) + ULEVEL;
  lbTbeamwidth.Caption := lbTbeamwidth.HelpKeyword + cMINUS + IntToStr(BeamLevel) + ULEVEL;

  try
    //transmitter
    Td  := seTdiameter.IntValue;
    Th  := seTthick.IntValue;
    Pa  := seTpower.IntValue;
    K   := seCharacteristic.IntValue;
    MPt := cbTmaterial.ItemIndex;

    //receiver
    Rd  := seRdiameter.IntValue;
    Rh  := seRthick.IntValue;
    MPr := cbRmaterial.ItemIndex;

    //environment
    ws := seWindSpeed.IntValue;
    st := seShipTraffic.IntValue;

    //propagation
    f := seFrequency.IntValue;
    r := seRange.IntValue;
    T := seTemperature.IntValue;
    S := seSalinity.IntValue;

    //performance
    fc := seClockFrequency.IntValue;
    ac := seClockAccuracy.IntValue;
    sp := sePeriodes.IntValue;
    z  := seCounterBits.IntValue;

    //material properties (from material constant file)
    DCt := MatProperties[MPt, 1];
    DCr := MatProperties[MPr, 1];
    NRt := MatProperties[MPt, 2];
    NRr := MatProperties[MPr, 2];
    MDt := MatProperties[MPt, 5];
    MDr := MatProperties[MPr, 5];

    if Td < Th then //transmitter axial = length or longitudinal mode
      NAt := MatProperties[MPt, 3]
    else            //transmitter axial = thickness mode
      NAt := MatProperties[MPt, 4];

    if Rd < Rh then //receiver axial = length or longitudinal mode
      NAr := MatProperties[MPr, 3]
    else            //receiver axial = thickness mode
      NAr := MatProperties[MPr, 4];

    //basic calculations
    wd   := CalcDensity(T, S);
    c    := CalcSoundSpeed(T, S, DiveDepth);
    al   := CalcAbsorptionLoss(T, S, f);
    wl   := CalcWaveLength(c, f);
    Ln   := CalcNearField(Td, wl);
    Kt   := CalcBeamRatio(Td, wl);
    Mt   := CalcMainLobe(Td, wl);
    Bt   := CalcBeamWidth(Td, wl, BeamLevel);
    Kr   := CalcBeamRatio(Rd, wl);
    Mr   := CalcMainLobe(Rd, wl);
    Br   := CalcBeamWidth(Rd, wl, BeamLevel);
    tb   := CalcBurstDuration(sp, f);
    es   := CalcEchoSuppression(c, tb);
    Bw   := CalcBandWidth(tb);
    Bp   := CalcBandPass(tb);
    Pr   := CalcRadiatedPower(Td, Pa);
    Pc   := CalcCavitation(f, tb);
    aw   := CalcAcousticWindow(wl);
    bf   := CalcBeaufort(ws);
    tr   := CalcRepetitionTime(fc, z);
    dmin := CalcMinDistance(c, fc);
    dmax := CalcMaxDistance(c, fc, z);
    re   := CalcRangeError(c, ac);

    //09.10.05 nk add - piezo calculations
    Wt  := CalcWeight(Td, Th, MDt);
    Wr  := CalcWeight(Rd, Rh, MDr);
    CPt := CalcCapacitance(Td, Th, DCt);
    CPr := CalcCapacitance(Rd, Rh, DCr);
    RRt := CalcRadialResonance(Td, NRt);
    RRr := CalcRadialResonance(Rd, NRr);
    RAt := CalcAxialResonance(Th, NAt);
    RAr := CalcAxialResonance(Rh, NAr);

    //sonar calculations
    DIt := CalcDirectivityIndex(Td, wl);
    DIr := CalcDirectivityIndex(Rd, wl);
    N1  := CalcTurbulentNoise(f);
    N2  := CalcShippingNoise(f, st);
    N3  := CalcSurfaceNoise(f, ws);
    N4  := CalcThermalNoise(f);
    NL  := CalcNoiseLevel(N1, N2, N3, N4, Bw);
    TL  := CalcTransmissionLoss(K, r, al);
    SL  := CalcSourceLevel(Pa);
    DT  := CalcDetectionThreshold(tb);
    RL  := CalcSignalLevel(SL, TL, DIt, DIr);
    SE  := CalcSignalExcess(RL, NL);
    SM  := CalcSafetyMargin(SE, DT);
    CT  := CalcCavitationThreshold(Td, DiveDepth, DIt);

    //global parameter for beam pattern chart
    Tka := 10 * Kt; //transmitter beam ratio
    Rka := 10 * Kr; //receiver beam ratio
    Tbw := 10 * Bt; //transmitter beam width
    Rbw := 10 * Br; //receiver beam width

    edDensity.Text         := Format('%7.1f', [wd]);
    edSoundSpeed.Text      := Format('%7.1f', [c]);
    edAbsorptionLoss.Text  := Format('%7.2f', [al]);
    edWaveLength.Text      := Format('%7.2f', [wl]);
    edDisplacement.Text    := Format('%7.1f', [wl]);
    edNearField.Text       := Format('%7.2f', [Ln]);
    edTbeamRatio.Text      := Format('%7.1f', [Kt]);
    edTmainLobe.Text       := Format('%7.1f', [Mt]);
    edTbeamWidth.Text      := Format('%7.1f', [Bt]);
    edRbeamRatio.Text      := Format('%7.1f', [Kr]);
    edRmainLobe.Text       := Format('%7.1f', [Mr]);
    edRbeamWidth.Text      := Format('%7.1f', [Br]);
    edBurstDuration.Text   := Format('%7.0f', [tb]);
    edEchoSuppression.Text := Format('%7.2f', [es]);
    edBandWidth.Text       := Format('%7.1f', [Bw]);
    edBandPass.Text        := Format('%7.1f', [Bp]);
    edRadiatedPower.Text   := Format('%7.3f', [Pr]);
    edCavitation.Text      := Format('%7.3f', [Pc]);
    edTwindow.Text         := Format('%7.1f', [aw]);
    edRwindow.Text         := Format('%7.1f', [aw]);
    edBeaufort.Text        := Format('%7.1f', [bf]);
    edRepetitionTime.Text  := Format('%7.2f', [tr]);
    edMinDistance.Text     := Format('%7.2f', [dmin]);
    edMaxDistance.Text     := Format('%7.1f', [dmax]);
    edRangeError.Text      := Format('%7.2f', [re]);

    edTdirectivity.Text     := Format('%7.1f', [DIt]);
    edSourceLevel.Text      := Format('%7.1f', [SL]);
    edCavitationLevel.Text  := Format('%7.1f', [CT]);
    edRdirectivity.Text     := Format('%7.1f', [DIr]);
    edSignalLevel.Text      := Format('%7.1f', [RL]);
    edTurbulentNoise.Text   := Format('%7.1f', [N1]);
    edShippingNoise.Text    := Format('%7.1f', [N2]);
    edSurfaceNoise.Text     := Format('%7.1f', [N3]);
    edThermalNoise.Text     := Format('%7.1f', [N4]);
    edNoiseLevel.Text       := Format('%7.1f', [NL]);
    edTransmissionLoss.Text := Format('%7.1f', [TL]);
    edThreshold.Text        := Format('%7.1f', [DT]);
    edSignalExcess.Text     := Format('%7.1f', [SE]);
    edSafetyMargin.Text     := Format('%7.1f', [SM]);

    //09.10.05 nk add ff
    edTweight.Text  := Format('%7.1f', [Wt]);
    edRweight.Text  := Format('%7.1f', [Wr]);
    edTcapacit.Text := Format('%7.0f', [CPt]);
    edRcapacit.Text := Format('%7.0f', [CPr]);
    edTradial.Text  := Format('%7.1f', [RRt]);
    edRradial.Text  := Format('%7.1f', [RRr]);
    edTaxial.Text   := Format('%7.1f', [RAt]);
    edRaxial.Text   := Format('%7.1f', [RAr]);

    if SonarShow = fsSonar then begin
      FormSonar.edTdirectivity.Text     := Format('%6.1f', [DIt]);
      FormSonar.edRdirectivity.Text     := Format('%6.1f', [DIr]);
      FormSonar.edNoiseLevel1.Text      := Format('%6.1f', [NL]);
      FormSonar.edNoiseLevel2.Text      := Format('%6.1f', [NL]);
      FormSonar.edTransmissionLoss.Text := Format('%6.1f', [TL]);
      FormSonar.edSourceLevel1.Text     := Format('%6.1f', [SL]);
      FormSonar.edSourceLevel2.Text     := Format('%6.1f', [SL + DIt + DIr]);
      FormSonar.edThreshold.Text        := Format('%6.1f', [DT]);
      FormSonar.edSignalLevel.Text      := Format('%6.1f', [RL]);
      FormSonar.edSignalExcess.Text     := Format('%6.1f', [SE]);
      FormSonar.edSafetyMargin.Text     := Format('%6.1f', [SM]);
    end;

    if (dmax < 2 * r) then DispMessage('Max. Distance should be twice the Operating Range!', COL_ERR);
    if Rd > wl then DispMessage('Receiver Displacement is too small!', COL_ERR);
    if SL > CT then DispMessage('Transmitter Cavitation may occur!', COL_ERR);
    if Pr > Pc then DispMessage('Transmitter Cavitation may occur!', COL_ERR);
    if SE < DT then DispMessage('Receiver Safety Margin is too low!', COL_ERR);
  except
    on E: Exception do begin
      DispMessage(E.Message + '!', COL_ERR);
      Beep;
    end;
  end;
  Application.ProcessMessages;
end;

procedure TFormMain.btTransducerBeamwidthClick(Sender: TObject);
var
  d, wl: Integer;
  col, row: Integer;
  c: Single;
begin
  Screen.Cursor := crHourGlass;
  c := Round(StrToFloat(edSoundSpeed.Text));
  ExcelFile := DataFolder + edTbeamwidth.Hint + EXCEL_TYPE;

  try
    ExcelApp := CreateOleObject(EXCEL_APP);
    ExcelApp.Workbooks.Open(ExcelFile);
    ExcelApp.Visible := True;
    ExcelSheet := ExcelApp.Worksheets.Item[EXCEL_TABLE];
    ExcelSheet.Activate;
    ExcelSheet.Cells.Item[2, 5].Value := Format('Beamwidth Level = -%d %s', [BeamLevel, ULEVEL]);
    ExcelSheet.Cells.Item[4, 5].Value := Format('Sound Speed = %f %s', [c, USPEED]);
  except
    Screen.Cursor := crDefault;
    MessageDlg(EXCEL_ERR, mtError, [mbOk], 0);
    Exit;
  end;

  for col := 0 to 7 do begin
    wl := 5 * col + 50;        //frequency (50..85kHz)
    wl := Round(c / wl);       //wave length [mm]
    for row := 0 to 19 do begin
      d := 2 * row + 18;       //diameter (18..56mm)
      ExcelSheet.Cells.Item[row + 7, col + 5].Value := Format('%4.2f', [CalcBeamWidth(d, wl, BeamLevel)]);
    end;
  end;

  ExcelSheet := ExcelApp.Worksheets.Item[EXCEL_GRAPH];
  ExcelSheet.Activate;
  Screen.Cursor := crDefault;
end;

procedure TFormMain.btAbsorptionLossClick(Sender: TObject);
var
  T, f: Integer;
  col, row: Integer;
  S: Single;
begin
  Screen.Cursor := crHourGlass;
  S := seSalinity.Value;
  ExcelFile := DataFolder + edAbsorptionLoss.Hint + EXCEL_TYPE;

  try
    ExcelApp := CreateOleObject(EXCEL_APP);
    ExcelApp.Workbooks.Open(ExcelFile);
    ExcelApp.Visible := True;
    ExcelSheet := ExcelApp.Worksheets.Item[EXCEL_TABLE];
    ExcelSheet.Activate;
    ExcelSheet.Cells.Item[2, 5].Value := 'Schulkin & Marsh (1962)';
    ExcelSheet.Cells.Item[4, 5].Value := Format('Salinity = %f ppt', [S]);
  except
    Screen.Cursor := crDefault;
    MessageDlg(EXCEL_ERR, mtError, [mbOk], 0);
    Exit;
  end;

  for col := 0 to 8 do begin
    T := 5 * col;             //temperature (0...40°C)
    for row := 0 to 19 do begin
      f := 10 * (row + 1);    //frequency 10..200kHz)
      ExcelSheet.Cells.Item[row + 7, col + 5].Value := Format('%4.2f', [CalcAbsorptionLoss(T, S, f)]);
    end;
  end;

  ExcelSheet := ExcelApp.Worksheets.Item[EXCEL_GRAPH];
  ExcelSheet.Activate;
  Screen.Cursor := crDefault;
end;

procedure TFormMain.btSoundSpeedClick(Sender: TObject);
var
  T, S: Integer;
  col, row: Integer;
  D: Single;
begin
  Screen.Cursor := crHourGlass;
  D := DiveDepth;
  ExcelFile := DataFolder + edSoundSpeed.Hint + EXCEL_TYPE;

  try
    ExcelApp := CreateOleObject(EXCEL_APP);
    ExcelApp.Workbooks.Open(ExcelFile);
    ExcelApp.Visible := True;
    ExcelSheet := ExcelApp.Worksheets.Item[EXCEL_TABLE];
    ExcelSheet.Activate;
    ExcelSheet.Cells.Item[2, 5].Value := 'Medwin (1975)';
    ExcelSheet.Cells.Item[4, 5].Value := Format('Depth = %f m', [D]);
  except
    Screen.Cursor := crDefault;
    MessageDlg(EXCEL_ERR, mtError, [mbOk], 0);
    Exit;
  end;

  for col := 0 to 8 do begin
    S := 5 * col;   //salinity (0..40ppt)
    for row := 0 to 17 do begin
      T := 2 * row; //temperature (0..34°C)
      ExcelSheet.Cells.Item[row + 7, col + 5].Value := Format('%4.2f', [CalcSoundSpeed(T, S, D)]);
    end;
  end;

  ExcelSheet := ExcelApp.Worksheets.Item[EXCEL_GRAPH];
  ExcelSheet.Activate;
  Screen.Cursor := crDefault;
end;

procedure TFormMain.btExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFormMain.btSettingsClick(Sender: TObject);
begin
   FormChart.Close;
   FormSonar.Close;
   FormParameter.Show;
end;

procedure TFormMain.btReportClick(Sender: TObject);
var
  i, r, row: Integer;
  sTchart: string;
  sRchart: string;
  sSonar: string;
  Control: TControl;
begin
  Screen.Cursor := crHourGlass;
  ExcelFile := DataFolder + FormMain.Hint      + EXCEL_TYPE;
  sTchart   := DataFolder + gbTransmitter.Hint + CHART_TYPE;
  sRchart   := DataFolder + gbReceiver.Hint    + CHART_TYPE;
  sSonar    := DataFolder + FormSonar.Hint     + CHART_TYPE;

  //save sonar equation diagram as bitmap file
  SonarShow := fsSonar;
  FormSonar.Show;
  DoCalculations(self);
  FormSonar.FormBitmap(sSonar);
  FormSonar.Close;

  //save beam patterns as bitmap files
  FormChart.FormBitmap(sTchart, sRchart);
  FormChart.Close;

  //export sonar system parameter to excel data sheet
  try
    ExcelApp := CreateOleObject(EXCEL_APP);
    ExcelApp.Workbooks.Open(ExcelFile);
    ExcelApp.Visible := True;
    ExcelSheet := ExcelApp.Worksheets.Item[EXCEL_DATA];
    ExcelSheet.Activate;
    if ProjectName <> cEMPTY then
      ExcelSheet.PageSetup.LeftHeader := '&12 &K &F ' + ProjectName;
  except
    Screen.Cursor := crDefault;
    ExcelApp.Quit;
    MessageDlg(EXCEL_ERR, mtError, [mbOk], 0);
    Exit;
  end;

  //transmitter parameter
  row := 2;
  ExcelSheet.Cells.Item[row, 1].Font.Bold := True;
  if TransBeams > DEFBEAMS then
    ExcelSheet.Cells.Item[row, 1].Value := Trim(gbTransmitter.Caption) + 's (' + IntToStr(TransBeams) + ')'
  else
    ExcelSheet.Cells.Item[row, 1].Value := Trim(gbTransmitter.Caption);
  ExcelSheet.Cells.Item[row, 5].Select;
  ExcelSheet.Pictures.Insert(sTchart).Select;

  r := 0;
  for i := 0 to gbTransmitter.ControlCount - 1 do begin
    Control := gbTransmitter.Controls[i];
    r := Max(CreateReport(ExcelSheet, row, 0, Control), r);
  end;

  //receiver parameter
  row := r + 2;
  ExcelSheet.Cells.Item[row, 1].Font.Bold := True;
  ExcelSheet.Cells.Item[row, 1].Value := Trim(gbReceiver.Caption);
  ExcelSheet.Cells.Item[row, 5].Select;
  ExcelSheet.Pictures.Insert(sRchart).Select;

  r := 0;
  for i := 0 to gbReceiver.ControlCount - 1 do begin
    Control := gbReceiver.Controls[i];
    r := Max(CreateReport(ExcelSheet, row, 0, Control), r);
  end;

  //environment parameter
  row := r + 2;
  ExcelSheet.Cells.Item[row, 1].Font.Bold := True;
  ExcelSheet.Cells.Item[row, 1].Value := Trim(gbEnvironment.Caption);

  r := 0;
  for i := 0 to gbEnvironment.ControlCount - 1 do begin
    Control := gbEnvironment.Controls[i];
    r := Max(CreateReport(ExcelSheet, row, 0, Control), r);
  end;

  //propagation parameter
  row := r + 2;
  ExcelSheet.Cells.Item[row, 1].Font.Bold := True;
  ExcelSheet.Cells.Item[row, 1].Value := Trim(gbPropagation.Caption);
  ExcelSheet.Cells.Item[row, 5].Select;
  ExcelSheet.Pictures.Insert(sSonar).Select;

  r := 0;
  for i := 0 to gbPropagation.ControlCount - 1 do begin
    Control := gbPropagation.Controls[i];
    r := Max(CreateReport(ExcelSheet, row, 0, Control), r);
  end;

  //performance parameter
  row := r + 2;
  ExcelSheet.Cells.Item[row, 1].Font.Bold := True;
  ExcelSheet.Cells.Item[row, 1].Value := Trim(gbPerformance.Caption);

  r := 0;
  for i := 0 to gbPerformance.ControlCount - 1 do begin
    Control := gbPerformance.Controls[i];
    r := Max(CreateReport(ExcelSheet, row, 0, Control), r);
  end;

  ExcelSheet.Cells.Item[1, 1].Select;
  ExcelSheet.Activate;
  Screen.Cursor := crDefault;
end;

procedure TFormMain.DispMessage(MsgText: string; MsgColor: TColor);
begin
  with lbMessage do begin
    Font.Color := MsgColor;
    Hint       := cSPACE + MsgText + cSPACE;
    Caption    := MinimizeName(MsgText, Canvas, Width);
  end;
  Application.ProcessMessages;
end;

function TFormMain.SaveParameter(ParFile: string): Boolean;
var
  i: Integer;
  sSection: string;
  sName: string;
  sValue: string;
  Control: TControl;
begin
  try //to save system parameter
    IniFile := ParFile; //05.10.05 nk add
    sSection := Trim(FormParameter.pnParameter.Hint);

    for i := 0 to FormParameter.pnParameter.ControlCount - 1 do begin
      Control := FormParameter.pnParameter.Controls[i];
      if (Control as TComponent) is TEdit then begin
        sName  := (Control as TEdit).Name;
        sName  := RightStr(sName, StrLen(PChar(sName)) - 2);
        sValue := (Control as TEdit).Text;
        SetIniValue(sSection, sName, sValue);
      end;

      if (Control as TComponent) is TRzSpinEdit then begin
        sName  := (Control as TRzSpinEdit).Name;
        sName  := RightStr(sName, StrLen(PChar(sName)) - 2);
        sValue := IntToStr((Control as TRzSpinEdit).IntValue);
        SetIniValue(sSection, sName, sValue);
      end;

      if (Control as TComponent) is TRzCheckBox then begin
        sName  := (Control as TRzCheckBox).Name;
        sName  := RightStr(sName, StrLen(PChar(sName)) - 2);
        sValue := BoolToStr((Control as TRzCheckBox).Checked);
        SetIniValue(sSection, sName, sValue);
      end;
    end;

    //save transmitter parameter
    sSection := Trim(gbTransmitter.Caption);

    for i := 0 to gbTransmitter.ControlCount - 1 do begin
      Control := gbTransmitter.Controls[i];
      if (Control as TComponent) is TRzSpinEdit then begin
        sName  := (Control as TRzSpinEdit).Name;
        sName  := RightStr(sName, StrLen(PChar(sName)) - 2);
        sValue := IntToStr((Control as TRzSpinEdit).IntValue);
        SetIniValue(sSection, sName, sValue);
      end;

      if (Control as TComponent) is TRzComboBox then begin
        sName  := (Control as TRzComboBox).Name;
        sName  := RightStr(sName, StrLen(PChar(sName)) - 2);
        sValue := IntToStr((Control as TRzComboBox).ItemIndex);
        SetIniValue(sSection, sName, sValue);
      end;
    end;

    //save receiver parameter
    sSection := Trim(gbReceiver.Caption);

    for i := 0 to gbReceiver.ControlCount - 1 do begin
      Control := gbReceiver.Controls[i];
      if (Control as TComponent) is TRzSpinEdit then begin
        sName  := (Control as TRzSpinEdit).Name;
        sName  := RightStr(sName, StrLen(PChar(sName)) - 2);
        sValue := IntToStr((Control as TRzSpinEdit).IntValue);
        SetIniValue(sSection, sName, sValue);
      end;

      if (Control as TComponent) is TRzComboBox then begin
        sName  := (Control as TRzComboBox).Name;
        sName  := RightStr(sName, StrLen(PChar(sName)) - 2);
        sValue := IntToStr((Control as TRzComboBox).ItemIndex);
        SetIniValue(sSection, sName, sValue);
      end;
    end;

    //save environment parameter
    sSection := Trim(gbEnvironment.Caption);

    for i := 0 to gbEnvironment.ControlCount - 1 do begin
      Control := gbEnvironment.Controls[i];
      if (Control as TComponent) is TRzSpinEdit then begin
        sName  := (Control as TRzSpinEdit).Name;
        sName  := RightStr(sName, StrLen(PChar(sName)) - 2);
        sValue := IntToStr((Control as TRzSpinEdit).IntValue);
        SetIniValue(sSection, sName, sValue);
      end;
    end;

    //save propagation parameter
    sSection := Trim(gbPropagation.Caption);

    for i := 0 to gbPropagation.ControlCount - 1 do begin
      Control := gbPropagation.Controls[i];
      if (Control as TComponent) is TRzSpinEdit then begin
        sName  := (Control as TRzSpinEdit).Name;
        sName  := RightStr(sName, StrLen(PChar(sName)) - 2);
        sValue := IntToStr((Control as TRzSpinEdit).IntValue);
        SetIniValue(sSection, sName, sValue);
      end;
    end;

    //save performance parameter
    sSection := Trim(gbPerformance.Caption);

    for i := 0 to gbPerformance.ControlCount - 1 do begin
      Control := gbPerformance.Controls[i];
      if (Control as TComponent) is TRzSpinEdit then begin
        sName  := (Control as TRzSpinEdit).Name;
        sName  := RightStr(sName, StrLen(PChar(sName)) - 2);
        sValue := IntToStr((Control as TRzSpinEdit).IntValue);
        SetIniValue(sSection, sName, sValue);
      end;
    end;
    Result := True;
  except
    Result := False;
  end;
end;

function TFormMain.LoadParameter(ParFile: string): Boolean;
var
  i: Integer;
  sSection: string;
  sName: string;
  sValue: string;
  Control: TControl;

begin
  Result := False;
  if not FileExists(ParFile) then Exit;

  try //to load system parameter
    IniFile  := ParFile; //05.10.05 nk add
    sSection := Trim(FormParameter.pnParameter.Hint);

    for i := 0 to FormParameter.pnParameter.ControlCount - 1 do begin
      Control := FormParameter.pnParameter.Controls[i];
      if (Control as TComponent) is TEdit then begin
        sName  := (Control as TEdit).Name;
        sName  := RightStr(sName, StrLen(PChar(sName)) - 2);
        sValue := Trim((Control as TEdit).Text);
        sValue := GetIniValue(sSection, sName, sValue);
        (Control as TEdit).Text := sValue;
      end;

      if (Control as TComponent) is TRzSpinEdit then begin
        sName  := (Control as TRzSpinEdit).Name;
        sName  := RightStr(sName, StrLen(PChar(sName)) - 2);
        sValue := IntToStr((Control as TRzSpinEdit).IntValue);
        sValue := GetIniValue(sSection, sName, sValue);
        (Control as TRzSpinEdit).Value := StrToInt(sValue);
      end;

      if (Control as TComponent) is TRzCheckBox then begin
        sName  := (Control as TRzCheckBox).Name;
        sName  := RightStr(sName, StrLen(PChar(sName)) - 2);
        sValue := GetIniValue(sSection, sName, sValue);
        (Control as TRzCheckBox).Checked := StrToBool(sValue);
      end;
    end;

    //load transmitter parameter
    sSection := Trim(gbTransmitter.Caption);

    for i := 0 to gbTransmitter.ControlCount - 1 do begin
      Control := gbTransmitter.Controls[i];
      if (Control as TComponent) is TRzSpinEdit then begin
        sName  := (Control as TRzSpinEdit).Name;
        sName  := RightStr(sName, StrLen(PChar(sName)) - 2);
        sValue := IntToStr((Control as TRzSpinEdit).IntValue);
        sValue := GetIniValue(sSection, sName, sValue);
        (Control as TRzSpinEdit).Value := StrToInt(sValue);
      end;

      if (Control as TComponent) is TRzComboBox then begin
        sName  := (Control as TRzComboBox).Name;
        sName  := RightStr(sName, StrLen(PChar(sName)) - 2);
        sValue := IntToStr((Control as TRzComboBox).ItemIndex);
        sValue := GetIniValue(sSection, sName, sValue);
        (Control as TRzComboBox).ItemIndex := StrToInt(sValue);
      end;
    end;

    //load receiver parameter
    sSection := Trim(gbReceiver.Caption);

    for i := 0 to gbReceiver.ControlCount - 1 do begin
      Control := gbReceiver.Controls[i];
      if (Control as TComponent) is TRzSpinEdit then begin
        sName  := (Control as TRzSpinEdit).Name;
        sName  := RightStr(sName, StrLen(PChar(sName)) - 2);
        sValue := IntToStr((Control as TRzSpinEdit).IntValue);
        sValue := GetIniValue(sSection, sName, sValue);
        (Control as TRzSpinEdit).Value := StrToInt(sValue);
      end;

      if (Control as TComponent) is TRzComboBox then begin
        sName  := (Control as TRzComboBox).Name;
        sName  := RightStr(sName, StrLen(PChar(sName)) - 2);
        sValue := IntToStr((Control as TRzComboBox).ItemIndex);
        sValue := GetIniValue(sSection, sName, sValue);
        (Control as TRzComboBox).ItemIndex := StrToInt(sValue);
      end;
    end;

    //load environment parameter
    sSection := Trim(gbEnvironment.Caption);

    for i := 0 to gbEnvironment.ControlCount - 1 do begin
      Control := gbEnvironment.Controls[i];
      if (Control as TComponent) is TRzSpinEdit then begin
        sName  := (Control as TRzSpinEdit).Name;
        sName  := RightStr(sName, StrLen(PChar(sName)) - 2);
        sValue := IntToStr((Control as TRzSpinEdit).IntValue);
        sValue := GetIniValue(sSection, sName, sValue);
        (Control as TRzSpinEdit).Value := StrToInt(sValue);
      end;
    end;

    //load propagation parameter
    sSection := Trim(gbPropagation.Caption);

    for i := 0 to gbPropagation.ControlCount - 1 do begin
      Control := gbPropagation.Controls[i];
      if (Control as TComponent) is TRzSpinEdit then begin
       sName   := (Control as TRzSpinEdit).Name;
        sName  := RightStr(sName, StrLen(PChar(sName)) - 2);
        sValue := IntToStr((Control as TRzSpinEdit).IntValue);
        sValue := GetIniValue(sSection, sName, sValue);
        (Control as TRzSpinEdit).Value := StrToInt(sValue);
      end;
    end;

    //load performance parameter
    sSection := Trim(gbPerformance.Caption);

    for i := 0 to gbPerformance.ControlCount - 1 do begin
      Control := gbPerformance.Controls[i];
      if (Control as TComponent) is TRzSpinEdit then begin
        sName  := (Control as TRzSpinEdit).Name;
        sName  := RightStr(sName, StrLen(PChar(sName)) - 2);
        sValue := IntToStr((Control as TRzSpinEdit).IntValue);
        sValue := GetIniValue(sSection, sName, sValue);
        (Control as TRzSpinEdit).Value := StrToInt(sValue);
      end;
    end;
    FormParameter.SetParameter;
    Result := True;
  except
    FormParameter.SetDefault;
    Result := False;
  end;
end;

function TFormMain.LoadMaterials(MatFile: string): Integer;
var
  i, j, iNum: Integer;
  sValues: TStringList;
  sMaterials: TStringList;
begin
  Result := 0;
  cbTmaterial.Clear;
  cbRmaterial.Clear;
  cbTmaterial.Items.Append(DEFTYPE);
  cbRmaterial.Items.Append(DEFTYPE);
  cbTmaterial.ItemIndex := 0;
  cbRmaterial.ItemIndex := 0;

  for i := 0 to MAXMATERIALS do
    for j := 1 to MAXPROPERTIES do //0 = material name
      MatProperties[i, j] := DefProperty[j];

  if not FileExists(MatFile) then Exit;

  sValues := TStringList.Create;
  sMaterials := TStringList.Create;

  try
    sValues.Clear;
    sMaterials.Clear;
    try
      sMaterials.LoadFromFile(MatFile);
      iNum := sMaterials.Count - 1;
      if iNum > 0 then begin
        for i := 1 to iNum do begin
          sValues.CommaText := sMaterials.Strings[i];
          cbTmaterial.Items.Append(sValues.Strings[0]);
          cbRmaterial.Items.Append(sValues.Strings[0]);
          for j := 1 to MAXPROPERTIES do
            MatProperties[i, j] := StrToInt(sValues.Strings[j]);
        end;
      end;
      Result := iNum;
    except
      Result := 0;
    end;
  finally
    sValues.Free;
    sMaterials.Free;
  end;
end;

function TFormMain.CreateReport(ExcelReport: OleVariant; aRow, aCol: Integer; Control: TControl): Integer;
var
  col, row: Integer;
  sHint: string;
begin
  col := 0;
  row := 0;

  if (Control as TComponent) is TLabel then begin
    if Control.Tag > 100 then begin
      if Control.Hint <> cEMPTY then
        sHint := ' (' + Trim(Control.Hint) + ')'
      else
        sHint := cEMPTY;
      row := aRow + Control.Tag mod 100;  //row
      col := aCol + Control.Tag div 100;  //column
      ExcelReport.Cells.Item[row, col].Value := (Control as TLabel).Caption + sHint;
    end;
  end;

  if (Control as TComponent) is TRzSpinEdit then begin
    if Control.Tag > 100 then begin
      row := aRow + Control.Tag mod 100;  //row
      col := aCol + Control.Tag div 100;  //column
      ExcelReport.Cells.Item[row, col].Value := (Control as TRzSpinEdit).Value;
    end;
  end;

  if (Control as TComponent) is TEdit then begin
    if Control.Tag > 100 then begin
      row := aRow + Control.Tag mod 100;  //row
      col := aCol + Control.Tag div 100;  //column
      ExcelReport.Cells.Item[row, col].Value := (Control as TEdit).Text;
    end;
  end;

  if (Control as TComponent) is TRzComboBox then begin
    if Control.Tag > 100 then begin
      row := aRow + Control.Tag mod 100;  //row
      col := aCol + Control.Tag div 100;  //column
      ExcelReport.Cells.Item[row, col].Value := (Control as TRzComboBox).Text;
    end;
  end;

  Result := row;
end;

procedure TFormMain.btTbeamPatternClick(Sender: TObject);
begin
  ChartShow := fsTransmitter;
  FormChart.sbMainLobe.Position  := Round(Tka);
  FormChart.sbBeamWidth.Position := Round(Tbw);
  FormChart.Caption := ' Transmitter Beam Pattern';
  FormChart.Show;
end;

procedure TFormMain.btRbeamPatternClick(Sender: TObject);
begin
  ChartShow := fsReceiver;
  FormChart.sbMainLobe.Position  := Round(Rka);
  FormChart.sbBeamWidth.Position := Round(Rbw);
  FormChart.Caption := ' Receiver Beam Pattern';
  FormChart.Show;
end;

procedure TFormMain.btSonarClick(Sender: TObject);
begin
  SonarShow := fsSonar;
  FormSonar.Show;
  DoCalculations(self);
end;

procedure TFormMain.edTbeamRatioChange(Sender: TObject);
begin
  if ChartShow = fsTransmitter then begin
    FormChart.sbMainLobe.Position  := Round(Tka);
    FormChart.sbBeamWidth.Position := Round(Tbw);
  end;
end;

procedure TFormMain.edRbeamRatioChange(Sender: TObject);
begin
  if ChartShow = fsReceiver then begin
    FormChart.sbMainLobe.Position  := Round(Rka);
    FormChart.sbBeamWidth.Position := Round(Rbw);
  end;
end;


end.
