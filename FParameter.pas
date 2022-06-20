// Sonar System Parameter
// Date 19.06.22

unit FParameter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Spin, Math, Mask, RzEdit, RzSpnEdt, RzButton,
  RzRadChk, UGlobal, USystem, UInifile, UInternet;

type
  TFormParameter = class(TForm)
    btClose: TRzBitBtn;
    btDefault: TRzBitBtn;
    btLoad: TRzBitBtn;
    btSave: TRzBitBtn;
    cbSeaWater: TRzCheckBox;
    cbFreshWater: TRzCheckBox;
    edDesigner: TEdit;
    edFile: TEdit;
    edProject: TEdit;
    edTime: TEdit;
    edDate: TEdit;
    lbBeamLevel: TLabel;
    lbBeamLevelUnit: TLabel;
    lbBeamRange: TLabel;
    lbBeamRangeUnit: TLabel;
    lbDepth: TLabel;
    lbDepthUnit: TLabel;
    lbDesigner: TLabel;
    lbFile: TLabel;
    lbHeader: TLabel;
    lbTransBeams: TLabel;
    lbBeamZoom: TLabel;
    lbBeamAngle: TLabel;
    lbBeamZoomUnit: TLabel;
    lbBeamAngleUnit: TLabel;
    lbDate: TLabel;
    lbTime: TLabel;
    odParameter: TOpenDialog;
    pnParameter: TPanel;
    sdParameter: TSaveDialog;
    seBeamLevel: TRzSpinEdit;
    seBeamRange: TRzSpinEdit;
    seDiveDepth: TRzSpinEdit;
    seTransBeams: TRzSpinEdit;
    seBeamZoom: TRzSpinEdit;
    seBeamAngle: TRzSpinEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btDefaultClick(Sender: TObject);
    procedure btCloseClick(Sender: TObject);
    procedure btSaveClick(Sender: TObject);
    procedure btLoadClick(Sender: TObject);
    procedure cbSeaWaterClick(Sender: TObject);
    procedure cbFreshWaterClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    procedure SetDefault;
    procedure SetParameter;
  end;

var
  FormParameter: TFormParameter;

implementation

uses FMain, FSonar, FChart;

{$R *.dfm}

procedure TFormParameter.FormCreate(Sender: TObject);
begin
  seBeamRange.Max  := MAXRANGE;
  seTransBeams.Max := MAXBEAMS;
end;

procedure TFormParameter.FormShow(Sender: TObject);
begin
  seBeamZoom.Value  := BeamZoom;
  seBeamAngle.Value := BeamAngle;
  edFile.Text       := ProjectFile;
end;

procedure TFormParameter.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  edProject.Text  := Trim(edProject.Text);
  edDesigner.Text := Trim(edDesigner.Text);
  ProjectName     := edProject.Text;
  ProjectFile     := edFile.Text;
  DesignerName    := edDesigner.Text;
  DiveDepth       := seDiveDepth.Value;
  BeamRange       := seBeamRange.IntValue;
  BeamLevel       := seBeamLevel.IntValue;
  TransBeams      := seTransBeams.IntValue;
  BeamZoom        := seBeamZoom.IntValue;
  BeamAngle       := seBeamAngle.IntValue;

  //re-calculate with new settings
  FormMain.DoCalculations(self);
end;

procedure TFormParameter.SetDefault;
var
  comp: WideString;
  user: WideString;
begin
  comp := GetCompName;
  user := GetCompUser;
  user := GetUserFullName(comp, user);

  seDiveDepth.Value  := REFDEPTH;
  seBeamLevel.Value  := REFBEAM;
  seBeamRange.Value  := MAXRANGE;
  seTransBeams.Value := DEFBEAMS;
  seBeamZoom.Value   := DEFZOOM;
  seBeamAngle.Value  := DEFANGLE;

  edDate.Text     := FormatDateTime(FormatSettings.ShortDateFormat, Now); //19.06.22 old=FORM_DATE
  edTime.Text     := FormatDateTime(FormatSettings.LongTimeFormat,  Now); //19.06.22 old=FORM_TIME
  edProject.Text  := Application.Title;
  edDesigner.Text := user;
  edFile.Text     := cEMPTY;

  cbFreshWater.Checked := False;
  cbSeaWater.Checked   := True;

  FormMain.DispMessage(cEMPTY, COL_NORM);
