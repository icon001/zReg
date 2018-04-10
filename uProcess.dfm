object fmPrograss: TfmPrograss
  Left = 509
  Top = 439
  Width = 454
  Height = 144
  Caption = 'STATUS WINDOW'
  Color = clBtnFace
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548#52404
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 446
    Height = 49
    Align = alTop
    Caption = 'Processing...'
    Font.Charset = HANGEUL_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #44404#47548#52404
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 49
    Width = 446
    Height = 61
    Align = alClient
    TabOrder = 1
    object SpeedButton1: TSpeedButton
      Left = 176
      Top = 32
      Width = 97
      Height = 25
      Caption = 'CLOSE'
      OnClick = SpeedButton1Click
    end
    object ProgressBar1: TProgressBar
      Left = 1
      Top = 1
      Width = 444
      Height = 25
      Align = alTop
      TabOrder = 0
    end
  end
  object WaitTimer: TTimer
    Interval = 5000
    OnTimer = WaitTimerTimer
    Left = 24
    Top = 16
  end
  object PrograssTimer1: TTimer
    Interval = 500
    OnTimer = PrograssTimer1Timer
    Left = 56
    Top = 16
  end
end
