object FormMain: TFormMain
  Left = 268
  Top = 45
  Hint = 'SonarDesigner'
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = ' Sonar Designer '
  ClientHeight = 697
  ClientWidth = 576
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Mangal'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 14
  object gbMainFrame: TGroupBox
    Left = 1
    Top = 4
    Width = 574
    Height = 692
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    object gbTransmitter: TGroupBox
      Left = 0
      Top = 0
      Width = 574
      Height = 182
      Hint = 'TransmitterBeamPattern'
      Caption = ' Transmitter '
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      object lbTpowerUnit: TLabel
        Tag = 303
        Left = 197
        Top = 78
        Width = 19
        Height = 13
        Caption = 'mW'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbTdiameterUnit: TLabel
        Tag = 302
        Left = 81
        Top = 38
        Width = 16
        Height = 13
        Caption = 'mm'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbTpower: TLabel
        Tag = 103
        Left = 124
        Top = 58
        Width = 74
        Height = 13
        Caption = 'Acoustic Power'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbTdiameter: TLabel
        Tag = 102
        Left = 8
        Top = 18
        Width = 42
        Height = 13
        Caption = 'Diameter'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbSourceLevel: TLabel
        Tag = 114
        Left = 472
        Top = 58
        Width = 63
        Height = 13
        Hint = 'SL'
        Caption = 'Source Level'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbTmainLobe: TLabel
        Tag = 106
        Left = 240
        Top = 18
        Width = 50
        Height = 13
        Caption = 'Main Lobe'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbTbeamwidth: TLabel
        Tag = 107
        Left = 356
        Top = 18
        Width = 52
        Height = 13
        HelpType = htKeyword
        HelpKeyword = 'Beamwidth '
        Caption = 'Beamwidth'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbTdirectivity: TLabel
        Tag = 113
        Left = 472
        Top = 18
        Width = 75
        Height = 13
        Hint = 'DIt'
        Caption = 'Directivity Index'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbTmainlobeUnit: TLabel
        Tag = 306
        Left = 313
        Top = 30
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
      object lbTbeamwidthUnit: TLabel
        Tag = 307
        Left = 429
        Top = 30
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
      object lbTdirectivityUnit: TLabel
        Tag = 313
        Left = 545
        Top = 38
        Width = 13
        Height = 13
        Caption = 'dB'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbSourceLevelUnit: TLabel
        Tag = 314
        Left = 545
        Top = 78
        Width = 13
        Height = 13
        Caption = 'dB'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbNearfield: TLabel
        Tag = 108
        Left = 240
        Top = 58
        Width = 48
        Height = 13
        Caption = 'Near Field'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbNearfieldUnit: TLabel
        Tag = 308
        Left = 313
        Top = 78
        Width = 16
        Height = 13
        Caption = 'mm'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbCavitation: TLabel
        Tag = 111
        Left = 356
        Top = 98
        Width = 97
        Height = 13
        Caption = 'Cavitation Threshold'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbCavitationUnit: TLabel
        Tag = 311
        Left = 429
        Top = 118
        Width = 33
        Height = 13
        Caption = 'W/cm'#178
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbRadiatedPower: TLabel
        Tag = 110
        Left = 356
        Top = 58
        Width = 76
        Height = 13
        Caption = 'Radiated Power'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbRadiatedPowerUnit: TLabel
        Tag = 310
        Left = 429
        Top = 78
        Width = 33
        Height = 13
        Caption = 'W/cm'#178
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbTbeamRatio: TLabel
        Tag = 105
        Left = 124
        Top = 18
        Width = 55
        Height = 13
        Caption = 'Beam Ratio'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbCharacteristic: TLabel
        Tag = 104
        Left = 8
        Top = 98
        Width = 64
        Height = 13
        Caption = 'Characteristic'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbCavitationLevel: TLabel
        Tag = 112
        Left = 472
        Top = 98
        Width = 76
        Height = 13
        Caption = 'Cavitation Level'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbCavitationLevelUnit: TLabel
        Tag = 312
        Left = 545
        Top = 118
        Width = 13
        Height = 13
        Caption = 'dB'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbTwindow: TLabel
        Tag = 109
        Left = 240
        Top = 98
        Width = 83
        Height = 13
        Caption = 'Acoustic Window'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbTwindowUnit: TLabel
        Tag = 309
        Left = 313
        Top = 118
        Width = 16
        Height = 13
        Caption = 'mm'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbTmaterial: TLabel
        Tag = 101
        Left = 8
        Top = 138
        Width = 66
        Height = 13
        Caption = 'Piezo Material'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbTthickUnit: TLabel
        Tag = 302
        Left = 81
        Top = 78
        Width = 16
        Height = 13
        Caption = 'mm'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbTthick: TLabel
        Tag = 102
        Left = 8
        Top = 58
        Width = 49
        Height = 13
        Caption = 'Thickness'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbTradialUnit: TLabel
        Tag = 301
        Left = 313
        Top = 158
        Width = 19
        Height = 13
        Caption = 'kHz'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbTaxialUnit: TLabel
        Tag = 301
        Left = 429
        Top = 158
        Width = 19
        Height = 13
        Caption = 'kHz'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbTcapacitUnit: TLabel
        Tag = 301
        Left = 197
        Top = 158
        Width = 12
        Height = 13
        Caption = 'pF'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbTcapacit: TLabel
        Tag = 103
        Left = 124
        Top = 138
        Width = 102
        Height = 13
        Caption = 'Capacitance @ 1kHz'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbTradial: TLabel
        Tag = 103
        Left = 240
        Top = 138
        Width = 88
        Height = 13
        Caption = 'Radial Resonance'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbTaxial: TLabel
        Tag = 103
        Left = 356
        Top = 138
        Width = 80
        Height = 13
        Caption = 'Axial Resonance'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbTweight: TLabel
        Tag = 109
        Left = 124
        Top = 98
        Width = 34
        Height = 13
        Caption = 'Weight'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbTweightUnit: TLabel
        Tag = 309
        Left = 197
        Top = 118
        Width = 6
        Height = 13
        Caption = 'g'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object edTbeamwidth: TEdit
        Tag = 207
        Left = 356
        Top = 32
        Width = 70
        Height = 21
        Hint = 'TransducerBeamwidth'
        AutoSize = False
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object edTmainLobe: TEdit
        Tag = 206
        Left = 240
        Top = 32
        Width = 70
        Height = 21
        AutoSize = False
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object edSourceLevel: TEdit
        Tag = 214
        Left = 472
        Top = 72
        Width = 70
        Height = 21
        AutoSize = False
        Color = clGradientActiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 14
      end
      object edTdirectivity: TEdit
        Tag = 213
        Left = 472
        Top = 32
        Width = 70
        Height = 21
        AutoSize = False
        Color = clGradientActiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 13
      end
      object edNearfield: TEdit
        Tag = 208
        Left = 240
        Top = 72
        Width = 70
        Height = 21
        AutoSize = False
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
      object edCavitation: TEdit
        Tag = 211
        Left = 356
        Top = 112
        Width = 70
        Height = 21
        AutoSize = False
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 10
      end
      object edRadiatedPower: TEdit
        Tag = 210
        Left = 356
        Top = 72
        Width = 70
        Height = 21
        AutoSize = False
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
      object edCavitationLevel: TEdit
        Tag = 212
        Left = 472
        Top = 112
        Width = 70
        Height = 21
        AutoSize = False
        Color = clGradientActiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 15
      end
      object edTwindow: TEdit
        Tag = 209
        Left = 240
        Top = 112
        Width = 70
        Height = 21
        AutoSize = False
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 9
      end
      object cbTmaterial: TRzComboBox
        Tag = 201
        Left = 8
        Top = 152
        Width = 70
        Height = 22
        AllowEdit = False
        AutoComplete = False
        BeepOnInvalidKey = False
        Style = csOwnerDrawFixed
        Color = clCream
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        FrameColor = clBlack
        FrameVisible = True
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 7
        OnChange = DoCalculations
      end
      object edTbeamRatio: TEdit
        Tag = 205
        Left = 124
        Top = 32
        Width = 70
        Height = 21
        AutoSize = False
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        OnChange = edTbeamRatioChange
      end
      object seTpower: TRzSpinEdit
        Tag = 203
        Left = 124
        Top = 72
        Width = 70
        Height = 19
        AllowKeyEdit = True
        FlatButtonColor = clWindow
        Increment = 100.000000000000000000
        Max = 50000.000000000000000000
        Min = 100.000000000000000000
        Value = 1000.000000000000000000
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
        TabOrder = 4
        OnChange = DoCalculations
      end
      object seTdiameter: TRzSpinEdit
        Tag = 202
        Left = 8
        Top = 32
        Width = 70
        Height = 19
        AllowKeyEdit = True
        FlatButtonColor = clWindow
        Max = 100.000000000000000000
        Min = 5.000000000000000000
        Value = 25.000000000000000000
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
        TabOrder = 0
        OnChange = DoCalculations
      end
      object seCharacteristic: TRzSpinEdit
        Tag = 204
        Left = 8
        Top = 112
        Width = 70
        Height = 19
        AllowKeyEdit = True
        FlatButtonColor = clWindow
        Increment = 5.000000000000000000
        Max = 20.000000000000000000
        Min = 10.000000000000000000
        Value = 15.000000000000000000
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
        TabOrder = 8
        OnChange = DoCalculations
      end
      object btTbeamPattern: TRzBitBtn
        Left = 100
        Top = 14
        Width = 21
        Height = 20
        Hint = ' Show Transmitter Beam Pattern '
        Caption = 'T'
        Color = clMoneyGreen
        HotTrack = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 11
        OnClick = btTbeamPatternClick
      end
      object btTransducerBeamwidth: TRzBitBtn
        Left = 332
        Top = 14
        Width = 21
        Height = 20
        Hint = ' Show Transducer Beamwidth Diagram '
        Caption = 'b'
        Color = clMoneyGreen
        HotTrack = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 12
        OnClick = btTransducerBeamwidthClick
      end
      object seTthick: TRzSpinEdit
        Tag = 202
        Left = 8
        Top = 72
        Width = 70
        Height = 19
        AllowKeyEdit = True
        FlatButtonColor = clWindow
        Max = 100.000000000000000000
        Min = 1.000000000000000000
        Value = 30.000000000000000000
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
        TabOrder = 16
        OnChange = DoCalculations
      end
      object edTcapacit: TEdit
        Tag = 209
        Left = 124
        Top = 152
        Width = 70
        Height = 21
        AutoSize = False
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 17
      end
      object edTradial: TEdit
        Tag = 209
        Left = 240
        Top = 152
        Width = 70
        Height = 21
        AutoSize = False
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 18
      end
      object edTaxial: TEdit
        Tag = 209
        Left = 356
        Top = 152
        Width = 70
        Height = 21
        AutoSize = False
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 19
      end
      object edTweight: TEdit
        Tag = 209
        Left = 124
        Top = 112
        Width = 70
        Height = 21
        AutoSize = False
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 20
      end
    end
    object gbReceiver: TGroupBox
      Left = 0
      Top = 180
      Width = 574
      Height = 142
      Hint = 'ReceiverBeamPattern'
      Caption = ' Receiver '
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 2
      object lbRdiameterUnit: TLabel
        Tag = 302
        Left = 81
        Top = 38
        Width = 16
        Height = 13
        Caption = 'mm'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbRmainLobe: TLabel
        Tag = 104
        Left = 240
        Top = 18
        Width = 50
        Height = 13
        Caption = 'Main Lobe'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbRdiameter: TLabel
        Tag = 102
        Left = 9
        Top = 18
        Width = 42
        Height = 13
        Caption = 'Diameter'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbRbeamwidth: TLabel
        Tag = 105
        Left = 356
        Top = 18
        Width = 52
        Height = 13
        HelpType = htKeyword
        HelpKeyword = 'Beamwidth '
        Caption = 'Beamwidth'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbRdirectivity: TLabel
        Tag = 108
        Left = 472
        Top = 18
        Width = 75
        Height = 13
        Hint = 'DIr'
        Caption = 'Directivity Index'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbRmainLobeUnit: TLabel
        Tag = 304
        Left = 313
        Top = 30
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
      object lbRbeamwidthUnit: TLabel
        Tag = 305
        Left = 429
        Top = 30
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
      object lbRdirectivityUnit: TLabel
        Tag = 308
        Left = 545
        Top = 38
        Width = 13
        Height = 13
        Caption = 'dB'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbDisplacement: TLabel
        Tag = 107
        Left = 356
        Top = 58
        Width = 64
        Height = 13
        Caption = 'Displacement'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbDisplacementUnit: TLabel
        Tag = 307
        Left = 429
        Top = 78
        Width = 16
        Height = 13
        Caption = 'mm'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbSignalLevel: TLabel
        Tag = 109
        Left = 472
        Top = 58
        Width = 58
        Height = 13
        Hint = 'RL'
        Caption = 'Signal Level'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbSignalLevelUnit: TLabel
        Tag = 309
        Left = 545
        Top = 78
        Width = 13
        Height = 13
        Caption = 'dB'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbRbeamRatio: TLabel
        Tag = 103
        Left = 124
        Top = 18
        Width = 55
        Height = 13
        Caption = 'Beam Ratio'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbRwindow: TLabel
        Tag = 106
        Left = 240
        Top = 58
        Width = 83
        Height = 13
        Caption = 'Acoustic Window'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbRwindowUnit: TLabel
        Tag = 306
        Left = 313
        Top = 78
        Width = 16
        Height = 13
        Caption = 'mm'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbRmaterial: TLabel
        Tag = 101
        Left = 8
        Top = 98
        Width = 66
        Height = 13
        Caption = 'Piezo Material'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbRthick: TLabel
        Tag = 102
        Left = 9
        Top = 58
        Width = 49
        Height = 13
        Caption = 'Thickness'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbRthickUnit: TLabel
        Tag = 302
        Left = 81
        Top = 78
        Width = 16
        Height = 13
        Caption = 'mm'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbRcapacit: TLabel
        Tag = 103
        Left = 124
        Top = 98
        Width = 102
        Height = 13
        Caption = 'Capacitance @ 1kHz'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbRaxial: TLabel
        Tag = 103
        Left = 356
        Top = 98
        Width = 80
        Height = 13
        Caption = 'Axial Resonance'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbRradial: TLabel
        Tag = 103
        Left = 240
        Top = 98
        Width = 88
        Height = 13
        Caption = 'Radial Resonance'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbRradialUnit: TLabel
        Tag = 301
        Left = 313
        Top = 118
        Width = 19
        Height = 13
        Caption = 'kHz'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbRaxialUnit: TLabel
        Tag = 301
        Left = 429
        Top = 118
        Width = 19
        Height = 13
        Caption = 'kHz'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbRcapacitUnit: TLabel
        Tag = 301
        Left = 197
        Top = 118
        Width = 12
        Height = 13
        Caption = 'pF'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbRweight: TLabel
        Tag = 109
        Left = 124
        Top = 58
        Width = 34
        Height = 13
        Caption = 'Weight'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbRweightUnit: TLabel
        Tag = 301
        Left = 197
        Top = 78
        Width = 6
        Height = 13
        Caption = 'g'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object edRbeamwidth: TEdit
        Tag = 205
        Left = 356
        Top = 32
        Width = 70
        Height = 21
        AutoSize = False
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object edRdirectivity: TEdit
        Tag = 208
        Left = 472
        Top = 32
        Width = 70
        Height = 21
        AutoSize = False
        Color = clGradientActiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
      end
      object edRmainLobe: TEdit
        Tag = 204
        Left = 240
        Top = 32
        Width = 70
        Height = 21
        AutoSize = False
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object edDisplacement: TEdit
        Tag = 207
        Left = 356
        Top = 72
        Width = 70
        Height = 21
        AutoSize = False
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
      object edSignalLevel: TEdit
        Tag = 209
        Left = 472
        Top = 72
        Width = 70
        Height = 21
        AutoSize = False
        Color = clGradientActiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
      end
      object edRbeamRatio: TEdit
        Tag = 203
        Left = 124
        Top = 32
        Width = 70
        Height = 21
        AutoSize = False
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        OnChange = edRbeamRatioChange
      end
      object edRwindow: TEdit
        Tag = 206
        Left = 240
        Top = 72
        Width = 70
        Height = 21
        AutoSize = False
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
      object cbRmaterial: TRzComboBox
        Tag = 201
        Left = 8
        Top = 112
        Width = 70
        Height = 22
        AllowEdit = False
        AutoComplete = False
        BeepOnInvalidKey = False
        Style = csOwnerDrawFixed
        Color = clCream
        Ctl3D = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        FrameColor = clBlack
        FrameVisible = True
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 4
        OnChange = DoCalculations
      end
      object seRdiameter: TRzSpinEdit
        Tag = 202
        Left = 8
        Top = 32
        Width = 70
        Height = 19
        AllowKeyEdit = True
        FlatButtonColor = clWindow
        Max = 100.000000000000000000
        Min = 5.000000000000000000
        Value = 25.000000000000000000
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
        TabOrder = 0
        OnChange = DoCalculations
      end
      object btRbeamPattern: TRzBitBtn
        Left = 100
        Top = 14
        Width = 21
        Height = 20
        Hint = ' Show Receiver Beam Pattern '
        Caption = 'R'
        Color = clMoneyGreen
        HotTrack = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 9
        OnClick = btRbeamPatternClick
      end
      object seRthick: TRzSpinEdit
        Tag = 202
        Left = 8
        Top = 72
        Width = 70
        Height = 19
        AllowKeyEdit = True
        FlatButtonColor = clWindow
        Max = 100.000000000000000000
        Min = 1.000000000000000000
        Value = 30.000000000000000000
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
        TabOrder = 10
        OnChange = DoCalculations
      end
      object edRradial: TEdit
        Tag = 206
        Left = 240
        Top = 112
        Width = 70
        Height = 21
        AutoSize = False
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 11
      end
      object edRcapacit: TEdit
        Tag = 206
        Left = 124
        Top = 112
        Width = 70
        Height = 21
        AutoSize = False
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 12
      end
      object edRaxial: TEdit
        Tag = 206
        Left = 356
        Top = 112
        Width = 70
        Height = 21
        AutoSize = False
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 13
      end
      object edRweight: TEdit
        Tag = 203
        Left = 124
        Top = 72
        Width = 70
        Height = 21
        AutoSize = False
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 14
        OnChange = edRbeamRatioChange
      end
    end
    object gbEnvironment: TGroupBox
      Left = 0
      Top = 320
      Width = 574
      Height = 102
      Caption = ' Environment '
      Color = clBtnFace
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 3
      object lbBeaufort: TLabel
        Tag = 103
        Left = 124
        Top = 18
        Width = 40
        Height = 13
        Caption = 'Beaufort'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbShipTraffic: TLabel
        Tag = 101
        Left = 9
        Top = 58
        Width = 74
        Height = 13
        Caption = 'Shipping Traffic'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbSurfaceNoise: TLabel
        Tag = 104
        Left = 240
        Top = 18
        Width = 67
        Height = 13
        Caption = 'Surface Noise'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbShippingNoise: TLabel
        Tag = 106
        Left = 240
        Top = 58
        Width = 71
        Height = 13
        Caption = 'Shipping Noise'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbNoiseLevel: TLabel
        Tag = 108
        Left = 472
        Top = 18
        Width = 56
        Height = 13
        Hint = 'NL'
        Caption = 'Noise Level'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbThermalNoise: TLabel
        Tag = 107
        Left = 356
        Top = 58
        Width = 68
        Height = 13
        Caption = 'Thermal Noise'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbTurbulentNoise: TLabel
        Tag = 105
        Left = 356
        Top = 18
        Width = 75
        Height = 13
        Caption = 'Turbulent Noise'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbSurfaceNoiseUnit: TLabel
        Tag = 304
        Left = 313
        Top = 38
        Width = 13
        Height = 13
        Caption = 'dB'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbShippingNoiseUnit: TLabel
        Tag = 306
        Left = 313
        Top = 78
        Width = 13
        Height = 13
        Caption = 'dB'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbThermalNoiseUnit: TLabel
        Tag = 307
        Left = 429
        Top = 78
        Width = 13
        Height = 13
        Caption = 'dB'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbTurbulentNoiseUnit: TLabel
        Tag = 305
        Left = 429
        Top = 38
        Width = 13
        Height = 13
        Caption = 'dB'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbNoiseLevelUnit: TLabel
        Tag = 308
        Left = 545
        Top = 38
        Width = 13
        Height = 13
        Caption = 'dB'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbWindSpeed: TLabel
        Tag = 102
        Left = 9
        Top = 18
        Width = 59
        Height = 13
        Caption = 'Wind Speed'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbWindSpeedUnit: TLabel
        Tag = 302
        Left = 81
        Top = 38
        Width = 18
        Height = 13
        Caption = 'm/s'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object edSurfaceNoise: TEdit
        Tag = 204
        Left = 240
        Top = 32
        Width = 70
        Height = 21
        AutoSize = False
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object edShippingNoise: TEdit
        Tag = 206
        Left = 240
        Top = 72
        Width = 70
        Height = 21
        AutoSize = False
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
      object edNoiseLevel: TEdit
        Tag = 208
        Left = 472
        Top = 32
        Width = 70
        Height = 21
        AutoSize = False
        Color = clGradientActiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
      end
      object edThermalNoise: TEdit
        Tag = 207
        Left = 356
        Top = 72
        Width = 70
        Height = 21
        AutoSize = False
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
      object edTurbulentNoise: TEdit
        Tag = 205
        Left = 356
        Top = 32
        Width = 70
        Height = 21
        AutoSize = False
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object edBeaufort: TEdit
        Tag = 203
        Left = 124
        Top = 32
        Width = 70
        Height = 21
        AutoSize = False
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object seWindSpeed: TRzSpinEdit
        Tag = 202
        Left = 8
        Top = 32
        Width = 70
        Height = 19
        AllowKeyEdit = True
        FlatButtonColor = clWindow
        Max = 36.000000000000000000
        Value = 7.000000000000000000
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
        TabOrder = 0
        OnChange = DoCalculations
      end
      object seShipTraffic: TRzSpinEdit
        Tag = 201
        Left = 8
        Top = 72
        Width = 70
        Height = 19
        AllowKeyEdit = True
        FlatButtonColor = clWindow
        Max = 10.000000000000000000
        Value = 5.000000000000000000
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
        TabOrder = 4
        OnChange = DoCalculations
      end
    end
    object gbPropagation: TGroupBox
      Left = 0
      Top = 420
      Width = 574
      Height = 102
      Caption = ' Propagation '
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 4
      object lbTemperature: TLabel
        Tag = 103
        Left = 124
        Top = 18
        Width = 92
        Height = 13
        Caption = 'Water Temperature'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbSoundSpeed: TLabel
        Tag = 107
        Left = 356
        Top = 58
        Width = 65
        Height = 13
        Caption = 'Sound Speed'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbTemperatureUnit: TLabel
        Tag = 303
        Left = 197
        Top = 38
        Width = 11
        Height = 13
        Caption = #176'C'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbSoundSpeedUnit: TLabel
        Tag = 307
        Left = 429
        Top = 78
        Width = 18
        Height = 13
        Caption = 'm/s'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbDensity: TLabel
        Tag = 106
        Left = 240
        Top = 58
        Width = 67
        Height = 13
        Caption = 'Water Density'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbDensityUnit: TLabel
        Tag = 306
        Left = 313
        Top = 78
        Width = 28
        Height = 13
        Caption = 'kg/m'#179
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbSalinity: TLabel
        Tag = 104
        Left = 124
        Top = 58
        Width = 65
        Height = 13
        Caption = 'Water Salinity'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbAbsorptionLoss: TLabel
        Tag = 108
        Left = 356
        Top = 18
        Width = 75
        Height = 13
        Caption = 'Absorption Loss'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbAbsorptionLossUnit: TLabel
        Tag = 308
        Left = 429
        Top = 38
        Width = 32
        Height = 13
        Caption = 'dB/km'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbSalinityUnit: TLabel
        Tag = 304
        Left = 197
        Top = 78
        Width = 15
        Height = 13
        Caption = 'ppt'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbTransmissionLoss: TLabel
        Tag = 109
        Left = 472
        Top = 18
        Width = 86
        Height = 13
        Hint = 'TL'
        Caption = 'Transmission Loss'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbRange: TLabel
        Tag = 102
        Left = 9
        Top = 58
        Width = 81
        Height = 13
        Caption = 'Operation Range'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbRangeUnit: TLabel
        Tag = 302
        Left = 81
        Top = 78
        Width = 8
        Height = 13
        Caption = 'm'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbFrequency: TLabel
        Tag = 101
        Left = 9
        Top = 18
        Width = 81
        Height = 13
        Caption = 'Sonar Frequency'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbFrequencyUnit: TLabel
        Tag = 301
        Left = 81
        Top = 38
        Width = 19
        Height = 13
        Caption = 'kHz'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbWaveLength: TLabel
        Tag = 105
        Left = 240
        Top = 18
        Width = 65
        Height = 13
        Caption = 'Wave Length'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbWaveLengthUnit: TLabel
        Tag = 305
        Left = 313
        Top = 38
        Width = 16
        Height = 13
        Caption = 'mm'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbTransmissionLossUnit: TLabel
        Tag = 309
        Left = 545
        Top = 38
        Width = 13
        Height = 13
        Caption = 'dB'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbThreshold: TLabel
        Tag = 110
        Left = 472
        Top = 58
        Width = 85
        Height = 13
        Hint = 'DT'
        Caption = 'Detect. Threshold'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbThresholdUnit: TLabel
        Tag = 310
        Left = 545
        Top = 78
        Width = 13
        Height = 13
        Caption = 'dB'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object edSoundSpeed: TEdit
        Tag = 207
        Left = 356
        Top = 72
        Width = 70
        Height = 21
        Hint = 'SoundSpeed'
        AutoSize = False
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
      end
      object edDensity: TEdit
        Tag = 206
        Left = 240
        Top = 72
        Width = 70
        Height = 21
        AutoSize = False
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
      object edAbsorptionLoss: TEdit
        Tag = 208
        Left = 356
        Top = 32
        Width = 70
        Height = 21
        Hint = 'AbsorptionLoss'
        AutoSize = False
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object edTransmissionLoss: TEdit
        Tag = 209
        Left = 472
        Top = 32
        Width = 70
        Height = 21
        AutoSize = False
        Color = clGradientActiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 8
      end
      object edWaveLength: TEdit
        Tag = 205
        Left = 240
        Top = 32
        Width = 70
        Height = 21
        AutoSize = False
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object edThreshold: TEdit
        Tag = 210
        Left = 472
        Top = 72
        Width = 70
        Height = 21
        AutoSize = False
        Color = clGradientActiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 9
      end
      object seSalinity: TRzSpinEdit
        Tag = 204
        Left = 124
        Top = 72
        Width = 70
        Height = 19
        AllowKeyEdit = True
        FlatButtonColor = clWindow
        Max = 50.000000000000000000
        Value = 35.000000000000000000
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
        TabOrder = 5
        OnChange = DoCalculations
      end
      object seTemperature: TRzSpinEdit
        Tag = 203
        Left = 124
        Top = 32
        Width = 70
        Height = 19
        AllowKeyEdit = True
        FlatButtonColor = clWindow
        Max = 50.000000000000000000
        Value = 10.000000000000000000
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
        TabOrder = 1
        OnChange = DoCalculations
      end
      object seFrequency: TRzSpinEdit
        Tag = 201
        Left = 8
        Top = 32
        Width = 70
        Height = 19
        AllowKeyEdit = True
        FlatButtonColor = clWindow
        Max = 500.000000000000000000
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
        TabOrder = 0
        OnChange = DoCalculations
      end
      object seRange: TRzSpinEdit
        Tag = 202
        Left = 8
        Top = 72
        Width = 70
        Height = 19
        AllowKeyEdit = True
        FlatButtonColor = clWindow
        Increment = 10.000000000000000000
        Max = 5000.000000000000000000
        Min = 10.000000000000000000
        Value = 500.000000000000000000
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
        TabOrder = 4
        OnChange = DoCalculations
      end
      object btAbsorptionLoss: TRzBitBtn
        Left = 332
        Top = 14
        Width = 21
        Height = 20
        Hint = ' Show Absorption Loss Diagram '
        Caption = 'a'
        Color = clMoneyGreen
        HotTrack = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 10
        OnClick = btAbsorptionLossClick
      end
      object btSoundSpeed: TRzBitBtn
        Left = 332
        Top = 54
        Width = 21
        Height = 20
        Hint = ' Show Sound Speed Diagram '
        Caption = 'c'
        Color = clMoneyGreen
        HotTrack = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 11
        OnClick = btSoundSpeedClick
      end
    end
    object pnMessage: TPanel
      Left = 4
      Top = 666
      Width = 349
      Height = 21
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 8
      object lbMessage: TLabel
        Left = 4
        Top = 3
        Width = 341
        Height = 13
        AutoSize = False
        Caption = 'Ready...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
      end
    end
    object gbPerformance: TGroupBox
      Left = 0
      Top = 520
      Width = 574
      Height = 142
      Caption = ' Performance '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      object lbClockFrequency: TLabel
        Tag = 101
        Left = 9
        Top = 58
        Width = 80
        Height = 13
        Caption = 'Clock Frequency'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbClockFrequencyUnit: TLabel
        Tag = 301
        Left = 81
        Top = 78
        Width = 19
        Height = 13
        Caption = 'kHz'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbCounterBits: TLabel
        Tag = 104
        Left = 124
        Top = 98
        Width = 57
        Height = 13
        Caption = 'Counter Bits'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbPeriodes: TLabel
        Tag = 103
        Left = 9
        Top = 18
        Width = 73
        Height = 13
        Caption = 'Signal Periodes'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbRepetitionTime: TLabel
        Tag = 110
        Left = 240
        Top = 98
        Width = 74
        Height = 13
        Caption = 'Repetition Time'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbRepetitionTimeUnit: TLabel
        Tag = 310
        Left = 313
        Top = 118
        Width = 5
        Height = 13
        Caption = 's'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbMinDistance: TLabel
        Tag = 108
        Left = 240
        Top = 58
        Width = 65
        Height = 13
        Caption = 'Min. Distance'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbMinDistanceUnit: TLabel
        Tag = 308
        Left = 313
        Top = 78
        Width = 14
        Height = 13
        Caption = 'cm'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbBurstDuration: TLabel
        Tag = 105
        Left = 240
        Top = 18
        Width = 67
        Height = 13
        Caption = 'Burst Duration'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbBurstDurationUnit: TLabel
        Tag = 305
        Left = 313
        Top = 38
        Width = 11
        Height = 13
        Caption = 'us'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbMaxDistance: TLabel
        Tag = 109
        Left = 356
        Top = 58
        Width = 68
        Height = 13
        Caption = 'Max. Distance'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbMaxDistanceUnit: TLabel
        Tag = 309
        Left = 429
        Top = 78
        Width = 8
        Height = 13
        Caption = 'm'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbBandwidth: TLabel
        Tag = 106
        Left = 124
        Top = 18
        Width = 50
        Height = 13
        Caption = 'Bandwidth'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbBandwidthUnit: TLabel
        Tag = 306
        Left = 197
        Top = 38
        Width = 13
        Height = 13
        Caption = 'Hz'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbSafetyMargin: TLabel
        Tag = 114
        Left = 472
        Top = 98
        Width = 65
        Height = 13
        Hint = 'SM'
        Caption = 'Safety Margin'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbSignalExcess: TLabel
        Tag = 113
        Left = 472
        Top = 18
        Width = 66
        Height = 13
        Hint = 'SE'
        Caption = 'Signal Excess'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbSignalExcessUnit: TLabel
        Tag = 313
        Left = 545
        Top = 38
        Width = 13
        Height = 13
        Caption = 'dB'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbSafetyMarginUnit: TLabel
        Tag = 314
        Left = 545
        Top = 118
        Width = 13
        Height = 13
        Caption = 'dB'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbClockAccuracy: TLabel
        Tag = 102
        Left = 9
        Top = 98
        Width = 75
        Height = 13
        Caption = 'Clock Accuracy'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbRangeError: TLabel
        Tag = 111
        Left = 356
        Top = 98
        Width = 57
        Height = 13
        Caption = 'Range Error'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbRangeErrorUnit: TLabel
        Tag = 311
        Left = 429
        Top = 118
        Width = 19
        Height = 13
        Caption = 'm/h'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbClockAccuracyUnit: TLabel
        Tag = 302
        Left = 81
        Top = 118
        Width = 36
        Height = 13
        Caption = 'ppm*10'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbEcho: TLabel
        Tag = 112
        Left = 356
        Top = 18
        Width = 70
        Height = 13
        Caption = 'Echo Distance'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbEchoUnit: TLabel
        Tag = 312
        Left = 429
        Top = 38
        Width = 8
        Height = 13
        Caption = 'm'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbBandpass: TLabel
        Tag = 107
        Left = 124
        Top = 58
        Width = 72
        Height = 13
        Caption = 'Bandpass Filter'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object lbBandpassUnit: TLabel
        Tag = 307
        Left = 197
        Top = 78
        Width = 13
        Height = 13
        Caption = 'Hz'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object edRepetitionTime: TEdit
        Tag = 210
        Left = 240
        Top = 112
        Width = 70
        Height = 21
        AutoSize = False
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 10
      end
      object edMinDistance: TEdit
        Tag = 208
        Left = 240
        Top = 72
        Width = 70
        Height = 21
        AutoSize = False
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
      object edBurstDuration: TEdit
        Tag = 205
        Left = 240
        Top = 32
        Width = 70
        Height = 21
        AutoSize = False
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object edMaxDistance: TEdit
        Tag = 209
        Left = 356
        Top = 72
        Width = 70
        Height = 21
        AutoSize = False
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
      end
      object edBandwidth: TEdit
        Tag = 206
        Left = 124
        Top = 32
        Width = 70
        Height = 21
        AutoSize = False
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object edSafetyMargin: TEdit
        Tag = 214
        Left = 472
        Top = 112
        Width = 70
        Height = 21
        AutoSize = False
        Color = clGradientActiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 13
      end
      object edSignalExcess: TEdit
        Tag = 213
        Left = 472
        Top = 32
        Width = 70
        Height = 21
        AutoSize = False
        Color = clGradientActiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 12
      end
      object edRangeError: TEdit
        Tag = 211
        Left = 356
        Top = 112
        Width = 70
        Height = 21
        AutoSize = False
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 11
      end
      object edEchoSuppression: TEdit
        Tag = 212
        Left = 356
        Top = 32
        Width = 70
        Height = 21
        AutoSize = False
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object edBandpass: TEdit
        Tag = 207
        Left = 124
        Top = 72
        Width = 70
        Height = 21
        AutoSize = False
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
      object seClockAccuracy: TRzSpinEdit
        Tag = 202
        Left = 8
        Top = 112
        Width = 70
        Height = 19
        AllowKeyEdit = True
        FlatButtonColor = clWindow
        Max = 2000.000000000000000000
        Min = 5.000000000000000000
        Value = 20.000000000000000000
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
        TabOrder = 8
        OnChange = DoCalculations
      end
      object sePeriodes: TRzSpinEdit
        Tag = 203
        Left = 8
        Top = 32
        Width = 70
        Height = 19
        AllowKeyEdit = True
        FlatButtonColor = clWindow
        Increment = 2.000000000000000000
        Max = 1024.000000000000000000
        Min = 8.000000000000000000
        Value = 32.000000000000000000
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
        TabOrder = 0
        OnChange = DoCalculations
      end
      object seClockFrequency: TRzSpinEdit
        Tag = 201
        Left = 8
        Top = 72
        Width = 70
        Height = 19
        AllowKeyEdit = True
        FlatButtonColor = clWindow
        Max = 40000.000000000000000000
        Min = 5.000000000000000000
        Value = 40.000000000000000000
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
        TabOrder = 4
        OnChange = DoCalculations
      end
      object seCounterBits: TRzSpinEdit
        Tag = 204
        Left = 124
        Top = 112
        Width = 70
        Height = 19
        AllowKeyEdit = True
        FlatButtonColor = clWindow
        Max = 24.000000000000000000
        Min = 4.000000000000000000
        Value = 16.000000000000000000
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
        TabOrder = 9
        OnChange = DoCalculations
      end
      object btSonar: TRzBitBtn
        Left = 448
        Top = 14
        Width = 21
        Height = 20
        Hint = ' Show Sonar Equation Diagram '
        Caption = 'S'
        Color = clMoneyGreen
        HotTrack = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 14
        OnClick = btSonarClick
      end
    end
    object btSettings: TRzBitBtn
      Left = 356
      Top = 665
      Width = 70
      Height = 23
      Hint = ' Set System Parameter '
      Caption = 'Settings'
      HotTrack = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = btSettingsClick
    end
    object btReport: TRzBitBtn
      Left = 428
      Top = 665
      Width = 70
      Height = 23
      Hint = ' Create Report '
      Caption = 'Report'
      HotTrack = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = btReportClick
    end
    object btExit: TRzBitBtn
      Left = 500
      Top = 665
      Width = 70
      Height = 23
      Hint = ' Exit Program '
      Caption = 'Exit'
      HotTrack = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = btExitClick
    end
  end
end
