inherited viewVendas: TviewVendas
  Caption = 'viewVendas'
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
      inherited tbsCadastro: TTabSheet
        inherited Panel1: TPanel
          Height = 97
          ExplicitHeight = 97
          inherited lblTituloCadastro: TLabel
            Left = 424
            Top = 8
            Width = 115
            Height = 37
            Align = alNone
            Caption = '[ Vendas ]'
            Font.Height = -27
            Font.Name = 'Segoe UI'
            Font.Style = []
            ExplicitLeft = 424
            ExplicitTop = 8
            ExplicitWidth = 115
            ExplicitHeight = 37
          end
          object lblVendedor: TLabel
            Left = 24
            Top = 15
            Width = 61
            Height = 25
            Caption = 'C'#243'digo'
            Font.Charset = ANSI_CHARSET
            Font.Color = clGray
            Font.Height = -19
            Font.Name = 'Segoe UI'
            Font.Pitch = fpFixed
            Font.Style = []
            Font.Quality = fqDraft
            ParentFont = False
          end
          object Label1: TLabel
            Left = 112
            Top = 42
            Width = 179
            Height = 25
            Caption = '[ NOME VENDEDOR ]'
            Color = clGray
            Font.Charset = ANSI_CHARSET
            Font.Color = clGrayText
            Font.Height = -19
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentColor = False
            ParentFont = False
          end
          object SearchBoxCodVend: TSearchBox
            Left = 24
            Top = 46
            Width = 73
            Height = 21
            BevelInner = bvNone
            BevelOuter = bvNone
            TabOrder = 0
          end
        end
      end
    end
  end
end
