object fmMessage: TfmMessage
  Left = 456
  Top = 308
  BorderStyle = bsDialog
  Caption = 'fmMessage'
  ClientHeight = 116
  ClientWidth = 373
  Color = clBtnFace
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548#52404
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 373
    Height = 57
    Align = alTop
    Caption = 'Panel1'
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = #44404#47548#52404
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Button1: TButton
    Left = 136
    Top = 72
    Width = 89
    Height = 33
    Caption = #54869#51064
    TabOrder = 1
    OnClick = Button1Click
  end
  object CloseTimer: TTimer
    OnTimer = CloseTimerTimer
    Left = 44
    Top = 20
  end
end
