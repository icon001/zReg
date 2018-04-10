object fmPGConfig: TfmPGConfig
  Left = 585
  Top = 211
  Width = 339
  Height = 161
  Caption = #54872#44221#49444#51221
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 72
    Top = 28
    Width = 121
    Height = 13
    AutoSize = False
    Caption = #49548#53011#49688#49888'TimeOut'
  end
  object Label2: TLabel
    Left = 264
    Top = 28
    Width = 49
    Height = 13
    AutoSize = False
    Caption = #52488
  end
  object ed_SocketDelayTime: TEdit
    Left = 200
    Top = 24
    Width = 57
    Height = 21
    ImeName = 'Microsoft IME 2010'
    TabOrder = 0
    Text = 'ed_SocketDelayTime'
  end
  object Button1: TButton
    Left = 120
    Top = 72
    Width = 129
    Height = 33
    Caption = #54869#51064
    TabOrder = 1
    OnClick = Button1Click
  end
  object ck_USE: TCheckBox
    Left = 9
    Top = 26
    Width = 56
    Height = 17
    Caption = #49324#50857
    TabOrder = 2
  end
end
