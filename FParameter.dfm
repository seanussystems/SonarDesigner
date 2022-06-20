object FormParameter: TFormParameter
  Left = 456
  Top = 178
  BorderStyle = bsDialog
  Caption = ' System Parameter'
  ClientHeight = 346
  ClientWidth = 293
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    293
    346)
  PixelsPerInch = 96
  TextHeight = 13
  object pnParameter: TPanel
    Left = 4
    Top = 4
    Width = 285
    Height = 309
    Hint = 'System'
    BevelOuter = bvNone
    BorderStyle = bsSingle
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 4
    object lbDepth: TLabel
      Tag = 101
      Left = 8
      Top = 136
      Width = 78
      Height = 13
      Caption = 'Operation Depth'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lbDepthUnit: TLabel
      Tag = 301
      Left = 82
      Top = 156
      Width = 8
      Height = 13
      Caption = 'm'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lbHeader: TLabel
      Tag = 101
      Left = 8
      Top = 8
      Width = 64
      Height = 13
      Caption = 'Project Name'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lbBeamLevel: TLabel
      Tag = 101
      Left = 128
      Top = 136
      Width = 81
      Height = 13
      Caption = 'Beamwidth Level'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lbBeamLevelUnit: TLabel
      Tag = 301
      Left = 202
      Top = 156
      Width = 13
      Height = 13
      Caption = 'dB'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lbTransBeams: TLabel
      Tag = 101
      Left = 128
      Top = 176
      Width = 87
      Height = 13
      Caption = 'Transmitter Beams'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lbBeamRange: TLabel
      Tag = 101
      Left = 8
      Top = 176
      Width = 91
      Height = 13
      Caption = 'Beam Level Range'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lbBeamRangeUnit: TLabel
      Tag = 301
      Left = 82
      Top = 196
      Width = 13
      Height = 13
      Caption = 'dB'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lbDesigner: TLabel
      Tag = 101
      Left = 8
      Top = 48
      Width = 73
      Height = 13
      Caption = 'Designer Name'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lbFile: TLabel
      Tag = 101
      Left = 8
      Top = 88
      Width = 67
      Height = 13
      Caption = 'Parameter File'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lbBeamZoom: TLabel
      Tag = 101
      Left = 8
      Top = 216
      Width = 60
      Height = 13
      Caption = 'Zoom Factor'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lbBeamAngle: TLabel
      Tag = 101
      Left = 128
      Top = 216
      Width = 67
      Height = 13
      Caption = 'Angular Offset'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lbBeamZoomUnit: TLabel
      Tag = 301
      Left = 82
      Top = 236
      Width = 8
      Height = 13
      Caption = '%'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lbBeamAngleUnit: TLabel
      Tag = 304
      Left = 202
      Top = 228
      Width = 5
      Height = 20
      Caption = #176
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -17
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lbDate: TLabel
      Tag = 101
      Left = 185
      Top = 8
      Width = 23
      Height = 13
      Caption = 'Date'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object lbTime: TLabel
      Tag = 101
      Left = 185
      Top = 48
      Width = 23
      Height = 13
      Caption = 'Time'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object edProject: TEdit
      Left = 8
      Top = 22
      Width = 170
      Height = 22
      Hint = ' Name of Project '
      AutoSelect = False
      AutoSize = False
      Color = clCream
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 30
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      Text = 'Sonar Designer'
    end
    object edDesigner: TEdit
      Left = 8
      Top = 62
      Width = 170
      Height = 22
      Hint = ' Name of Designer '
      AutoSelect = False
      AutoSize = False
      Color = clCream
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 30
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 2
    end
    object edFile: TEdit
      Left = 8
      Top = 102
      Width = 265
      Height = 22
      Hint = ' Name of Parameter File '
      AutoSelect = False
      AutoSize = False
      Color = clCream
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 30
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = False
      TabOrder = 4
    end
    object seDiveDepth: TRzSpinEdit
      Left = 8
      Top = 150
      Width = 70
      Height = 19
      AllowKeyEdit = True
      FlatButtonColor = clWindow
      Max = 30.000000000000000000
      Min = 3.000000000000000000
      Value = 3.000000000000000000
      AutoSelect = False
      AutoSize = False
      Color = clCream
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      FrameColor = clBlack
      FrameVisible = True
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 5
    end
    object seBeamLevel: TRzSpinEdit
      Left = 128
      Top = 150
      Width = 70
      Height = 19
      AllowKeyEdit = True
      FlatButtonColor = clWindow
      Increment = 3.000000000000000000
      Max = 18.000000000000000000
      Min = 3.000000000000000000
      Value = 3.000000000000000000
      AutoSelect = False
      AutoSize = False
      Color = clCream
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      FrameColor = clBlack
      FrameVisible = True
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 6
    end
    object seBeamRange: TRzSpinEdit
      Left = 8
      Top = 190
      Width = 70
      Height = 19
      AllowKeyEdit = True
      FlatButtonColor = clWindow
      Increment = 5.000000000000000000
      Max = 50.000000000000000000
      Min = 5.000000000000000000
      Value = 50.000000000000000000
      AutoSelect = False
      AutoSize = False
      Color = clCream
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      FrameColor = clBlack
      FrameVisible = True
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 7
    end
    object seTransBeams: TRzSpinEdit
      Left = 128
      Top = 190
      Width = 70
      Height = 19
      AllowKeyEdit = True
      FlatButtonColor = clWindow
      Max = 36.000000000000000000
      Min = 1.000000000000000000
      Value = 1.000000000000000000
      AutoSelect = False
      AutoSize = False
      Color = clCream
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      FrameColor = clBlack
      FrameVisible = True
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 8
    end
    object cbSeaWater: TRzCheckBox
      Left = 8
      Top = 261
      Width = 120
      Height = 19
      AlignmentVertical = avCenter
      Caption = 'Standard Sea Water'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      HotTrack = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      State = cbUnchecked
      TabOrder = 11
      OnClick = cbSeaWaterClick
    end
    object cbFreshWater: TRzCheckBox
      Left = 8
      Top = 284
      Width = 127
      Height = 19
      AlignmentVertical = avCenter
      Caption = 'Standard Fresh Water'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      HotTrack = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      State = cbUnchecked
      TabOrder = 12
      OnClick = cbFreshWaterClick
    end
    object seBeamZoom: TRzSpinEdit
      Left = 8
      Top = 230
      Width = 70
      Height = 19
      AllowKeyEdit = True
      FlatButtonColor = clWindow
      Max = 200.000000000000000000
      Min = 20.000000000000000000
      Value = 72.000000000000000000
      AutoSelect = False
      AutoSize = False
      Color = clCream
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      FrameColor = clBlack
      FrameVisible = True
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 9
    end
    object seBeamAngle: TRzSpinEdit
      Left = 128
      Top = 230
      Width = 70
      Height = 19
      AllowKeyEdit = True
      FlatButtonColor = clWindow
      Increment = 5.000000000000000000
      Max = 180.000000000000000000
      Min = -180.000000000000000000
      Value = -45.000000000000000000
      AutoSelect = False
      AutoSize = False
      Color = clCream
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      FrameColor = clBlack
      FrameVisible = True
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 10
    end
    object edTime: TEdit
      Left = 185
      Top = 62
      Width = 90
      Height = 22
      Alignment = taCenter
      AutoSelect = False
      AutoSize = False
      Color = clCream
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 30
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = False
      TabOrder = 3
      Text = '12:34:56'
    end
    object edDate: TEdit
      Left = 185
      Top = 22
      Width = 90
      Height = 22
      Alignment = taCenter
      AutoSelect = False
      AutoSize = False
      Color = clCream
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 30
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = False
      TabOrder = 1
      Text = '01.02.2022'
    end
  end
  object btLoad: TRzBitBtn
    Left = 4
    Top = 320
    Width = 70
    Height = 23
    Hint = ' Load Parameter Settings '
    Anchors = [akLeft, akBottom]
    Caption = 'Load'
    HotTrack = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnClick = btLoadClick
  end
  object btSave: TRzBitBtn
    Left = 76
    Top = 320
    Width = 70
    Height = 23
    Hint = ' Save Parameter Settings '
    Anchors = [akLeft, akBottom]
    Caption = 'Save'
    HotTrack = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = btSaveClick
  end
  object btDefault: TRzBitBtn
    Left = 148
    Top = 320
    Width = 70
    Height = 23
    Hint = ' Set Default Parameter '
    Anchors = [akLeft, akBottom]
    Caption = 'Default'
    HotTrack = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = btDefaultClick
  end
  object btClose: TRzBitBtn
    Left = 220
    Top = 320
    Width = 70
    Height = 23
    Hint = ' Close Parameter Settings '
    Anchors = [akLeft, akBottom]
    Caption = 'Close'
    HotTrack = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = btCloseClick
  end
  object odParameter: TOpenDialog
    Left = 248
    Top = 192
  end
  object sdParameter: TSaveDialog
    Left = 248
    Top = 152
  end
end
