unit view.funcionarios;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  view.base.lista,
  Vcl.StdCtrls,
  Vcl.Mask,
  Vcl.DBCtrls,
  Vcl.ComCtrls,
  Vcl.Buttons,
  Vcl.Imaging.pngimage,
  Vcl.ExtCtrls,
  dm.conexao,
  DB,
  Vcl.Grids,
  Vcl.DBGrids,
  botoes;

type
  TviewFuncionarios = class(TviewBaseListas)
    Panel2: TPanel;
    edtSenha: TDBEdit;
    lblSenha: TLabel;
    edtUsuario: TDBEdit;
    lblUsuario: TLabel;
    lblSetor: TLabel;
    edtSetor: TDBEdit;
    lblCargo: TLabel;
    edtCargo: TDBEdit;
    edtNome: TDBEdit;
    lblNome: TLabel;
    lblCodi: TLabel;
    dbTxtCodi: TDBText;
    DBGrid1: TDBGrid;
    lblData: TLabel;
    edtData: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
  private
  var lCrudBotoes : TBotoes;

  public
    { Public declarations }
  end;

var
  viewFuncionarios: TviewFuncionarios;

implementation

{$R *.dfm}

procedure TviewFuncionarios.btnCancelarClick(Sender: TObject);
begin
  inherited;
  lCrudBotoes.botaoCancelar(DmConexao.sdsFuncionarios);
  PageControl1.TabIndex := 1;
  btnNovo.Visible := True;
end;

procedure TviewFuncionarios.btnNovoClick(Sender: TObject);
begin
  inherited;
  PageControl1.TabIndex := 0;
  edtNome.SetFocus;
  lCrudBotoes.botaoNovo(DmConexao.sdsFuncionarios, 'CODIGO', DmConexao.sdsFuncionarios.FieldByName('DATA_CADASTRO'));
 end;

procedure TviewFuncionarios.btnPesquisaClick(Sender: TObject);
begin
  inherited;
  DmConexao.sdsFuncionarios.Filtered := False;
  DmConexao.sdsFuncionarios.IndexFieldNames := DBGrid1.SelectedField.FieldName;
  DmConexao.sdsFuncionarios.FindNearest([edtPesquisa.Text]);
end;

procedure TviewFuncionarios.btnSalvarClick(Sender: TObject);
begin
  inherited;
  lCrudBotoes.botaoSalvar(DmConexao.sdsFuncionarios, 'Usuário salvo com sucesso!');
  PageControl1.TabIndex := 1;
  btnNovo.Visible := True;
end;

procedure TviewFuncionarios.FormCreate(Sender: TObject);
begin
  inherited;
  DmConexao.sdsFuncionarios.Open;
end;

end.
