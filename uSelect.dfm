object fmSelect: TfmSelect
  Left = 445
  Top = 238
  Width = 265
  Height = 196
  BorderIcons = [biSystemMenu]
  Caption = #54532#47196#44536#47016#53440#51077#49440#53469
  Color = clBtnFace
  Font.Charset = HANGEUL_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548#52404
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object SpeedButton1: TSpeedButton
    Left = 72
    Top = 112
    Width = 105
    Height = 33
    Caption = #49440#53469
    OnClick = SpeedButton1Click
  end
  object rg_CardType: TRadioGroup
    Left = 0
    Top = 0
    Width = 257
    Height = 97
    Align = alTop
    Caption = #54532#47196#44536#47016#53440#51077#49440#53469
    ItemIndex = 0
    Items.Strings = (
      'KT-TELECOP'
      'S-TEC')
    TabOrder = 0
    OnClick = rg_CardTypeClick
  end
end
