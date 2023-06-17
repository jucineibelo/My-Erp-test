unit view.clientes;

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
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  Vcl.Buttons,
  Vcl.Imaging.pngimage,
  Vcl.ExtCtrls,
  Vcl.Mask,
  Vcl.DBCtrls;

type
  TviewClientes = class(TviewBaseListas)
    lblID: TLabel;
    lblRazao: TLabel;
    lblTelefone: TLabel;
    edtTelefone: TDBEdit;
    lblCPF: TLabel;
    edtCPF: TDBEdit;
    lblRG: TLabel;
    edtRG: TDBEdit;
    lblObs: TLabel;
    edtObs: TDBEdit;
    lblEndereco: TLabel;
    edtEndereco: TDBEdit;
    lblCidade: TLabel;
    edtCidade: TDBEdit;
    lblUf: TLabel;
    edtUf: TDBEdit;
    edtRazao: TDBEdit;
    DBGrid1: TDBGrid;
    rgTipoPessoa: TRadioGroup;
    lblCNPJ: TLabel;
    lblIE: TLabel;
    edtCNPJ: TDBEdit;
    edtIE: TDBEdit;
    lblData: TLabel;
    edtData: TDBEdit;
    dbTxtID: TDBText;
    procedure btnEditarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure dbGridDblClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPesquisaClick(Sender: TObject);
    procedure tsConsultaShow(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure rgTipoPessoaClick(Sender: TObject);

  private
    procedure habilitaDesabilitaTipoPessoa(status : Boolean);

  public

  end;

var
  viewClientes: TviewClientes;

implementation

{$R *.dfm}

uses dm.conexao;

procedure TviewClientes.btnCancelarClick(Sender: TObject);
begin
  inherited;
  if DmConexao.sdsClientes.State in dsEditModes then
    DmConexao.sdsClientes.Cancel;
  PageControl1.TabIndex := 1;

end;

procedure TviewClientes.btnEditarClick(Sender: TObject);
begin
  inherited;
  PageControl1.TabIndex := 0;
  if DmConexao.sdsClientes.State = dsBrowse then
    DmConexao.sdsClientes.Edit;
  edtRazao.SetFocus;
end;

procedure TviewClientes.btnExcluirClick(Sender: TObject);
var
  aviso: Integer;
begin
  inherited;
  Application.Title := 'Aten��o!';
  aviso := Application.MessageBox('Deseja mesmo excluir o registro? ',
    'Aten��o', MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION);
  if aviso <> IDNO then
    DmConexao.sdsClientes.Delete;
  DmConexao.sdsClientes.ApplyUpdates(0);

end;

procedure TviewClientes.btnNovoClick(Sender: TObject);
var
  proxregistro: Integer;
begin
  inherited;
  PageControl1.TabIndex := 0;
  DmConexao.sdsClientes.Last;
  proxregistro := DmConexao.sdsClientesCLIENTE_ID.AsInteger + 1;
  DmConexao.sdsClientes.Append;
  DmConexao.sdsClientesCLIENTE_ID.AsInteger := proxregistro;
  //receber a data atual
  DmConexao.sdsClientesDATA_CADASTRO.AsDateTime := Now;
  rgTipoPessoa.ItemIndex := -1; //para nunca trazer valor setado e  sim escolher o tipo de pessoa
  edtRazao.SetFocus;

end;

procedure TviewClientes.btnPesquisaClick(Sender: TObject);
//as pesquisas abaixo necessitam fazer todo esse trabalho de abrir e fechar os datasets
//e usam os metodos de pesquisa e oas filters
//essa trabalho manual deve ser feito para cada Grid
begin
  inherited;
  edtPesquisa.SetFocus;

  if Trim(edtPesquisa.Text) = '' then
  begin

    MessageDlg('Descri��o n�o informada.', mtInformation, [mbOK], 0);
    DmConexao.sdsClientes.Filtered := False;
    DmConexao.sdsClientes.DataSet.CommandText := 'select * from CLIENTES';
    DmConexao.sdsClientes.Open;
    edtPesquisa.SetFocus;
    Exit;
  end;

  if DBGrid1.SelectedField.FieldName = 'CLIENTE_ID' then
  begin
    DmConexao.sdsClientes.Filtered := False;
    DmConexao.sdsClientes.Filter := 'CLIENTE_ID = ' +
      IntToStr(strtoint(edtPesquisa.Text));
    DmConexao.sdsClientes.Filtered := True;
  end
  else if DBGrid1.SelectedField.FieldName = 'CLIENTE_RAZAO' then
  begin

    DmConexao.sdsClientes.Filtered := False;
    DmConexao.sdsClientes.Filter := 'CLIENTE_RAZAO LIKE ' +
      QuotedStr('%' + edtPesquisa.Text + '%');
    DmConexao.sdsClientes.Filtered := True;
  end;
end;

procedure TviewClientes.btnSalvarClick(Sender: TObject);
begin
  inherited;
  DmConexao.sdsClientes.Post;
  DmConexao.sdsClientes.ApplyUpdates(0);
  MessageDlg('Registro salvo com sucesso!', mtInformation, [mbOK], 0);
  PageControl1.TabIndex := 1;

end;

procedure TviewClientes.dbGridDblClick(Sender: TObject);
begin
  inherited;
  PageControl1.TabIndex := 0;
  DmConexao.sdsClientes.Edit;
  edtRazao.SetFocus;
end;

procedure TviewClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DmConexao.sdsClientes.Close;
end;

procedure TviewClientes.FormCreate(Sender: TObject);
begin
  inherited;
  DmConexao.sdsClientes.Open;
  DmConexao.sdsClientes.Append;
end;

procedure TviewClientes.FormShow(Sender: TObject);
begin
  inherited;
  habilitaDesabilitaTipoPessoa(True);
end;

procedure TviewClientes.habilitaDesabilitaTipoPessoa(status: Boolean);
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

procedure TviewClientes.rgTipoPessoaClick(Sender: TObject);
begin
  inherited;
  if rgTipoPessoa.ItemIndex = 0 then
  begin
    DmConexao.sdsClientesCLIENTE_TIPO.AsString := 'F';
    habilitaDesabilitaTipoPessoa(True);

  end
  else if rgTipoPessoa.ItemIndex = 1 then
  begin
    DmConexao.sdsClientesCLIENTE_TIPO.AsString := 'J';
    habilitaDesabilitaTipoPessoa(False);
  end;
end;

procedure TviewClientes.tsConsultaShow(Sender: TObject);
begin
  inherited;
  DmConexao.sdsClientes.Open;
end;

end.