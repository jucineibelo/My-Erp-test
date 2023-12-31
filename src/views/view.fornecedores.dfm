inherited viewFornecedores: TviewFornecedores
  Caption = 'viewFornecedores'
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 13
  inherited panelTop: TPanel
    inherited lblTitulo: TLabel
      Caption = 'Fornecedores'
      ExplicitWidth = 115
    end
  end
  inherited pnlLinhaFundo: TPanel
    inherited PageControl1: TPageControl
      ActivePage = tsConsulta
      inherited tbsCadastro: TTabSheet
        object lblUF: TLabel [0]
          Left = 912
          Top = 261
          Width = 15
          Height = 16
          Caption = 'UF'
          FocusControl = edtUf
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblCidade: TLabel [1]
          Left = 679
          Top = 261
          Width = 43
          Height = 16
          Caption = 'CIDADE'
          FocusControl = edtCidade
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblTelefone: TLabel [2]
          Left = 253
          Top = 195
          Width = 59
          Height = 16
          Caption = 'TELEFONE'
          FocusControl = edtTelefone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblObs: TLabel [3]
          Left = 482
          Top = 195
          Width = 80
          Height = 16
          Caption = 'OBSERVA'#199#195'O'
          FocusControl = edtObs
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblRazao: TLabel [4]
          Left = 149
          Top = 130
          Width = 87
          Height = 16
          Caption = 'RAZ'#195'O SOCIAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblCPF: TLabel [5]
          Left = 565
          Top = 130
          Width = 22
          Height = 16
          Caption = 'CPF'
          FocusControl = edtCPF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblRG: TLabel [6]
          Left = 796
          Top = 130
          Width = 16
          Height = 16
          Caption = 'RG'
          FocusControl = edtRG
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblEndereco: TLabel [7]
          Left = 40
          Top = 261
          Width = 62
          Height = 16
          Caption = 'ENDERE'#199'O'
          FocusControl = edtEndereco
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblCNPJ: TLabel [8]
          Left = 565
          Top = 130
          Width = 28
          Height = 16
          Caption = 'CNPJ'
          FocusControl = edtCPF
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblIE: TLabel [9]
          Left = 796
          Top = 130
          Width = 11
          Height = 16
          Caption = 'IE'
          FocusControl = edtRG
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblData: TLabel [10]
          Left = 40
          Top = 195
          Width = 101
          Height = 16
          Caption = 'DATA CADASTRO'
          FocusControl = edtTelefone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object dbTxtID: TDBText [11]
          Left = 46
          Top = 152
          Width = 65
          Height = 17
          DataField = 'FORNECEDOR_ID'
          DataSource = DmConexao.dsFornecedores
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object lblCodi: TLabel [12]
          Left = 40
          Top = 130
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
            Left = 358
            Width = 287
            Caption = '[CADASTRO DE FORNECEDORES]'
            ExplicitLeft = 358
            ExplicitWidth = 287
          end
        end
        inherited DBEdit1: TDBEdit
          TabOrder = 12
        end
        object edtEndereco: TDBEdit
          Left = 40
          Top = 281
          Width = 600
          Height = 21
          DataField = 'FORNECEDOR_ENDERECO'
          DataSource = DmConexao.dsFornecedores
          TabOrder = 9
        end
        object edtCidade: TDBEdit
          Left = 679
          Top = 281
          Width = 200
          Height = 21
          DataField = 'FORNECEDOR_CIDADE'
          DataSource = DmConexao.dsFornecedores
          TabOrder = 10
        end
        object edtUf: TDBEdit
          Left = 912
          Top = 281
          Width = 30
          Height = 21
          DataField = 'FORNECEDOR_ESTADO'
          DataSource = DmConexao.dsFornecedores
          TabOrder = 11
        end
        object edtTelefone: TDBEdit
          Left = 253
          Top = 215
          Width = 130
          Height = 21
          DataField = 'FORNECEDOR_TELEFONE'
          DataSource = DmConexao.dsFornecedores
          TabOrder = 7
        end
        object edtObs: TDBEdit
          Left = 482
          Top = 215
          Width = 500
          Height = 21
          DataField = 'FORNECEDOR_OBS'
          DataSource = DmConexao.dsFornecedores
          TabOrder = 8
        end
        object edtRazao: TDBEdit
          Left = 149
          Top = 152
          Width = 370
          Height = 21
          DataField = 'FORNECEDOR_RAZAO'
          DataSource = DmConexao.dsFornecedores
          TabOrder = 1
        end
        object edtCPF: TDBEdit
          Left = 565
          Top = 152
          Width = 180
          Height = 21
          DataField = 'FORNECEDOR_CPF'
          DataSource = DmConexao.dsFornecedores
          TabOrder = 2
        end
        object edtRG: TDBEdit
          Left = 796
          Top = 152
          Width = 180
          Height = 21
          DataField = 'FORNECEDOR_RG'
          DataSource = DmConexao.dsFornecedores
          TabOrder = 4
        end
        object edtCnpj: TDBEdit
          Left = 565
          Top = 152
          Width = 180
          Height = 21
          DataField = 'FORNECEDOR_CNPJ'
          DataSource = DmConexao.dsFornecedores
          TabOrder = 3
        end
        object edtIE: TDBEdit
          Left = 796
          Top = 152
          Width = 180
          Height = 21
          DataField = 'FORNECEDOR_IE'
          DataSource = DmConexao.dsFornecedores
          TabOrder = 5
        end
        object edtData: TDBEdit
          Left = 40
          Top = 215
          Width = 121
          Height = 21
          DataField = 'DATA_CADASTRO'
          DataSource = DmConexao.dsFornecedores
          TabOrder = 6
        end
        object dbRgTipoPessoa: TDBRadioGroup
          Left = 39
          Top = 66
          Width = 210
          Height = 36
          Caption = 'Tipo Pessoa'
          Columns = 2
          DataField = 'FORNECEDOR_TIPO'
          DataSource = DmConexao.dsFornecedores
          Items.Strings = (
            'Pessoa F'#237'sica'
            'Pessoa Jur'#237'dica')
          TabOrder = 13
          Values.Strings = (
            'F'
            'J')
          OnChange = dbRgTipoPessoaChange
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
          DataSource = DmConexao.dsFornecedores
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'FORNECEDOR_ID'
              Title.Alignment = taCenter
              Title.Caption = 'C'#243'digo'
              Width = 50
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'FORNECEDOR_RAZAO'
              Title.Alignment = taCenter
              Title.Caption = 'Nome'
              Width = 300
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DATA_CADASTRO'
              Title.Alignment = taCenter
              Title.Caption = 'Data Cadastro'
              Width = 100
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'TIPO_PESSOA'
              Title.Alignment = taCenter
              Title.Caption = 'CNPJ/CPF'
              Width = 200
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
