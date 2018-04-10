object DoorscheduleRegForm: TDoorscheduleRegForm
  Left = 855
  Top = 22
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #50868#50689' '#49828#52992#51572' '#51648#51221
  ClientHeight = 944
  ClientWidth = 612
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #44404#47548
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object RzGroupBox1: TRzGroupBox
    Left = 8
    Top = 56
    Width = 593
    Height = 137
    Caption = #54217#51068' '#49828#52992#51572
    TabOrder = 0
    object PaintBox1: TPaintBox
      Left = 9
      Top = 56
      Width = 580
      Height = 17
      Color = 15198183
      ParentColor = False
      OnPaint = PaintBox1Paint
    end
    object Label1: TLabel
      Left = 78
      Top = 42
      Width = 51
      Height = 16
      Caption = 'Label1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label2: TLabel
      Left = 136
      Top = 105
      Width = 51
      Height = 16
      Caption = 'Label2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label3: TLabel
      Left = 197
      Top = 56
      Width = 42
      Height = 16
      Caption = '12:23'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label4: TLabel
      Left = 258
      Top = 105
      Width = 51
      Height = 16
      Caption = 'Label4'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label6: TLabel
      Left = 8
      Top = 23
      Width = 30
      Height = 13
      Caption = #54217#51068
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Panel1: TPanel
      Left = 8
      Top = 74
      Width = 580
      Height = 33
      TabOrder = 0
      object Panel2: TPanel
        Tag = 1
        Left = 1
        Top = 1
        Width = 89
        Height = 31
        Hint = '1'
        Align = alLeft
        BevelOuter = bvLowered
        Color = clYellow
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnDblClick = Panel2DblClick
        OnDragDrop = Panel2DragDrop
        OnDragOver = Panel2DragOver
        OnResize = Panel2Resize
        object Panel3: TPanel
          Tag = 2
          Left = 84
          Top = 1
          Width = 4
          Height = 29
          Cursor = crSizeWE
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          OnMouseMove = Panel3MouseMove
        end
      end
      object Panel6: TPanel
        Tag = 1
        Left = 210
        Top = 1
        Width = 60
        Height = 31
        Hint = '4'
        Align = alLeft
        BevelOuter = bvLowered
        Color = clYellow
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnDblClick = Panel2DblClick
        OnDragDrop = Panel2DragDrop
        OnDragOver = Panel2DragOver
        OnResize = Panel2Resize
        object Panel5: TPanel
          Tag = 2
          Left = 55
          Top = 1
          Width = 4
          Height = 29
          Cursor = crSizeWE
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          OnMouseMove = Panel3MouseMove
        end
      end
      object Panel4: TPanel
        Tag = 1
        Left = 270
        Top = 1
        Width = 307
        Height = 31
        Hint = '5'
        Align = alLeft
        BevelOuter = bvLowered
        Color = clYellow
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnDblClick = Panel2DblClick
        OnDragDrop = Panel2DragDrop
        OnDragOver = Panel2DragOver
        OnResize = Panel2Resize
      end
      object Panel12: TPanel
        Tag = 1
        Left = 150
        Top = 1
        Width = 60
        Height = 31
        Hint = '3'
        Align = alLeft
        BevelOuter = bvLowered
        Color = clYellow
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnDblClick = Panel2DblClick
        OnDragDrop = Panel2DragDrop
        OnDragOver = Panel2DragOver
        OnResize = Panel2Resize
        object Panel13: TPanel
          Tag = 2
          Left = 55
          Top = 1
          Width = 4
          Height = 29
          Cursor = crSizeWE
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          OnMouseMove = Panel3MouseMove
        end
      end
      object Panel14: TPanel
        Tag = 1
        Left = 90
        Top = 1
        Width = 60
        Height = 31
        Hint = '2'
        Align = alLeft
        BevelOuter = bvLowered
        Color = clYellow
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnDblClick = Panel2DblClick
        OnDragDrop = Panel2DragDrop
        OnDragOver = Panel2DragOver
        OnResize = Panel2Resize
        object Panel15: TPanel
          Tag = 2
          Left = 55
          Top = 1
          Width = 4
          Height = 29
          Cursor = crSizeWE
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          OnMouseMove = Panel3MouseMove
        end
      end
    end
    object Panel31: TPanel
      Left = 300
      Top = 18
      Width = 57
      Height = 23
      Caption = #52488#44592#54868
      TabOrder = 1
      OnClick = Panel31Click
    end
    object Panel32: TPanel
      Tag = 1
      Left = 359
      Top = 18
      Width = 57
      Height = 23
      Caption = #44060#48169
      Color = clGreen
      DragMode = dmAutomatic
      TabOrder = 2
    end
    object Panel33: TPanel
      Tag = 1
      Left = 417
      Top = 18
      Width = 57
      Height = 23
      Caption = #50868#50689
      Color = clAqua
      DragMode = dmAutomatic
      TabOrder = 3
    end
    object Panel34: TPanel
      Tag = 1
      Left = 475
      Top = 18
      Width = 57
      Height = 23
      Caption = #54224#49604
      Color = clRed
      DragMode = dmAutomatic
      TabOrder = 4
    end
    object Panel85: TPanel
      Tag = 1
      Left = 531
      Top = 18
      Width = 57
      Height = 23
      Caption = #47560#49828#53552
      Color = clPurple
      DragMode = dmAutomatic
      TabOrder = 5
    end
  end
  object RzGroupBox2: TRzGroupBox
    Left = 8
    Top = 195
    Width = 593
    Height = 137
    Caption = ' '#48152#55092#51068' '#49828#52992#51572' '
    TabOrder = 1
    object PaintBox2: TPaintBox
      Left = 9
      Top = 59
      Width = 580
      Height = 15
      Color = 15198183
      ParentColor = False
      OnPaint = PaintBox2Paint
    end
    object Label5: TLabel
      Left = 78
      Top = 59
      Width = 51
      Height = 16
      Caption = 'Label1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label7: TLabel
      Left = 136
      Top = 107
      Width = 51
      Height = 16
      Caption = 'Label2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label8: TLabel
      Left = 197
      Top = 59
      Width = 42
      Height = 16
      Caption = '12:23'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label9: TLabel
      Left = 258
      Top = 106
      Width = 51
      Height = 16
      Caption = 'Label4'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label10: TLabel
      Left = 8
      Top = 29
      Width = 45
      Height = 13
      Caption = #53664#50836#51068
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Panel7: TPanel
      Left = 8
      Top = 75
      Width = 580
      Height = 33
      TabOrder = 0
      object Panel8: TPanel
        Tag = 1
        Left = 1
        Top = 1
        Width = 89
        Height = 31
        Hint = '1'
        Align = alLeft
        BevelOuter = bvLowered
        Color = clYellow
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnDblClick = Panel8DblClick
        OnDragDrop = Panel8DragDrop
        OnDragOver = Panel8DragOver
        OnResize = Panel8Resize
        object Panel9: TPanel
          Tag = 2
          Left = 84
          Top = 1
          Width = 4
          Height = 29
          Cursor = crSizeWE
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          OnMouseMove = Panel3MouseMove
        end
      end
      object Panel10: TPanel
        Tag = 1
        Left = 210
        Top = 1
        Width = 60
        Height = 31
        Hint = '4'
        Align = alLeft
        BevelOuter = bvLowered
        Color = clYellow
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnDblClick = Panel8DblClick
        OnDragDrop = Panel8DragDrop
        OnDragOver = Panel8DragOver
        OnResize = Panel8Resize
        object Panel11: TPanel
          Tag = 2
          Left = 55
          Top = 1
          Width = 4
          Height = 29
          Cursor = crSizeWE
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          OnMouseMove = Panel3MouseMove
        end
      end
      object Panel16: TPanel
        Tag = 1
        Left = 270
        Top = 1
        Width = 307
        Height = 31
        Hint = '5'
        Align = alLeft
        BevelOuter = bvLowered
        Color = clYellow
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnDblClick = Panel8DblClick
        OnDragDrop = Panel8DragDrop
        OnDragOver = Panel8DragOver
        OnResize = Panel8Resize
      end
      object Panel17: TPanel
        Tag = 1
        Left = 150
        Top = 1
        Width = 60
        Height = 31
        Hint = '3'
        Align = alLeft
        BevelOuter = bvLowered
        Color = clYellow
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnDblClick = Panel8DblClick
        OnDragDrop = Panel8DragDrop
        OnDragOver = Panel8DragOver
        OnResize = Panel8Resize
        object Panel18: TPanel
          Tag = 2
          Left = 55
          Top = 1
          Width = 4
          Height = 29
          Cursor = crSizeWE
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          OnMouseMove = Panel3MouseMove
        end
      end
      object Panel19: TPanel
        Tag = 1
        Left = 90
        Top = 1
        Width = 60
        Height = 31
        Hint = '2'
        Align = alLeft
        BevelOuter = bvLowered
        Color = clYellow
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnDblClick = Panel8DblClick
        OnDragDrop = Panel8DragDrop
        OnDragOver = Panel8DragOver
        OnResize = Panel8Resize
        object Panel20: TPanel
          Tag = 2
          Left = 55
          Top = 1
          Width = 4
          Height = 29
          Cursor = crSizeWE
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          OnMouseMove = Panel3MouseMove
        end
      end
    end
    object Panel35: TPanel
      Left = 300
      Top = 24
      Width = 57
      Height = 23
      Caption = #52488#44592#54868
      TabOrder = 1
      OnClick = Panel35Click
    end
    object Panel36: TPanel
      Tag = 1
      Left = 357
      Top = 24
      Width = 57
      Height = 23
      Caption = #44060#48169
      Color = clGreen
      DragMode = dmAutomatic
      TabOrder = 2
    end
    object Panel37: TPanel
      Tag = 1
      Left = 415
      Top = 24
      Width = 57
      Height = 23
      Caption = #50868#50689
      Color = clAqua
      DragMode = dmAutomatic
      TabOrder = 3
    end
    object Panel38: TPanel
      Tag = 1
      Left = 473
      Top = 24
      Width = 57
      Height = 23
      Caption = #54224#49604
      Color = clRed
      DragMode = dmAutomatic
      TabOrder = 4
    end
    object Panel86: TPanel
      Tag = 1
      Left = 531
      Top = 24
      Width = 57
      Height = 23
      Caption = #47560#49828#53552
      Color = clPurple
      DragMode = dmAutomatic
      TabOrder = 5
    end
  end
  object RzGroupBox3: TRzGroupBox
    Left = 8
    Top = 334
    Width = 593
    Height = 137
    Caption = ' '#51068#50836#51068' '#49828#52992#51572' '
    TabOrder = 2
    object PaintBox3: TPaintBox
      Left = 9
      Top = 58
      Width = 580
      Height = 18
      Color = 15198183
      ParentColor = False
      OnPaint = PaintBox3Paint
    end
    object Label11: TLabel
      Left = 78
      Top = 57
      Width = 51
      Height = 16
      Caption = 'Label1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label12: TLabel
      Left = 136
      Top = 108
      Width = 51
      Height = 16
      Caption = 'Label2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label13: TLabel
      Left = 197
      Top = 57
      Width = 42
      Height = 16
      Caption = '12:23'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label14: TLabel
      Left = 258
      Top = 107
      Width = 51
      Height = 16
      Caption = 'Label4'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label15: TLabel
      Left = 8
      Top = 29
      Width = 45
      Height = 13
      Caption = #51068#50836#51068
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Panel21: TPanel
      Left = 8
      Top = 76
      Width = 580
      Height = 33
      TabOrder = 0
      object Panel22: TPanel
        Tag = 1
        Left = 1
        Top = 1
        Width = 89
        Height = 31
        Hint = '1'
        Align = alLeft
        BevelOuter = bvLowered
        Color = clYellow
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnDblClick = Panel22DblClick
        OnDragDrop = Panel22DragDrop
        OnDragOver = Panel22DragOver
        OnResize = Panel22Resize
        object Panel23: TPanel
          Tag = 2
          Left = 84
          Top = 1
          Width = 4
          Height = 29
          Cursor = crSizeWE
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          OnMouseMove = Panel3MouseMove
        end
      end
      object Panel24: TPanel
        Tag = 1
        Left = 210
        Top = 1
        Width = 60
        Height = 31
        Hint = '4'
        Align = alLeft
        BevelOuter = bvLowered
        Color = clYellow
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnDblClick = Panel22DblClick
        OnDragDrop = Panel22DragDrop
        OnDragOver = Panel22DragOver
        OnResize = Panel22Resize
        object Panel25: TPanel
          Tag = 2
          Left = 55
          Top = 1
          Width = 4
          Height = 29
          Cursor = crSizeWE
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          OnMouseMove = Panel3MouseMove
        end
      end
      object Panel26: TPanel
        Tag = 1
        Left = 270
        Top = 1
        Width = 307
        Height = 31
        Hint = '5'
        Align = alLeft
        BevelOuter = bvLowered
        Color = clYellow
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnDblClick = Panel22DblClick
        OnDragDrop = Panel22DragDrop
        OnDragOver = Panel22DragOver
        OnResize = Panel22Resize
      end
      object Panel27: TPanel
        Tag = 1
        Left = 150
        Top = 1
        Width = 60
        Height = 31
        Hint = '3'
        Align = alLeft
        BevelOuter = bvLowered
        Color = clYellow
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnDblClick = Panel22DblClick
        OnDragDrop = Panel22DragDrop
        OnDragOver = Panel22DragOver
        OnResize = Panel22Resize
        object Panel28: TPanel
          Tag = 2
          Left = 55
          Top = 1
          Width = 4
          Height = 29
          Cursor = crSizeWE
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          OnMouseMove = Panel3MouseMove
        end
      end
      object Panel29: TPanel
        Tag = 1
        Left = 90
        Top = 1
        Width = 60
        Height = 31
        Hint = '2'
        Align = alLeft
        BevelOuter = bvLowered
        Color = clYellow
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnDblClick = Panel22DblClick
        OnDragDrop = Panel22DragDrop
        OnDragOver = Panel22DragOver
        OnResize = Panel22Resize
        object Panel30: TPanel
          Tag = 2
          Left = 55
          Top = 1
          Width = 4
          Height = 29
          Cursor = crSizeWE
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          OnMouseMove = Panel3MouseMove
        end
      end
    end
    object Panel39: TPanel
      Left = 300
      Top = 24
      Width = 57
      Height = 23
      Caption = #52488#44592#54868
      TabOrder = 1
      OnClick = Panel39Click
    end
    object Panel40: TPanel
      Tag = 1
      Left = 357
      Top = 24
      Width = 57
      Height = 23
      Caption = #44060#48169
      Color = clGreen
      DragMode = dmAutomatic
      TabOrder = 2
    end
    object Panel41: TPanel
      Tag = 1
      Left = 415
      Top = 24
      Width = 57
      Height = 23
      Caption = #50868#50689
      Color = clAqua
      DragMode = dmAutomatic
      TabOrder = 3
    end
    object Panel42: TPanel
      Tag = 1
      Left = 473
      Top = 24
      Width = 57
      Height = 23
      Caption = #54224#49604
      Color = clRed
      DragMode = dmAutomatic
      TabOrder = 4
    end
    object Panel87: TPanel
      Tag = 1
      Left = 531
      Top = 24
      Width = 57
      Height = 23
      Caption = #47560#49828#53552
      Color = clPurple
      DragMode = dmAutomatic
      TabOrder = 5
    end
  end
  object RzDBRadioGroup1: TRzDBRadioGroup
    Left = 8
    Top = 473
    Width = 593
    Height = 137
    Caption = #53945#51221#51068' '#49828#52992#51572'1'
    TabOrder = 3
    object PaintBox4: TPaintBox
      Left = 9
      Top = 46
      Width = 580
      Height = 18
      Color = 15198183
      ParentColor = False
      OnPaint = PaintBox4Paint
    end
    object Label16: TLabel
      Left = 78
      Top = 45
      Width = 51
      Height = 16
      Caption = 'Label1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label17: TLabel
      Left = 136
      Top = 96
      Width = 51
      Height = 16
      Caption = 'Label2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label18: TLabel
      Left = 197
      Top = 45
      Width = 42
      Height = 16
      Caption = '12:23'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label19: TLabel
      Left = 258
      Top = 95
      Width = 60
      Height = 16
      Caption = 'Label19'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label20: TLabel
      Left = 8
      Top = 29
      Width = 53
      Height = 13
      Caption = #53945#51221#51068'1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Panel43: TPanel
      Left = 8
      Top = 64
      Width = 580
      Height = 33
      TabOrder = 0
      object Panel44: TPanel
        Tag = 1
        Left = 1
        Top = 1
        Width = 89
        Height = 31
        Hint = '1'
        Align = alLeft
        BevelOuter = bvLowered
        Color = clYellow
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnDblClick = Panel44DblClick
        OnDragDrop = Panel44DragDrop
        OnDragOver = Panel44DragOver
        OnResize = Panel44Resize
        object Panel45: TPanel
          Tag = 2
          Left = 84
          Top = 1
          Width = 4
          Height = 29
          Cursor = crSizeWE
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          OnMouseMove = Panel3MouseMove
        end
      end
      object Panel46: TPanel
        Tag = 1
        Left = 210
        Top = 1
        Width = 60
        Height = 31
        Hint = '4'
        Align = alLeft
        BevelOuter = bvLowered
        Color = clYellow
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnDblClick = Panel44DblClick
        OnDragDrop = Panel44DragDrop
        OnDragOver = Panel44DragOver
        OnResize = Panel44Resize
        object Panel47: TPanel
          Tag = 2
          Left = 55
          Top = 1
          Width = 4
          Height = 29
          Cursor = crSizeWE
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          OnMouseMove = Panel3MouseMove
        end
      end
      object Panel48: TPanel
        Tag = 1
        Left = 270
        Top = 1
        Width = 307
        Height = 31
        Hint = '5'
        Align = alLeft
        BevelOuter = bvLowered
        Color = clYellow
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnDblClick = Panel44DblClick
        OnDragDrop = Panel44DragDrop
        OnDragOver = Panel44DragOver
        OnResize = Panel44Resize
      end
      object Panel49: TPanel
        Tag = 1
        Left = 150
        Top = 1
        Width = 60
        Height = 31
        Hint = '3'
        Align = alLeft
        BevelOuter = bvLowered
        Color = clYellow
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnDblClick = Panel44DblClick
        OnDragDrop = Panel44DragDrop
        OnDragOver = Panel44DragOver
        OnResize = Panel44Resize
        object Panel50: TPanel
          Tag = 2
          Left = 55
          Top = 1
          Width = 4
          Height = 29
          Cursor = crSizeWE
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          OnMouseMove = Panel3MouseMove
        end
      end
      object Panel51: TPanel
        Tag = 1
        Left = 90
        Top = 1
        Width = 60
        Height = 31
        Hint = '2'
        Align = alLeft
        BevelOuter = bvLowered
        Color = clYellow
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnDblClick = Panel44DblClick
        OnDragDrop = Panel44DragDrop
        OnDragOver = Panel44DragOver
        OnResize = Panel44Resize
        object Panel52: TPanel
          Tag = 2
          Left = 55
          Top = 1
          Width = 4
          Height = 29
          Cursor = crSizeWE
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          OnMouseMove = Panel3MouseMove
        end
      end
    end
    object Panel53: TPanel
      Left = 300
      Top = 24
      Width = 57
      Height = 19
      Caption = #52488#44592#54868
      TabOrder = 1
      OnClick = Panel53Click
    end
    object Panel54: TPanel
      Tag = 1
      Left = 357
      Top = 24
      Width = 57
      Height = 19
      Caption = #44060#48169
      Color = clGreen
      DragMode = dmAutomatic
      TabOrder = 2
    end
    object Panel55: TPanel
      Tag = 1
      Left = 415
      Top = 24
      Width = 57
      Height = 19
      Caption = #50868#50689
      Color = clAqua
      DragMode = dmAutomatic
      TabOrder = 3
    end
    object Panel56: TPanel
      Tag = 1
      Left = 473
      Top = 24
      Width = 57
      Height = 19
      Caption = #54224#49604
      Color = clRed
      DragMode = dmAutomatic
      TabOrder = 4
    end
    object Panel88: TPanel
      Tag = 1
      Left = 531
      Top = 22
      Width = 57
      Height = 23
      Caption = #47560#49828#53552
      Color = clPurple
      DragMode = dmAutomatic
      TabOrder = 5
    end
  end
  object btnSave: TRzBitBtn
    Left = 107
    Top = 897
    Width = 87
    Height = 30
    Caption = #51312#54924
    Color = 15791348
    HighlightColor = 16026986
    HotTrack = True
    HotTrackColor = 3983359
    TabOrder = 4
    Visible = False
    OnClick = btnSaveClick
    Glyph.Data = {
      36060000424D3606000000000000360400002800000020000000100000000100
      08000000000000020000730E0000730E00000001000000000000000000003300
      00006600000099000000CC000000FF0000000033000033330000663300009933
      0000CC330000FF33000000660000336600006666000099660000CC660000FF66
      000000990000339900006699000099990000CC990000FF99000000CC000033CC
      000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
      0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
      330000333300333333006633330099333300CC333300FF333300006633003366
      33006666330099663300CC663300FF6633000099330033993300669933009999
      3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
      330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
      66006600660099006600CC006600FF0066000033660033336600663366009933
      6600CC336600FF33660000666600336666006666660099666600CC666600FF66
      660000996600339966006699660099996600CC996600FF99660000CC660033CC
      660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
      6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
      990000339900333399006633990099339900CC339900FF339900006699003366
      99006666990099669900CC669900FF6699000099990033999900669999009999
      9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
      990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
      CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
      CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
      CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
      CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
      CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
      FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
      FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
      FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
      FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
      000000808000800000008000800080800000C0C0C00080808000191919004C4C
      4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
      6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
      E8B4D8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E281E8E8E8E8E8E8E8E8E8E8E8E8E8
      B46C6CD8E8E8E8E8E8E8E8E8E8E8E8E8E2818181E8E8E8E8E8E8E8E8E8E8E8E8
      B46CD86CD8E8E8E8E8E8E8E8E8E8E8E8E281818181E8E8E8E8E8E8E8E8E8E8E8
      B46C6CD86CD8E8E8E8E8E8E8E8E8E8E8E28181818181E8E8E8E8E8E8E8E8E8D7
      5E6C6C6CB46CD8E8E8E8E8E8E8E8E8D781818181E28181E8E8E8E8E8E8E8E8D7
      89896CB4B4B46CD8E8E8E8E8E8E8E8D7ACAC81E2E2E28181E8E8E8E8E8E8D789
      89D7D7B4C7C7C76CE8E8E8E8E8E8D7ACACD7D7E2ACACAC81E8E8E8E8E8D78989
      D7D7D7D76C6C6CE8E8E8E8E8E8D7ACACD7D7D7D7818181E8E8E8E8E8D78989D7
      D7D75E5EE8E8E8E8E8E8E8E8D7ACACD7D7D78181E8E8E8E8E8E8E8D78989D7D7
      D75EE8E8E8E8E8E8E8E8E8D7ACACD7D7D781E8E8E8E8E8E8E8E8D78989D7D7D7
      5EB4E8E8E8E8E8E8E8E8D7ACACD7D7D781E2E8E8E8E8E8E8E8E85E89D7D7D75E
      B4E8E8E8E8E8E8E8E8E881ACD7D7D781E2E8E8E8E8E8E8E8E8E8E85ED7D75EE8
      E8E8E8E8E8E8E8E8E8E8E881D7D781E8E8E8E8E8E8E8E8E8E8E8E8E85E5EE8E8
      E8E8E8E8E8E8E8E8E8E8E8E88181E8E8E8E8E8E8E8E8E8E8E8E8}
    NumGlyphs = 2
  end
  object btnClose: TRzBitBtn
    Left = 527
    Top = 897
    Width = 74
    Height = 24
    Caption = #45803#44592
    Color = 15791348
    HighlightColor = 16026986
    HotTrack = True
    HotTrackColor = 3983359
    TabOrder = 5
    OnClick = btnCloseClick
    Glyph.Data = {
      36060000424D3606000000000000360400002800000020000000100000000100
      08000000000000020000730B0000730B00000001000000000000000000003300
      00006600000099000000CC000000FF0000000033000033330000663300009933
      0000CC330000FF33000000660000336600006666000099660000CC660000FF66
      000000990000339900006699000099990000CC990000FF99000000CC000033CC
      000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
      0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
      330000333300333333006633330099333300CC333300FF333300006633003366
      33006666330099663300CC663300FF6633000099330033993300669933009999
      3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
      330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
      66006600660099006600CC006600FF0066000033660033336600663366009933
      6600CC336600FF33660000666600336666006666660099666600CC666600FF66
      660000996600339966006699660099996600CC996600FF99660000CC660033CC
      660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
      6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
      990000339900333399006633990099339900CC339900FF339900006699003366
      99006666990099669900CC669900FF6699000099990033999900669999009999
      9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
      990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
      CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
      CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
      CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
      CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
      CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
      FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
      FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
      FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
      FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
      000000808000800000008000800080800000C0C0C00080808000191919004C4C
      4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
      6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
      EEE8E8E8E8E8E8E8E8E8E8E8E8E8E8E8EEE8E8E8E8E8E8E8E8E8E8E8E8EEE3AC
      E3EEE8E8E8E8E8E8E8E8E8E8E8EEE8ACE3EEE8E8E8E8E8E8E8E8E8EEE3E28257
      57E2ACE3EEE8E8E8E8E8E8EEE8E2818181E2ACE8EEE8E8E8E8E8E382578282D7
      578181E2E3E8E8E8E8E8E881818181D7818181E2E8E8E8E8E8E857828989ADD7
      57797979EEE8E8E8E8E88181DEDEACD781818181EEE8E8E8E8E857898989ADD7
      57AAAAA2D7ADE8E8E8E881DEDEDEACD781DEDE81D7ACE8E8E8E857898989ADD7
      57AACEA3AD10E8E8E8E881DEDEDEACD781DEAC81AC81E8E8E8E85789825EADD7
      57ABCFE21110E8E8E8E881DE8181ACD781ACACE28181E8E8E8E8578957D7ADD7
      57ABDE101010101010E881DE56D7ACD781ACDE818181818181E857898257ADD7
      57E810101010101010E881DE8156ACD781E381818181818181E857898989ADD7
      57E882101010101010E881DEDEDEACD781E381818181818181E857898989ADD7
      57ACEE821110E8E8E8E881DEDEDEACD781ACEE818181E8E8E8E857898989ADD7
      57ABE8AB8910E8E8E8E881DEDEDEACD781ACE3ACDE81E8E8E8E857828989ADD7
      57ACE8A3E889E8E8E8E88181DEDEACD781ACE381E8DEE8E8E8E8E8DE5E8288D7
      57A2A2A2E8E8E8E8E8E8E8DE8181DED781818181E8E8E8E8E8E8E8E8E8AC8257
      57E8E8E8E8E8E8E8E8E8E8E8E8AC818181E8E8E8E8E8E8E8E8E8}
    NumGlyphs = 2
  end
  object RzGroupBox4: TRzGroupBox
    Left = 8
    Top = 8
    Width = 593
    Height = 41
    Caption = #47928#51221#48372#49444#51221
    TabOrder = 6
    object Label21: TLabel
      Left = 8
      Top = 18
      Width = 73
      Height = 12
      Caption = 'ECU/ICU NO'
      Transparent = True
    end
    object Label22: TLabel
      Left = 224
      Top = 18
      Width = 36
      Height = 12
      Caption = #47928#48264#54840
      Transparent = True
    end
    object ComboBox_ECU: TRzComboBox
      Left = 88
      Top = 13
      Width = 120
      Height = 20
      Ctl3D = False
      FlatButtons = True
      FrameVisible = True
      ImeName = 'Microsoft IME 2003'
      ItemHeight = 12
      ParentCtl3D = False
      TabOrder = 0
      OnChange = ComboBox_ECUChange
    end
    object ComboBox_Door: TRzComboBox
      Left = 272
      Top = 13
      Width = 120
      Height = 20
      Ctl3D = False
      FlatButtons = True
      FrameVisible = True
      ImeName = 'Microsoft IME 2003'
      ItemHeight = 12
      ParentCtl3D = False
      TabOrder = 1
      Text = '99.'#51204#52404#47928
      Items.Strings = (
        '99.'#51204#52404#47928
        '01.1'#48264#47928
        '02.2'#48264#47928)
      ItemIndex = 0
    end
  end
  object RzDBRadioGroup2: TRzDBRadioGroup
    Left = 8
    Top = 612
    Width = 593
    Height = 137
    Caption = #53945#51221#51068' '#49828#52992#51572'2'
    TabOrder = 7
    object PaintBox5: TPaintBox
      Left = 9
      Top = 46
      Width = 580
      Height = 18
      Color = 15198183
      ParentColor = False
      OnPaint = PaintBox4Paint
    end
    object Label23: TLabel
      Left = 78
      Top = 45
      Width = 51
      Height = 16
      Caption = 'Label1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label24: TLabel
      Left = 136
      Top = 96
      Width = 51
      Height = 16
      Caption = 'Label2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label25: TLabel
      Left = 197
      Top = 45
      Width = 42
      Height = 16
      Caption = '12:23'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label26: TLabel
      Left = 258
      Top = 95
      Width = 60
      Height = 16
      Caption = 'Label19'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label27: TLabel
      Left = 8
      Top = 29
      Width = 53
      Height = 13
      Caption = #53945#51221#51068'2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Panel57: TPanel
      Left = 8
      Top = 64
      Width = 580
      Height = 33
      TabOrder = 0
      object Panel58: TPanel
        Tag = 1
        Left = 1
        Top = 1
        Width = 89
        Height = 31
        Hint = '1'
        Align = alLeft
        BevelOuter = bvLowered
        Color = clYellow
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnDblClick = Panel44DblClick
        OnDragDrop = Panel44DragDrop
        OnDragOver = Panel44DragOver
        OnResize = Panel44Resize
        object Panel59: TPanel
          Tag = 2
          Left = 84
          Top = 1
          Width = 4
          Height = 29
          Cursor = crSizeWE
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          OnMouseMove = Panel3MouseMove
        end
      end
      object Panel60: TPanel
        Tag = 1
        Left = 210
        Top = 1
        Width = 60
        Height = 31
        Hint = '4'
        Align = alLeft
        BevelOuter = bvLowered
        Color = clYellow
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnDblClick = Panel44DblClick
        OnDragDrop = Panel44DragDrop
        OnDragOver = Panel44DragOver
        OnResize = Panel44Resize
        object Panel61: TPanel
          Tag = 2
          Left = 55
          Top = 1
          Width = 4
          Height = 29
          Cursor = crSizeWE
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          OnMouseMove = Panel3MouseMove
        end
      end
      object Panel62: TPanel
        Tag = 1
        Left = 270
        Top = 1
        Width = 307
        Height = 31
        Hint = '5'
        Align = alLeft
        BevelOuter = bvLowered
        Color = clYellow
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnDblClick = Panel44DblClick
        OnDragDrop = Panel44DragDrop
        OnDragOver = Panel44DragOver
        OnResize = Panel44Resize
      end
      object Panel63: TPanel
        Tag = 1
        Left = 150
        Top = 1
        Width = 60
        Height = 31
        Hint = '3'
        Align = alLeft
        BevelOuter = bvLowered
        Color = clYellow
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnDblClick = Panel44DblClick
        OnDragDrop = Panel44DragDrop
        OnDragOver = Panel44DragOver
        OnResize = Panel44Resize
        object Panel64: TPanel
          Tag = 2
          Left = 55
          Top = 1
          Width = 4
          Height = 29
          Cursor = crSizeWE
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          OnMouseMove = Panel3MouseMove
        end
      end
      object Panel65: TPanel
        Tag = 1
        Left = 90
        Top = 1
        Width = 60
        Height = 31
        Hint = '2'
        Align = alLeft
        BevelOuter = bvLowered
        Color = clYellow
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnDblClick = Panel44DblClick
        OnDragDrop = Panel44DragDrop
        OnDragOver = Panel44DragOver
        OnResize = Panel44Resize
        object Panel66: TPanel
          Tag = 2
          Left = 55
          Top = 1
          Width = 4
          Height = 29
          Cursor = crSizeWE
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          OnMouseMove = Panel3MouseMove
        end
      end
    end
    object Panel67: TPanel
      Left = 300
      Top = 24
      Width = 57
      Height = 19
      Caption = #52488#44592#54868
      TabOrder = 1
      OnClick = Panel67Click
    end
    object Panel68: TPanel
      Tag = 1
      Left = 357
      Top = 24
      Width = 57
      Height = 19
      Caption = #44060#48169
      Color = clGreen
      DragMode = dmAutomatic
      TabOrder = 2
    end
    object Panel69: TPanel
      Tag = 1
      Left = 415
      Top = 24
      Width = 57
      Height = 19
      Caption = #50868#50689
      Color = clAqua
      DragMode = dmAutomatic
      TabOrder = 3
    end
    object Panel70: TPanel
      Tag = 1
      Left = 473
      Top = 24
      Width = 57
      Height = 19
      Caption = #54224#49604
      Color = clRed
      DragMode = dmAutomatic
      TabOrder = 4
    end
    object Panel89: TPanel
      Tag = 1
      Left = 531
      Top = 22
      Width = 57
      Height = 23
      Caption = #47560#49828#53552
      Color = clPurple
      DragMode = dmAutomatic
      TabOrder = 5
    end
  end
  object RzDBRadioGroup3: TRzDBRadioGroup
    Left = 8
    Top = 752
    Width = 593
    Height = 137
    Caption = #53945#51221#51068' '#49828#52992#51572'3'
    TabOrder = 8
    object PaintBox6: TPaintBox
      Left = 9
      Top = 46
      Width = 580
      Height = 18
      Color = 15198183
      ParentColor = False
      OnPaint = PaintBox4Paint
    end
    object Label28: TLabel
      Left = 78
      Top = 45
      Width = 51
      Height = 16
      Caption = 'Label1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label29: TLabel
      Left = 136
      Top = 96
      Width = 51
      Height = 16
      Caption = 'Label2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label30: TLabel
      Left = 197
      Top = 45
      Width = 42
      Height = 16
      Caption = '12:23'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label31: TLabel
      Left = 258
      Top = 95
      Width = 60
      Height = 16
      Caption = 'Label19'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -13
      Font.Name = 'System'
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Label32: TLabel
      Left = 8
      Top = 29
      Width = 53
      Height = 13
      Caption = #53945#51221#51068'3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = #44404#47548#52404
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = True
    end
    object Panel71: TPanel
      Left = 8
      Top = 64
      Width = 580
      Height = 33
      TabOrder = 0
      object Panel72: TPanel
        Tag = 1
        Left = 1
        Top = 1
        Width = 89
        Height = 31
        Hint = '1'
        Align = alLeft
        BevelOuter = bvLowered
        Color = clYellow
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnDblClick = Panel44DblClick
        OnDragDrop = Panel44DragDrop
        OnDragOver = Panel44DragOver
        OnResize = Panel44Resize
        object Panel73: TPanel
          Tag = 2
          Left = 84
          Top = 1
          Width = 4
          Height = 29
          Cursor = crSizeWE
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          OnMouseMove = Panel3MouseMove
        end
      end
      object Panel74: TPanel
        Tag = 1
        Left = 210
        Top = 1
        Width = 60
        Height = 31
        Hint = '4'
        Align = alLeft
        BevelOuter = bvLowered
        Color = clYellow
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnDblClick = Panel44DblClick
        OnDragDrop = Panel44DragDrop
        OnDragOver = Panel44DragOver
        OnResize = Panel44Resize
        object Panel75: TPanel
          Tag = 2
          Left = 55
          Top = 1
          Width = 4
          Height = 29
          Cursor = crSizeWE
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          OnMouseMove = Panel3MouseMove
        end
      end
      object Panel76: TPanel
        Tag = 1
        Left = 270
        Top = 1
        Width = 307
        Height = 31
        Hint = '5'
        Align = alLeft
        BevelOuter = bvLowered
        Color = clYellow
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnDblClick = Panel44DblClick
        OnDragDrop = Panel44DragDrop
        OnDragOver = Panel44DragOver
        OnResize = Panel44Resize
      end
      object Panel77: TPanel
        Tag = 1
        Left = 150
        Top = 1
        Width = 60
        Height = 31
        Hint = '3'
        Align = alLeft
        BevelOuter = bvLowered
        Color = clYellow
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnDblClick = Panel44DblClick
        OnDragDrop = Panel44DragDrop
        OnDragOver = Panel44DragOver
        OnResize = Panel44Resize
        object Panel78: TPanel
          Tag = 2
          Left = 55
          Top = 1
          Width = 4
          Height = 29
          Cursor = crSizeWE
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          OnMouseMove = Panel3MouseMove
        end
      end
      object Panel79: TPanel
        Tag = 1
        Left = 90
        Top = 1
        Width = 60
        Height = 31
        Hint = '2'
        Align = alLeft
        BevelOuter = bvLowered
        Color = clYellow
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnDblClick = Panel44DblClick
        OnDragDrop = Panel44DragDrop
        OnDragOver = Panel44DragOver
        OnResize = Panel44Resize
        object Panel80: TPanel
          Tag = 2
          Left = 55
          Top = 1
          Width = 4
          Height = 29
          Cursor = crSizeWE
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 0
          OnMouseMove = Panel3MouseMove
        end
      end
    end
    object Panel81: TPanel
      Left = 300
      Top = 24
      Width = 57
      Height = 19
      Caption = #52488#44592#54868
      TabOrder = 1
      OnClick = Panel81Click
    end
    object Panel82: TPanel
      Tag = 1
      Left = 357
      Top = 24
      Width = 57
      Height = 19
      Caption = #44060#48169
      Color = clGreen
      DragMode = dmAutomatic
      TabOrder = 2
    end
    object Panel83: TPanel
      Tag = 1
      Left = 415
      Top = 24
      Width = 57
      Height = 19
      Caption = #50868#50689
      Color = clAqua
      DragMode = dmAutomatic
      TabOrder = 3
    end
    object Panel84: TPanel
      Tag = 1
      Left = 473
      Top = 24
      Width = 57
      Height = 19
      Caption = #54224#49604
      Color = clRed
      DragMode = dmAutomatic
      TabOrder = 4
    end
    object Panel90: TPanel
      Tag = 1
      Left = 531
      Top = 22
      Width = 57
      Height = 23
      Caption = #47560#49828#53552
      Color = clPurple
      DragMode = dmAutomatic
      TabOrder = 5
    end
  end
  object btnSearch: TRzBitBtn
    Left = 431
    Top = 898
    Caption = #51312#54924
    Color = 15791348
    HighlightColor = 16026986
    HotTrack = True
    HotTrackColor = 3983359
    TabOrder = 9
    OnClick = btnSearchClick
    Glyph.Data = {
      36060000424D3606000000000000360400002800000020000000100000000100
      08000000000000020000430C0000430C00000001000000000000000000003300
      00006600000099000000CC000000FF0000000033000033330000663300009933
      0000CC330000FF33000000660000336600006666000099660000CC660000FF66
      000000990000339900006699000099990000CC990000FF99000000CC000033CC
      000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
      0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
      330000333300333333006633330099333300CC333300FF333300006633003366
      33006666330099663300CC663300FF6633000099330033993300669933009999
      3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
      330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
      66006600660099006600CC006600FF0066000033660033336600663366009933
      6600CC336600FF33660000666600336666006666660099666600CC666600FF66
      660000996600339966006699660099996600CC996600FF99660000CC660033CC
      660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
      6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
      990000339900333399006633990099339900CC339900FF339900006699003366
      99006666990099669900CC669900FF6699000099990033999900669999009999
      9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
      990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
      CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
      CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
      CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
      CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
      CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
      FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
      FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
      FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
      FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
      000000808000800000008000800080800000C0C0C00080808000191919004C4C
      4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
      6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8030303
      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E803040404
      0404030403030303E8E8E8E881E2E2E2E2E281E281818181E8E8E8E803050404
      0404040304030303E8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E803040504
      0404040403040303E8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E803050405
      0404040404030403E8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E803050504
      0504040404040303E8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E8035F0505
      0405040404040403E8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E8035F5F05
      0504050404040403E8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E8030303
      03030303030303E8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
    NumGlyphs = 2
  end
  object btnSend: TRzBitBtn
    Left = 327
    Top = 898
    Caption = #46321#47197
    Color = 15791348
    HighlightColor = 16026986
    HotTrack = True
    HotTrackColor = 3983359
    TabOrder = 10
    OnClick = btnSendClick
    Glyph.Data = {
      36060000424D3606000000000000360400002800000020000000100000000100
      08000000000000020000E30E0000E30E00000001000000000000000000003300
      00006600000099000000CC000000FF0000000033000033330000663300009933
      0000CC330000FF33000000660000336600006666000099660000CC660000FF66
      000000990000339900006699000099990000CC990000FF99000000CC000033CC
      000066CC000099CC0000CCCC0000FFCC000000FF000033FF000066FF000099FF
      0000CCFF0000FFFF000000003300330033006600330099003300CC003300FF00
      330000333300333333006633330099333300CC333300FF333300006633003366
      33006666330099663300CC663300FF6633000099330033993300669933009999
      3300CC993300FF99330000CC330033CC330066CC330099CC3300CCCC3300FFCC
      330000FF330033FF330066FF330099FF3300CCFF3300FFFF3300000066003300
      66006600660099006600CC006600FF0066000033660033336600663366009933
      6600CC336600FF33660000666600336666006666660099666600CC666600FF66
      660000996600339966006699660099996600CC996600FF99660000CC660033CC
      660066CC660099CC6600CCCC6600FFCC660000FF660033FF660066FF660099FF
      6600CCFF6600FFFF660000009900330099006600990099009900CC009900FF00
      990000339900333399006633990099339900CC339900FF339900006699003366
      99006666990099669900CC669900FF6699000099990033999900669999009999
      9900CC999900FF99990000CC990033CC990066CC990099CC9900CCCC9900FFCC
      990000FF990033FF990066FF990099FF9900CCFF9900FFFF99000000CC003300
      CC006600CC009900CC00CC00CC00FF00CC000033CC003333CC006633CC009933
      CC00CC33CC00FF33CC000066CC003366CC006666CC009966CC00CC66CC00FF66
      CC000099CC003399CC006699CC009999CC00CC99CC00FF99CC0000CCCC0033CC
      CC0066CCCC0099CCCC00CCCCCC00FFCCCC0000FFCC0033FFCC0066FFCC0099FF
      CC00CCFFCC00FFFFCC000000FF003300FF006600FF009900FF00CC00FF00FF00
      FF000033FF003333FF006633FF009933FF00CC33FF00FF33FF000066FF003366
      FF006666FF009966FF00CC66FF00FF66FF000099FF003399FF006699FF009999
      FF00CC99FF00FF99FF0000CCFF0033CCFF0066CCFF0099CCFF00CCCCFF00FFCC
      FF0000FFFF0033FFFF0066FFFF0099FFFF00CCFFFF00FFFFFF00000080000080
      000000808000800000008000800080800000C0C0C00080808000191919004C4C
      4C00B2B2B200E5E5E500C8AC2800E0CC6600F2EABF00B59B2400D8E9EC009933
      6600D075A300ECC6D900646F710099A8AC00E2EFF10000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E86C6C6C
      6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E86C909090
      90906C906C6C6C6CE8E8E8E881E2E2E2E2E281E281818181E8E8E8E86CB49090
      9090906C906C6C6CE8E8E8E881ACE2E2E2E2E281E2818181E8E8E8E86C90B490
      909090906C906C6CE8E8E8E881E2ACE2E2E2E2E281E28181E8E8E8E86CB490B4
      90909090906C906CE8E8E8E881ACE2ACE2E2E2E2E281E281E8E8E8E86CB4B490
      B490909090906C6CE8E8E8E881ACACE2ACE2E2E2E2E28181E8E8E8E86CC9B4B4
      90B490909090906CE8E8E8E881E3ACACE2ACE2E2E2E2E281E8E8E8E86CC9C9B4
      B490B4909090906CE8E8E8E881E3E3ACACE2ACE2E2E2E281E8E8E8E8E86C6C6C
      6C6C6C6C6C6C6CE8E8E8E8E8E881818181818181818181E8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
    NumGlyphs = 2
  end
end
