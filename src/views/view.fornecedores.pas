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
  DB;

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
  if DmConexao.sdsFornecedores.State in dsEditModes then
    DmConexao.sdsFornecedores.Cancel;
  PageControl1.TabIndex := 1;

end;

procedure TviewFornecedores.btnEditarClick(Sender: TObject);
begin
  inherited;
  PageControl1.TabIndex := 0;
  DmConexao.sdsFornecedores.Edit;
  edtRazao.SetFocus;
end;

procedure TviewFornecedores.btnExcluirClick(Sender: TObject);
var
  aviso: Integer;
begin
  inherited;
  Application.Title := 'Aten��o!';
  aviso := Application.MessageBox('Deseja mesmo excluir o registro? ',
    'Aten��o', MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION);
  if aviso <> IDNO then
    DmConexao.sdsFornecedores.Delete;
  DmConexao.sdsFornecedores.ApplyUpdates(0);
end;

procedure TviewFornecedores.btnNovoClick(Sender: TObject);
var
  proxregistro: Integer;
begin
  inherited;
  PageControl1.TabIndex := 0;
  DmConexao.sdsFornecedores.Last;
  proxregistro := DmConexao.sdsFornecedoresFORNECEDOR_ID.AsInteger + 1;
  DmConexao.sdsFornecedores.Append;
  DmConexao.sdsFornecedoresFORNECEDOR_ID.AsInteger := proxregistro;
  //receber data atual
  DmConexao.sdsFornecedoresDATA_CADASTRO.AsDateTime := Now;
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
  DmConexao.sdsFornecedores.Post;
  DmConexao.sdsFornecedores.ApplyUpdates(0);
  MessageDlg('Registro salvo com sucesso!', mtInformation, [mbOK], 0);
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
