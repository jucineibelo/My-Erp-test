object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'frmLogin'
  ClientHeight = 222
  ClientWidth = 355
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 355
    Height = 222
    Align = alClient
    BevelOuter = bvNone
    Color = 14466906
    ParentBackground = False
    TabOrder = 0
    object Panel3: TPanel
      Left = 0
      Top = 182
      Width = 355
      Height = 40
      Align = alBottom
      BevelOuter = bvNone
      Color = 14466906
      ParentBackground = False
      TabOrder = 0
      OnClick = Panel3Click
      object lblInfo: TLabel
        Left = 292
        Top = 18
        Width = 34
        Height = 13
        Caption = 'lblInfo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Panel7: TPanel
        Left = 0
        Top = 37
        Width = 355
        Height = 3
        Align = alBottom
        BevelOuter = bvNone
        Color = clHighlight
        ParentBackground = False
        TabOrder = 0
      end
    end
    object Panel4: TPanel
      Left = 0
      Top = 40
      Width = 355
      Height = 142
      Align = alClient
      BevelOuter = bvNone
      Color = clBtnHighlight
      ParentBackground = False
      TabOrder = 1
      object lblUsuario: TLabel
        Left = 47
        Top = 29
        Width = 58
        Height = 20
        Caption = 'Usu'#225'rio:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblSenha: TLabel
        Left = 59
        Top = 66
        Width = 46
        Height = 20
        Caption = 'Senha:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtSenha: TEdit
        Left = 111
        Top = 68
        Width = 145
        Height = 21
        PasswordChar = '*'
        TabOrder = 1
        TextHint = 'Digite sua senha'
        OnKeyPress = edtSenhaKeyPress
      end
      object edtUsuario: TEdit
        Left = 111
        Top = 29
        Width = 145
        Height = 21
        TabOrder = 0
        TextHint = 'Digite seu Login'
        OnKeyPress = edtUsuarioKeyPress
      end
      object btnLogin: TBitBtn
        Left = 111
        Top = 100
        Width = 145
        Height = 25
        Caption = 'Entrar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        OnClick = btnLoginClick
      end
      object Panel5: TPanel
        Left = 352
        Top = 0
        Width = 3
        Height = 142
        Align = alRight
        BevelOuter = bvNone
        Color = clHighlight
        ParentBackground = False
        TabOrder = 2
      end
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 3
        Height = 142
        Align = alLeft
        BevelOuter = bvNone
        Color = clHighlight
        ParentBackground = False
        TabOrder = 4
      end
    end
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 355
      Height = 40
      Align = alTop
      BevelOuter = bvNone
      Color = 14466906
      ParentBackground = False
      TabOrder = 2
      OnMouseMove = Panel2MouseMove
      object Label1: TLabel
        Left = 109
        Top = 1
        Width = 147
        Height = 20
        Caption = 'SISTEMA DE GEST'#195'O'
        Font.Charset = ANSI_CHARSET
        Font.Color = clGray
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object btnFechar: TBitBtn
        Left = 331
        Top = 0
        Width = 25
        Height = 25
        Caption = 'X'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = btnFecharClick
      end
      object Panel8: TPanel
        Left = 0
        Top = 37
        Width = 355
        Height = 3
        Align = alBottom
        BevelOuter = bvNone
        Color = clHighlight
        ParentBackground = False
        TabOrder = 1
      end
    end
  end
end
