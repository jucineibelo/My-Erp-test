inherited viewVendas: TviewVendas
  Caption = 'viewVendas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelTop: TPanel
    inherited lblTitulo: TLabel
      Width = 903
      Height = 29
      Caption = 'Vendas'
      ExplicitWidth = 61
    end
  end
  inherited pnlLinhaFundo: TPanel
    inherited PageControl1: TPageControl
      ActivePage = tbsCadastro
      inherited tbsCadastro: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 1012
        ExplicitHeight = 435
        inherited Panel1: TPanel
          Height = 97
          ExplicitHeight = 97
          inherited lblTituloCadastro: TLabel
            Left = 424
            Top = 8
            Width = 107
            Height = 32
            Align = alNone
            Caption = '[ Vendas ]'
            Font.Height = -24
            ExplicitLeft = 424
            ExplicitTop = 8
            ExplicitWidth = 107
            ExplicitHeight = 32
          end
          object btnPesq: TSpeedButton
            Tag = 1
            Left = 125
            Top = 44
            Width = 24
            Height = 22
            Hint = 'Buscar fornecedor'
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000130B0000130B00000000000000000000FF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FF7F745E7F745EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F745E7F745E7F745EFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FF7F745E7F745E7F745E7F745E7F745E7F745EFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F745E7F
              745EFF00FFFF00FFFF00FF7F745EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FF7F745EFF00FFFF00FFFF00FFFF00FFFF00FF7F74
              5EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F745EFF
              00FFFF00FFFF00FFFF00FFFF00FF7F745EFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FF7F745EFF00FFFF00FFFF00FFFF00FFFF00FF7F74
              5EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F
              745EFF00FFFF00FFFF00FF7F745EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF7F745E7F745E7F745EFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
              FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
              FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
              00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
            ParentShowHint = False
            ShowHint = True
            OnClick = btnPesqClick
          end
          object lblVendedor: TLabel
            Left = 16
            Top = 48
            Width = 46
            Height = 13
            Caption = 'Vendedor'
          end
          object edtVendedor: TEdit
            Left = 68
            Top = 44
            Width = 57
            Height = 21
            NumbersOnly = True
            TabOrder = 0
          end
          object edtVerVendedor: TEdit
            Left = 153
            Top = 44
            Width = 153
            Height = 21
            TabOrder = 1
          end
        end
      end
      inherited tsConsulta: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 1012
        ExplicitHeight = 435
      end
    end
  end
end
