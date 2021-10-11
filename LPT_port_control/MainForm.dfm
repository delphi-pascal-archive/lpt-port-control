object LPTForm: TLPTForm
  Left = 192
  Top = 109
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'LPT Controller with LPTControll.dll'
  ClientHeight = 281
  ClientWidth = 360
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StatusLabel: TLabel
    Left = 25
    Top = 248
    Width = 88
    Height = 13
    Caption = 'Status: Not started'
  end
  object Bevel: TBevel
    Left = 8
    Top = 240
    Width = 345
    Height = 33
  end
  object Button1: TButton
    Left = 8
    Top = 199
    Width = 75
    Height = 25
    Caption = 'LPT Start'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 197
    Top = 199
    Width = 75
    Height = 25
    Caption = 'LPT Pause'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 89
    Top = 199
    Width = 75
    Height = 25
    Caption = 'LPT stop'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button7: TButton
    Left = 278
    Top = 199
    Width = 75
    Height = 25
    Caption = 'LPT Resume'
    TabOrder = 3
    OnClick = Button7Click
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 105
    Height = 185
    Caption = 'Status'
    TabOrder = 4
    object Port0State: TLabel
      Left = 55
      Top = 24
      Width = 6
      Height = 13
      Caption = '?'
    end
    object Port1State: TLabel
      Left = 55
      Top = 43
      Width = 6
      Height = 13
      Caption = '?'
    end
    object Port2State: TLabel
      Left = 55
      Top = 62
      Width = 6
      Height = 13
      Caption = '?'
    end
    object Port3State: TLabel
      Left = 55
      Top = 81
      Width = 6
      Height = 13
      Caption = '?'
    end
    object Port4State: TLabel
      Left = 55
      Top = 100
      Width = 6
      Height = 13
      Caption = '?'
    end
    object Port5State: TLabel
      Left = 55
      Top = 119
      Width = 6
      Height = 13
      Caption = '?'
    end
    object Port6State: TLabel
      Left = 55
      Top = 138
      Width = 6
      Height = 13
      Caption = '?'
    end
    object Port7State: TLabel
      Left = 55
      Top = 157
      Width = 6
      Height = 13
      Caption = '?'
    end
    object Label9: TLabel
      Left = 16
      Top = 24
      Width = 31
      Height = 13
      Caption = 'Port 0:'
    end
    object Label10: TLabel
      Left = 16
      Top = 43
      Width = 31
      Height = 13
      Caption = 'Port 1:'
    end
    object Label11: TLabel
      Left = 16
      Top = 62
      Width = 31
      Height = 13
      Caption = 'Port 2:'
    end
    object Label12: TLabel
      Left = 16
      Top = 81
      Width = 31
      Height = 13
      Caption = 'Port 3:'
    end
    object Label13: TLabel
      Left = 16
      Top = 100
      Width = 31
      Height = 13
      Caption = 'Port 4:'
    end
    object Label14: TLabel
      Left = 16
      Top = 119
      Width = 31
      Height = 13
      Caption = 'Port 5:'
    end
    object Label15: TLabel
      Left = 16
      Top = 138
      Width = 31
      Height = 13
      Caption = 'Port 6:'
    end
    object Label16: TLabel
      Left = 16
      Top = 157
      Width = 31
      Height = 13
      Caption = 'Port 7:'
    end
  end
  object GroupBox2: TGroupBox
    Left = 119
    Top = 8
    Width = 234
    Height = 113
    Caption = 'Change status'
    TabOrder = 5
    object StateChangeDd: TComboBox
      Left = 48
      Top = 35
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      ItemIndex = 0
      TabOrder = 0
      Text = 'Choose port...'
      OnChange = StateChangeDdChange
      Items.Strings = (
        'Choose port...'
        'Port 0'
        'Port 1'
        'Port 2'
        'Port 3'
        'Port 4'
        'Port 5'
        'Port 6'
        'Port 7')
    end
    object SwitchPorts: TButton
      Left = 48
      Top = 62
      Width = 145
      Height = 25
      Caption = 'Switch'
      Enabled = False
      TabOrder = 1
      OnClick = SwitchPortsClick
    end
  end
  object GroupBox3: TGroupBox
    Left = 119
    Top = 127
    Width = 234
    Height = 66
    Caption = 'Bytes'
    TabOrder = 6
    object BytesE: TEdit
      Left = 16
      Top = 24
      Width = 201
      Height = 21
      Enabled = False
      ReadOnly = True
      TabOrder = 0
    end
  end
  object XPManifest1: TXPManifest
    Left = 376
    Top = 16
  end
end
