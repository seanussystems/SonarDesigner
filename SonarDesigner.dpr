// Sonar Designer
// Version 2.0.0
// Date 20.06.22
// Copyright (c) 2005-2022 seanus systems

// 3rd Party Components
// - Konopka Signature VCL Controls Vers. 6.1.10
// - Dive Charts Vers 2.0

// 18.06.22 2.0.0  git - Project is now open source hosted on GitHub
// 18.06.22 2.0.0  add - multi-resolution icon container (16, 24, 32, 48, and 256 pixels)
// 18.06.22 2.0.0  opt - migrate to Embarcadero Delphi 10.4
// 18.06.22 2.0.0  opt - update to Dive Charts Vers 2.0

program SonarDesigner;

uses
  Forms,
  FMain in 'FMain.pas' {FormMain},
  FChart in 'FChart.pas' {FormChart},
  FSonar in 'FSonar.pas' {FormSonar},
  FParameter in 'FParameter.pas' {FormParameter};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Sonar Designer';
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormParameter, FormParameter);
  Application.CreateForm(TFormChart, FormChart);
  Application.CreateForm(TFormSonar, FormSonar);
  Application.Run;
end.