end;

procedure TFormParameter.SetParameter;
begin
  ProjectName  := Trim(edProject.Text);
  DesignerName := Trim(edDesigner.Text);
  ProjectFile  := Trim(edFile.Text);
  DiveDepth    := seDiveDepth.Value;
  BeamRange    := seBeamRange.IntValue;
  BeamLevel    := seBeamLevel.IntValue;
  TransBeams   := seTransBeams.IntValue;
  BeamZoom     := seBeamZoom.IntValue;
  BeamAngle    := seBeamAngle.IntValue;
end;

procedure TFormParameter.btDefaultClick(Sender: TObject);
begin
  SetDefault;
end;

procedure TFormParameter.btCloseClick(Sender: TObject);
begin
  SetParameter;
  FormParameter.Close;
end;

procedure TFormParameter.btSaveClick(Sender: TObject);
var
  sFile: string;
begin
  edDate.Text            := FormatDateTime(FormatSettings.ShortDateFormat, Now); //19.06.22 old=FORM_DATE
  edTime.Text            := FormatDateTime(FormatSettings.LongTimeFormat,  Now); //19.06.22 old=FORM_TIME

  sFile                  := StringReplace(edProject.Text, cSPACE, cEMPTY, [rfReplaceAll]);
  sdParameter.Filter     := PARAMETER_FILE;
  sdParameter.FileName   := sFile + PARAMETER_TYPE;
  sdParameter.InitialDir := DataFolder;
  sdParameter.Options    := [ofOldStyleDialog, ofNoNetworkButton, ofHideReadOnly, ofNoReadOnlyReturn];
  sdParameter.Title      := btSave.Hint;

  if sdParameter.Execute then begin
    sFile := sdParameter.FileName;
    edFile.Text := ExtractFileName(sFile);
    if FormMain.SaveParameter(sFile) then begin
      FormMain.DispMessage(sFile, COL_NORM);
    end else begin
      edFile.Text := cEMPTY;
      FormMain.DispMessage(SAVE_ERR, COL_ERR);
    end;
  end;
  btClose.SetFocus;
end;

procedure TFormParameter.btLoadClick(Sender: TObject);
var
  sFile: string;
begin
  sFile                  := StringReplace(edProject.Text, cSPACE, cEMPTY, [rfReplaceAll]);
  odParameter.DefaultExt := PARAMETER_TYPE;
  odParameter.Filter     := PARAMETER_FILE;
  odParameter.FileName   := sFile + PARAMETER_TYPE;
  odParameter.InitialDir := DataFolder;
  odParameter.Options    := [ofOldStyleDialog, ofNoNetworkButton, ofHideReadOnly];
  odParameter.Title      := btLoad.Hint;
  
  if odParameter.Execute then begin
    sFile := odParameter.FileName;
    if FormMain.LoadParameter(sFile) then begin
      edFile.Text := ExtractFileName(sFile);
      FormMain.DispMessage(sFile, COL_NORM);
    end else begin
      FormMain.DispMessage(LOAD_ERR, COL_ERR);
      edFile.Text := cEMPTY;
    end;
  end;
  btClose.SetFocus;
end;

procedure TFormParameter.cbSeaWaterClick(Sender: TObject);
begin
  if cbSeaWater.Checked then begin
    cbFreshWater.Checked           := False;
    FormMain.seTemperature.Value   := SEATEMP;
    FormMain.seSalinity.Value      := SEASALT;
    FormMain.seTemperature.Enabled := False;
    FormMain.seSalinity.Enabled    := False;
  end else begin
    FormMain.seTemperature.Enabled := True;
    FormMain.seSalinity.Enabled    := True;
  end;

  FormMain.DoCalculations(self);
end;

procedure TFormParameter.cbFreshWaterClick(Sender: TObject);
begin
  if cbFreshWater.Checked then begin
    cbSeaWater.Checked             := False;
    FormMain.seTemperature.Value   := FRESHTEMP;
    FormMain.seSalinity.Value      := FRESHSALT;
    FormMain.seTemperature.Enabled := False;
    FormMain.seSalinity.Enabled    := False;
  end else begin
    FormMain.seTemperature.Enabled := True;
    FormMain.seSalinity.Enabled    := True;
  end;

  FormMain.DoCalculations(self);
end;


end.
