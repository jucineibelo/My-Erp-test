inherited viewEmpresa: TviewEmpresa
  Caption = 'viewEmpresa'
  TextHeight = 13
  inherited panelTop: TPanel
    inherited lblTitulo: TLabel
      Width = 903
      Height = 29
      Caption = 'Empresa'
      ExplicitWidth = 73
    end
  end
  inherited pnlLinhaFundo: TPanel
    inherited PageControl1: TPageControl
      inherited tbsCadastro: TTabSheet
        object Label1: TLabel [0]
          Left = 46
          Top = 161
          Width = 39
          Height = 13
          Caption = 'RAZ'#195'O:'
          FocusControl = edtRazao
        end
        object Label2: TLabel [1]
          Left = 553
          Top = 161
          Width = 29
          Height = 13
          Caption = 'CNPJ:'
          FocusControl = DBEdit3
        end
        object Label3: TLabel [2]
          Left = 803
          Top = 161
          Width = 14
          Height = 13
          Caption = 'IE:'
          FocusControl = DBEdit4
        end
        object Label4: TLabel [3]
          Left = 27
          Top = 213
          Width = 58
          Height = 13
          Caption = 'ENDERE'#199'O:'
          FocusControl = DBEdit5
        end
        object Label5: TLabel [4]
          Left = 523
          Top = 213
          Width = 59
          Height = 13
          Caption = 'MUNIC'#205'PIO:'
          FocusControl = DBEdit6
        end
        object Label6: TLabel [5]
          Left = 800
          Top = 213
          Width = 17
          Height = 13
          Caption = 'UF:'
          FocusControl = DBEdit7
        end
        object Label7: TLabel [6]
          Left = 47
          Top = 266
          Width = 38
          Height = 13
          Caption = 'E-MAIL:'
          FocusControl = DBEdit8
        end
        object Label8: TLabel [7]
          Left = 528
          Top = 266
          Width = 54
          Height = 13
          Caption = 'TELEFONE:'
          FocusControl = DBEdit9
        end
        inherited Panel1: TPanel
          inherited lblTituloCadastro: TLabel
            Width = 146
            Caption = '        [ EMPRESA ]'
            ExplicitWidth = 146
          end
        end
        object edtRazao: TDBEdit
          Left = 101
          Top = 158
          Width = 400
          Height = 21
          DataField = 'RAZAO_SOCIAL'
          DataSource = DmConexao.sdEmpresa
          TabOrder = 2
        end
        object DBEdit3: TDBEdit
          Left = 590
          Top = 158
          Width = 179
          Height = 21
          DataField = 'CNPJ_CPF'
          DataSource = DmConexao.sdEmpresa
          TabOrder = 3
        end
        object DBEdit4: TDBEdit
          Left = 828
          Top = 158
          Width = 142
          Height = 21
          DataField = 'IE_RG'
          DataSource = DmConexao.sdEmpresa
          TabOrder = 4
        end
        object DBEdit5: TDBEdit
          Left = 101
          Top = 210
          Width = 400
          Height = 21
          DataField = 'ENDERECO'
          DataSource = DmConexao.sdEmpresa
          TabOrder = 5
        end
        object DBEdit6: TDBEdit
          Left = 595
          Top = 210
          Width = 174
          Height = 21
          DataField = 'MUNICIPIO'
          DataSource = DmConexao.sdEmpresa
          TabOrder = 6
        end
        object DBEdit7: TDBEdit
          Left = 828
          Top = 210
          Width = 50
          Height = 21
          DataField = 'ESTADO'
          DataSource = DmConexao.sdEmpresa
          TabOrder = 7
        end
        object DBEdit8: TDBEdit
          Left = 104
          Top = 263
          Width = 394
          Height = 21
          DataField = 'EMAIL'
          DataSource = DmConexao.sdEmpresa
          TabOrder = 8
        end
        object DBEdit9: TDBEdit
          Left = 595
          Top = 263
          Width = 174
          Height = 21
          DataField = 'TELEFONE'
          DataSource = DmConexao.sdEmpresa
          TabOrder = 9
        end
      end
      inherited tsConsulta: TTabSheet
        Enabled = False
        inherited pnlPesquisa: TPanel
          inherited edtPesquisa: TEdit
            Enabled = False
            Visible = False
          end
          inherited btnPesquisa: TButton
            Enabled = False
            Visible = False
          end
        end
      end
    end
  end
  inherited panelRodape: TPanel
    inherited pnlBotoesButton: TPanel
      inherited btnNovo: TSpeedButton
        Left = 551
        Width = 112
        Caption = '[ CADASTRAR ]'
        Enabled = False
        Visible = False
        ExplicitLeft = 551
        ExplicitTop = 3
        ExplicitWidth = 112
      end
      inherited btnExcluir: TSpeedButton
        Enabled = False
        Visible = False
      end
    end
  end
end
