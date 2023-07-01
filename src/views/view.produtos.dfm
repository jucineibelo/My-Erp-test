﻿inherited viewProdutos: TviewProdutos
  Caption = 'viewProdutos'
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited panelTop: TPanel
    inherited lblTitulo: TLabel
      Caption = 'Produtos'
      ExplicitWidth = 77
    end
  end
  inherited pnlLinhaFundo: TPanel
    object SpeedButton1: TSpeedButton [0]
      Left = 72
      Top = 8
      Width = 23
      Height = 22
    end
    inherited PageControl1: TPageControl
      inherited tbsCadastro: TTabSheet
        object lblDescricao: TLabel [0]
          Left = 150
          Top = 192
          Width = 68
          Height = 16
          Caption = 'DESCRI'#199#195'O'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblMarca: TLabel [1]
          Left = 686
          Top = 117
          Width = 42
          Height = 16
          Caption = 'MARCA'
          FocusControl = edtMarca
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblFornecedor: TLabel [2]
          Left = 393
          Top = 115
          Width = 79
          Height = 16
          Caption = 'FORNECEDOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object PREÇO: TLabel [3]
          Left = 689
          Top = 192
          Width = 39
          Height = 16
          Caption = 'PRE'#199'O'
          FocusControl = edtPreco
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblData: TLabel [4]
          Left = 243
          Top = 115
          Width = 32
          Height = 16
          Caption = 'DATA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object dbTxtID: TDBText [5]
          Left = 156
          Top = 137
          Width = 65
          Height = 17
          DataField = 'PROD_ID'
          DataSource = DmConexao.dsProdutos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblID: TLabel [6]
          Left = 150
          Top = 115
          Width = 46
          Height = 16
          Caption = 'C'#211'DIGO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        inherited Panel1: TPanel
          inherited lblTituloCadastro: TLabel
            Width = 236
            Caption = '[ Cadastro de Produtos ]'
            ExplicitWidth = 236
          end
        end
        inherited DBEdit1: TDBEdit
          TabOrder = 7
        end
        object edtDescricao: TDBEdit
          Left = 150
          Top = 212
          Width = 459
          Height = 21
          DataField = 'PROD_DESCRICAO'
          DataSource = DmConexao.dsProdutos
          TabOrder = 4
        end
        object edtMarca: TDBEdit
          Left = 686
          Top = 137
          Width = 130
          Height = 21
          DataField = 'PROD_MARCA'
          DataSource = DmConexao.dsProdutos
          TabOrder = 3
        end
        object edtPreco: TDBEdit
          Left = 689
          Top = 212
          Width = 114
          Height = 21
          DataField = 'PROD_PRECO'
          DataSource = DmConexao.dsProdutos
          TabOrder = 5
        end
        object LkFornecedor: TJvDBLookupCombo
          Left = 393
          Top = 137
          Width = 216
          Height = 21
          DataField = 'PROD_FORNECEDOR'
          DataSource = DmConexao.dsProdutos
          LookupField = 'FORNECEDOR_ID'
          LookupDisplay = 'FORNECEDOR_RAZAO'
          LookupSource = DmConexao.dsFornecedores
          TabOrder = 2
        end
        object pnlQtd: TPanel
          Left = 0
          Top = 256
          Width = 1012
          Height = 179
          Align = alBottom
          BevelOuter = bvNone
          Color = 15718307
          ParentBackground = False
          TabOrder = 6
          object Qtde: TDBText
            Left = 214
            Top = 40
            Width = 49
            Height = 17
            DataField = 'QTDTOTAL'
            DataSource = DmConexao.dsProdutos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object lblEstoque: TLabel
            Left = 150
            Top = 41
            Width = 54
            Height = 14
            Caption = 'Estoque:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
        end
        object edtData: TDBEdit
          Left = 243
          Top = 137
          Width = 104
          Height = 21
          DataField = 'PROD_DATA_CADASTRO'
          DataSource = DmConexao.dsProdutos
          TabOrder = 1
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
          DataSource = DmConexao.dsProdutos
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'PROD_ID'
              Title.Caption = 'C'#243'digo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROD_DESCRICAO'
              Title.Caption = 'Descri'#231#227'o'
              Width = 270
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROD_MARCA'
              Title.Caption = 'Marca'
              Width = 130
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROD_FORNECEDOR'
              Title.Caption = 'C'#243'd Fornecedor'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FORNECEDOR_RAZAO'
              Title.Caption = 'Fornecedor'
              Width = 180
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROD_PRECO'
              Title.Caption = 'Pre'#231'o'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QTDTOTAL'
              Title.Caption = 'Estoque'
              Visible = True
            end>
        end
      end
    end
  end
  inherited panelRodape: TPanel
    inherited pnlBotoesButton: TPanel
      inherited btnExcluir: TSpeedButton
        OnClick = btnExcluirClick
      end
    end
  end
end
