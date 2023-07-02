unit view.fornecedores;

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
  Vcl.ComCtrls,
  Vcl.Buttons,
  Vcl.Imaging.pngimage,
  Vcl.ExtCtrls,
  Vcl.Mask,
  Vcl.DBCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  Data.DBXFirebird,
  Datasnap.DBClient,
  SimpleDS,
  DB, botoes;

type
  TviewFornecedores = class(TviewBaseListas)
    edtEndereco: TDBEdit;
    edtCidade: TDBEdit;
    edtUf: TDBEdit;
    lblUF: TLabel;
    lblCidade: TLabel;
    edtTelefone: TDBEdit;
    lblTelefone: TLabel;
    edtObs: TDBEdit;
    lblObs: TLabel;
    edtRazao: TDBEdit;
    lblRazao: TLabel;
    edtCPF: TDBEdit;
    lblCPF: TLabel;
    edtRG: TDBEdit;
    lblRG: TLabel;
    lblEndereco: TLabel;
    lblCNPJ: TLabel;
    lblIE: TLabel;
    edtCnpj: TDBEdit;
    edtIE: TDBEdit;
    edtData: TDBEdit;
    lblData: TLabel;
    dbTxtID: TDBText;
    lblCodi: TLabel;
    DBGrid1: TDBGrid;
    dbRgTipoPessoa: TDBRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure edtDataChange(Sender: TObject);
    procedure dbRgTipoPessoaChange(Sender: TObject);
  private
    var CrudBotoes: TBotoes;
    procedure habilitaDesabilitaTipoPessoa(status : Boolean);

  public

  end;

var
  viewFornecedores: TviewFornecedores;

implementation

{$R *.dfm}

uses dm.conexao;

procedure TviewFornecedores.btnCancelarClick(Sender: TObject);
begin
  inherited;
  try
    CrudBotoes.botaoCancelar(DmConexao.sdsFornecedores);
  finally
    CrudBotoes.Free;
  end;
  PageControl1.TabIndex := 1;

end;

procedure TviewFornecedores.btnEditarClick(Sender: TObject);
begin
  inherited;
  PageControl1.TabIndex := 0;
  edtRazao.SetFocus;
  try
    CrudBotoes.botaoEditar(DmConexao.sdsFornecedores);
  finally
    CrudBotoes.Free;
  end;
end;

procedure TviewFornecedores.btnExcluirClick(Sender: TObject);
begin
  inherited;
  try
    CrudBotoes.botaoExcluir(DmConexao.sdsFornecedores);
  finally
    CrudBotoes.Free;
  end;
end;

procedure TviewFornecedores.btnNovoClick(Sender: TObject);
begin
  inherited;
  try
    CrudBotoes.botaoNovo(DmConexao.sdsFornecedores, 'FORNECEDOR_ID');
  finally
    CrudBotoes.Free;
  end;
  PageControl1.TabIndex := 0;
  DmConexao.sdsFornecedoresDATA_CADASTRO.AsDateTime := Now;  //receber data atual
  edtRazao.SetFocus;
end;

procedure TviewFornecedores.btnPesquisaClick(Sender: TObject);
var
  IndexFieldName: string;
begin
 inherited;

  if Trim(edtPesquisa.Text) = '' then
  begin
    MessageDlg('Descri��o n�o informada.', mtInformation, [mbOK], 0);
    DmConexao.sdsFornecedores.Filtered := False;
    DmConexao.sdsFornecedores.Open;
    edtPesquisa.SetFocus;
    Exit;
  end;

  DmConexao.sdsFornecedores.Filtered := False;
  DmConexao.sdsFornecedores.IndexFieldNames := DBGrid1.SelectedField.FieldName;
  DmConexao.sdsFornecedores.FindNearest([edtPesquisa.Text]);
end;

procedure TviewFornecedores.btnSalvarClick(Sender: TObject);
begin
  inherited;
  try
    CrudBotoes.botaoSalvar(DmConexao.sdsFornecedores, 'Fornecedor salvo com sucesso!');
  finally
    CrudBotoes.Free;
  end;
  PageControl1.TabIndex := 1;
end;

procedure TviewFornecedores.dbRgTipoPessoaChange(Sender: TObject);
begin
  inherited;
  if dbRgTipoPessoa.ItemIndex = 0 then
    habilitaDesabilitaTipoPessoa(True)
  else
    habilitaDesabilitaTipoPessoa(False);
end;

procedure TviewFornecedores.edtDataChange(Sender: TObject);
begin
  inherited;
  //se estiver em modo de edi��o e o campo data estiver vazio ao passar pelo edit ele atribui a data atual
  if (DmConexao.sdsFornecedores.State = dsEdit)  and (DmConexao.sdsFornecedoresDATA_CADASTRO.AsDateTime <> null) then
    DmConexao.sdsFornecedoresDATA_CADASTRO.AsDateTime := Now;
end;

procedure TviewFornecedores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  DmConexao.sdsFornecedores.Close;
end;

procedure TviewFornecedores.FormCreate(Sender: TObject);
begin
  inherited;
  DmConexao.sdsFornecedores.Open;
  DmConexao.sdsFornecedores.Append;
end;

procedure TviewFornecedores.FormShow(Sender: TObject);
begin
  inherited;
  habilitaDesabilitaTipoPessoa(False);
end;

procedure TviewFornecedores.habilitaDesabilitaTipoPessoa(status: Boolean);
begin
  lblCPF.Visible := status;
  lblRG.Visible := status;
  edtCPF.Visible := status;
  edtRG.Visible := status;
  lblCNPJ.Visible := not status;
  lblIE.Visible := not status;
  edtCNPJ.Visible := not status;
  edtIE.Visible := not status;
end;

end.
