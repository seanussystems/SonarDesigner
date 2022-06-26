object FormChart: TFormChart
  Left = 436
  Top = 198
  BorderStyle = bsDialog
  Caption = ' Beam Pattern'
  ClientHeight = 310
  ClientWidth = 209
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = True
  Position = poDefault
  Scaled = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnMouseMove = FormMouseMove
  OnShow = FormShow
  DesignSize = (
    209
    310)
  PixelsPerInch = 96
  TextHeight = 16
  object lbLevelUnit: TLabel
    Left = 76
    Top = 288
    Width = 13
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = 'dB'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ExplicitTop = 285
  end
  object lbAngleUnit: TLabel
    Left = 188
    Top = 286
    Width = 5
    Height = 20
    Anchors = [akLeft, akBottom]
    Caption = #176
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ExplicitTop = 283
  end
  object sbBeamWidth: TScrollBar
    Left = 96
    Top = 9
    Width = 81
    Height = 16
    Max = 2000
    PageSize = 0
    TabOrder = 3
    OnChange = sbMainLobeChange
  end
  object sbMainLobe: TScrollBar
    Left = 16
    Top = 9
    Width = 81
    Height = 16
    Max = 10000
    PageSize = 0
    TabOrder = 2
    OnChange = sbMainLobeChange
  end
  object edLevel: TEdit
    Left = 8
    Top = 284
    Width = 65
    Height = 20
    Anchors = [akLeft, akBottom]
    AutoSize = False
    Color = clInfoBk
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Fixedsys'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
  end
  object edAngle: TEdit
    Left = 120
    Top = 284
    Width = 65
    Height = 20
    Anchors = [akLeft, akBottom]
    AutoSize = False
    Color = clInfoBk
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'Fixedsys'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
  end
  object cbBeamWidth: TRzCheckBox
    Left = 8
    Top = 8
    Width = 105
    Height = 19
    AlignmentVertical = avCenter
    Caption = 'Show Beamwidth'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    HotTrack = True
    ParentFont = False
    State = cbUnchecked
    TabOrder = 4
    OnClick = cbBeamWidthClick
  end
  object cbEnvelope: TRzCheckBox
    Left = 8
    Top = 32
    Width = 186
    Height = 19
    AlignmentVertical = avCenter
    Caption = 'Show Power Summation Envelope'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    HotTrack = True
    ParentFont = False
    State = cbUnchecked
    TabOrder = 5
    OnClick = cbEnvelopeClick
  end
  object spZoom: TRzSpinner
    Left = 120
    Top = 54
    Width = 82
    Hint = ' Zoom Factor [%] '
    Max = 200
    Min = 20
    Value = 73
    OnChange = spZoomChange
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Fixedsys'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
  end
  object spAngle: TRzSpinner
    Left = 8
    Top = 54
    Width = 82
    Hint = ' Angular Offset ['#176'] '
    Increment = 5
    Max = 180
    Min = -180
    Value = -40
    OnChange = spAngleChange
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -13
    Font.Name = 'Fixedsys'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
  end
  object pcBeamPattern: TPolarChart
    Left = 8
    Top = 81
    Width = 194
    Height = 194
    AllocSize = 1000
    AutoRedraw = True
    AutoCenter = True
    CenterX = 97
    CenterY = 97
    ClassDefault = 0
    GridStyleAngular = gsAngDots
    GridStyleRadial = gsRadBothDots
    LabelModeAngular = almDegrees
    LabelModeRadial = rlmVertCenter
    CrossHair1.Color = clBlack
    CrossHair1.LineType = psSolid
    CrossHair1.LineWid = 1
    CrossHair1.Mode = chOff
    CrossHair2.Color = clBlack
    CrossHair2.LineType = psSolid
    CrossHair2.LineWid = 1
    CrossHair2.Mode = chOff
    CrossHair3.Color = clBlack
    CrossHair3.LineType = psSolid
    CrossHair3.LineWid = 1
    CrossHair3.Mode = chOff
    CrossHair4.Color = clBlack
    CrossHair4.LineType = psSolid
    CrossHair4.LineWid = 1
    CrossHair4.Mode = chOff
    RangeHigh = 1.000000000000000000
    AngleBtwRays = 30.000000000000000000
    MagFactor = 1.000000000000000000
    MouseAction = maNone
    RotationDir = rdClockwise
    ShadowStyle = ssFlying
    ShadowColor = clGrayText
    ShadowBakColor = clBtnFace
    TextFontStyle = []
    TextBkStyle = tbClear
    TextBkColor = clWhite
    TextAlignment = taCenter
    UseDegrees = True
    OnMouseDown = pcBeamPatternMouseDown
    OnMouseUp = pcBeamPatternMouseUp
    OnMouseMoveInChart = pcBeamPatternMouseMoveInChart
  end
end
