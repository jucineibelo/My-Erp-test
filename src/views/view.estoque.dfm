inherited viewEstoque: TviewEstoque
  Caption = 'viewEstoque'
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 13
  inherited panelTop: TPanel
    inherited lblTitulo: TLabel
      Width = 903
      Height = 29
      Caption = 'Estoque'
      ExplicitWidth = 68
    end
  end
  inherited pnlLinhaFundo: TPanel
    inherited PageControl1: TPageControl
      ActivePage = tsConsulta
      inherited tbsCadastro: TTabSheet
        object lblData: TLabel [0]
          Left = 167
          Top = 124
          Width = 27
          Height = 13
          Caption = 'Data:'
        end
        object lblObs: TLabel [1]
          Left = 132
          Top = 236
          Width = 62
          Height = 13
          Caption = 'Observa'#231#227'o:'
        end
        object lblProduto: TLabel [2]
          Left = 451
          Top = 124
          Width = 42
          Height = 13
          Caption = 'Produto:'
        end
        object lblQtd: TLabel [3]
          Left = 134
          Top = 175
          Width = 60
          Height = 13
          Caption = 'Quantidade:'
        end
        object id: TDBText [4]
          Left = 208
          Top = 88
          Width = 41
          Height = 17
          DataField = 'ID'
          DataSource = DmConexao.dsEstoque
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblID: TLabel [5]
          Left = 157
          Top = 88
          Width = 37
          Height = 13
          Caption = 'C'#243'digo:'
        end
        inherited Panel1: TPanel
          inherited lblTituloCadastro: TLabel
            Width = 127
            Caption = '     [ ESTOQUE ]'
            ExplicitWidth = 127
          end
        end
        inherited DBEdit1: TDBEdit
          TabOrder = 2
        end
        object edtData: TDBEdit
          Left = 208
          Top = 121
          Width = 121
          Height = 21
          DataField = 'DATA'
          DataSource = DmConexao.dsEstoque
          TabOrder = 1
        end
        object edtObs: TDBMemo
          Left = 208
          Top = 233
          Width = 620
          Height = 81
          DataField = 'OBS'
          DataSource = DmConexao.dsEstoque
          TabOrder = 4
        end
        object edtQtd: TDBEdit
          Left = 205
          Top = 172
          Width = 124
          Height = 21
          DataField = 'QTD'
          DataSource = DmConexao.dsEstoque
          TabOrder = 3
        end
        object lookupProd: TDBLookupComboBox
          Left = 512
          Top = 121
          Width = 177
          Height = 21
          DataField = 'PRODUTO'
          DataSource = DmConexao.dsEstoque
          KeyField = 'PROD_ID'
          ListField = 'PROD_DESCRICAO'
          ListSource = DmConexao.dsProdutos
          TabOrder = 5
        end
      end
      inherited tsConsulta: TTabSheet
        inherited pnlPesquisa: TPanel
          inherited btnPesquisa: TButton
            OnClick = btnPesquisaClick
          end
        end
        object DBGrid1: TDBGrid
          Left = 0
          Top = 65
          Width = 1012
          Height = 370
          Align = alClient
          DataSource = DmConexao.dsEstoque
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'ID'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA'
              Title.Caption = 'Data de Cadastro'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Nome do Produto'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QTD'
              Title.Caption = 'Quantidade'
              Visible = True
            end>
        end
      end
    end
  end
  inherited panelRodape: TPanel
    inherited pnlBotoesButton: TPanel
      inherited btnEditar: TSpeedButton
        Enabled = False
        Transparent = False
        Visible = False
      end
      inherited btnExcluir: TSpeedButton
        Enabled = False
        Transparent = False
        Visible = False
      end
    end
  end
end
