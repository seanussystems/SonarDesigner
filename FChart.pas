// Beam Pattern Charts
// Date 18.06.22

unit FChart;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Forms, Controls, Dialogs,
  StdCtrls, ExtCtrls, Math, RzButton, RzRadChk, RzSpnEdt, UGlobal, PolarChart;

type
  TFormChart = class(TForm)
    cbBeamWidth: TRzCheckBox;
    cbEnvelope: TRzCheckBox;
    edAngle: TEdit;
    edLevel: TEdit;
    lbAngleUnit: TLabel;
    lbLevelUnit: TLabel;
    pcBeamPattern: TPolarChart; // 18.06.22 update to Dive Charts Vers 2.0
    sbBeamWidth: TScrollBar;
    sbMainLobe: TScrollBar;
    spZoom: TRzSpinner;
    spAngle: TRzSpinner;
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormBitmap(sTchart, sRchart: string);
    procedure pcBeamPatternMouseMoveInChart(Sender: TObject; InChart: Boolean; Shift: TShiftState; rMousePosX, rMousePosY: Double);
    procedure pcBeamPatternMouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure pcBeamPatternMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure sbMainLobeChange(Sender: TObject);
    procedure cbBeamWidthClick(Sender: TObject);
    procedure cbEnvelopeClick(Sender: TObject);
    procedure spZoomChange(Sender: TObject);
    procedure spAngleChange(Sender: TObject);
  private
    procedure DrawBeamPattern(ka: Single);
    procedure DrawBeamWidth(bw: Single);
  public
    { Public declarations }
  end;

const
  BEAM_FORM  = '%7.1f';
  BEAM_FULL  = 360;
  BEAM_HALF  = 180;
  BEAM_FIRST = 90;
  BEAM_LAST  = 270;
  BEAM_STEP  = 5;   //chart angular step [°]

var
  FormChart: TFormChart;
  MouseAngle: Double;

implementation

uses FMain, FSonar;

{$R *.dfm}

procedure TFormChart.FormShow(Sender: TObject);
begin
  FormChart.Left := 10;
  FormChart.Top  := 10;
  MouseAngle     := 0;

  sbMainLobe.Visible  := False;
  sbBeamWidth.Visible := False;
  cbBeamWidth.Checked := ShowBeamwidth;
  cbEnvelope.Checked  := ShowEnvelope;

  cbBeamWidth.Caption := 'Show -' + IntToStr(BeamLevel) + ULEVEL + ' Beamwidth';
  edLevel.Text        := cEMPTY;
  edAngle.Text        := cEMPTY;
  spZoom.Value        := BeamZoom;
  spAngle.Value       := BeamAngle;

  with pcBeamPattern do begin
    CenterChart;
    ClearGraf;
    RangeLow         := -BeamRange;
    RangeHigh        := 0;
    LineWidth        := 1;
    MagFactor        := BeamZoom / PROCENT;
    AngleOffset      := BeamAngle;
    DataColor        := COL_DATA;
    TransparentItems := True;
    UseDegrees       := True;
    RotationDir      := rdClockwise;
    CrossHair1.Mode  := chOff;
    LabelModeAngular := almDegrees;
    LabelModeRadial  := rlmNone;
    GridStyleAngular := gsAngDots;
    GridStyleRadial  := gsRadBothMixed;
  end;
end;

procedure TFormChart.FormActivate(Sender: TObject);
begin
  FormChart.Left := FormMain.Left - FormChart.Width;
  if ChartShow = fsTransmitter then
    FormChart.Top := FormMain.Top + FormMain.gbTransmitter.Top + 20;

  if ChartShow = fsReceiver then
    FormChart.Top := FormMain.Top + FormMain.gbReceiver.Top + 20;

  if (ChartShow = fsTransmitter) and (TransBeams > DEFBEAMS) then begin
    cbEnvelope.Enabled := True;
    cbEnvelope.Checked := ShowEnvelope;
  end else begin
    cbEnvelope.Enabled := False;
    cbEnvelope.Checked := False;
  end;

  DrawBeamPattern(sbMainLobe.Position);
  if cbBeamWidth.Checked then
    DrawBeamWidth(sbBeamWidth.Position);
end;

procedure TFormChart.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ChartShow := fsNone;
end;

procedure TFormChart.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  edLevel.Text := cEMPTY;
  edAngle.Text := cEMPTY;
end;

procedure TFormChart.FormBitmap(sTchart, sRchart: string);
begin
  //save transmitter beam pattern as bitmap file
  ChartShow            := fsTransmitter;
  sbMainLobe.Position  := Round(Tka);
  sbBeamWidth.Position := Round(Tbw);
  FormChart.Show;
  cbBeamWidth.Checked  := ShowBeamwidth;
  cbEnvelope.Checked   := ShowEnvelope;
  pcBeamPattern.CopyToBMP(sTchart, False);
  FormChart.Close;

  //save receiver beam pattern as bitmap file
  ChartShow := fsReceiver;
  sbMainLobe.Position  := Round(Rka);
  sbBeamWidth.Position := Round(Rbw);
  FormChart.Show;
  cbBeamWidth.Checked := ShowBeamwidth;
  cbEnvelope.Checked  := False;
  pcBeamPattern.CopyToBMP(sRchart, False);
  FormChart.Close;
  ChartShow := fsNone;
end;

procedure TFormChart.sbMainLobeChange(Sender: TObject);
begin
  DrawBeamPattern(sbMainLobe.Position);
  if cbBeamWidth.Checked then
    DrawBeamWidth(sbBeamWidth.Position);
end;

procedure TFormChart.cbBeamWidthClick(Sender: TObject);
begin
  ShowBeamwidth := cbBeamWidth.Checked;
  if cbBeamWidth.Checked then
    DrawBeamWidth(sbBeamWidth.Position)
  else
    DrawBeamPattern(sbMainLobe.Position);
end;

procedure TFormChart.cbEnvelopeClick(Sender: TObject);
begin
  if (ChartShow = fsTransmitter) and (TransBeams > DEFBEAMS) then
    ShowEnvelope := cbEnvelope.Checked;

  DrawBeamPattern(sbMainLobe.Position);
  if cbBeamWidth.Checked then
    DrawBeamWidth(sbBeamWidth.Position);
end;

procedure TFormChart.spZoomChange(Sender: TObject);
begin
  BeamZoom := spZoom.Value;
  pcBeamPattern.MagFactor := BeamZoom / PROCENT;
end;

procedure TFormChart.spAngleChange(Sender: TObject);
begin
  BeamAngle := spAngle.Value;
  pcBeamPattern.AngleOffset := BeamAngle;
end;

procedure TFormChart.pcBeamPatternMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if ssLeft in Shift then
    pcBeamPattern.CrossHair1.Mode := chPolar;
end;

procedure TFormChart.pcBeamPatternMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  with pcBeamPattern do begin
    CrossHair1.Mode := chOff;
    AngleOffset     := Round(AngleOffset / BEAM_STEP) * BEAM_STEP;
    spAngle.Value   := Round(AngleOffset);
  end;
end;

procedure TFormChart.pcBeamPatternMouseMoveInChart(Sender: TObject; InChart: Boolean;
  Shift: TShiftState; rMousePosX, rMousePosY: Double);
var
  a: Integer;
begin
  a := Round(pcBeamPattern.AngleOffset + BEAM_HALF);

  if ssRight in Shift then begin //turn chart around the middle
    if rMousePosY > MouseAngle then
      a := (a + 1) mod BEAM_FULL
    else
      a := (a - 1) mod BEAM_FULL;

    pcBeamPattern.AngleOffset := a - BEAM_HALF;
    spAngle.Value := Round(pcBeamPattern.AngleOffset);
    edLevel.Text  := cEMPTY;
    edAngle.Text  := cEMPTY;
  end else begin
    edLevel.Text  := Format(BEAM_FORM, [rMousePosX]);
    edAngle.Text  := Format(BEAM_FORM, [rMousePosY]);
  end;

  if ssLeft in Shift then
    pcBeamPattern.CrossHair1.SetPosition (rMousePosX, rMousePosY);

  MouseAngle := rMousePosY;
end;

procedure TFormChart.DrawBeamPattern(ka: Single);
var // draw beam pattern of transducer as polar chart
  first: Boolean;
  a, b, tb, aint: Integer;
  x, h, bp, ta, apol: Double;
  bsum: array[0..BEAM_FULL] of Double;
begin
  tb := DEFBEAMS;
  ta := BEAM_HALF;
  ka := ka / 10.0;

  for aint := 0 to BEAM_FULL do bsum[aint] := -BeamRange;

  pcBeamPattern.ClearGraf;
  pcBeamPattern.PenStyle := psSolid;

  if (ChartShow = fsTransmitter) and (TransBeams > DEFBEAMS) then begin
    tb := TransBeams;
    ta := BEAM_FULL / tb;
  end;

  for b := 1 to tb do begin
    first := True;
    pcBeamPattern.DataColor := PenColors[b];
    for a := BEAM_FIRST to BEAM_LAST do begin
      x    := DegToRad(a);
      x    := ka * sin(x);
      h    := 2.0 * BesselJ1(x) / x;
      h    := power(h, 2);
      bp   := 10 * log10(h);
      apol := a + b * ta;
      aint := Round(apol) mod BEAM_FULL;
      bsum[aint] := PowerSum(bp, bsum[aint]);
      if bp > -BeamRange then begin
        if first then pcBeamPattern.MoveTo(bp, apol);
        pcBeamPattern.DrawTo(bp, apol); // level, angle
        first := False;
      end else begin
        first := True;
      end;
    end;
  end;

  // show power summation envelope
  if cbEnvelope.Checked then begin
    pcBeamPattern.DataColor := COL_ENV;
    for aint := 0 to BEAM_FULL do begin
      if (aint = 0) or (aint = BEAM_FULL) then pcBeamPattern.MoveTo(bsum[aint], aint);
      pcBeamPattern.DrawTo(bsum[aint], aint);
    end;
  end;

  pcBeamPattern.ShowGraf;
  Application.ProcessMessages;
end;

procedure TFormChart.DrawBeamWidth(bw: Single);
begin // draw beam width angle
  bw := bw / 20.0;

  with pcBeamPattern do begin
    PenStyle  := psDot;
    DataColor := COL_BEAM;
    MoveTo(pcBeamPattern.RangeLow, 0);
    DrawTo(10, -bw);
    MoveTo(pcBeamPattern.RangeLow, 0);
    DrawTo(10, bw);
    ShowGraf;
    PenStyle  := psSolid;
    DataColor := COL_DATA;
  end;
end;


end.
