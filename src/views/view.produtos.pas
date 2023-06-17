unit view.produtos;

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
  dm.conexao,
  Vcl.DBCtrls,
  Vcl.Mask,
  DB,
  IWVCLBaseControl,
  IWBaseControl,
  IWBaseHTMLControl,
  IWControl,
  IWCompListbox,
  IWDBStdCtrls,
  Vcl.Grids,
  Vcl.DBGrids,
  JvExControls,
  JvDBLookup;

type
  TviewProdutos = class(TviewBaseListas)
    edtDescricao: TDBEdit;
    lblDescricao: TLabel;
    edtMarca: TDBEdit;
    lblMarca: TLabel;
    lblFornecedor: TLabel;
    edtPreco: TDBEdit;
    PRE�O: TLabel;
    SpeedButton1: TSpeedButton;
    DBGrid1: TDBGrid;
    LkFornecedor: TJvDBLookupCombo;
    pnlQtd: TPanel;
    Qtde: TDBText;
    lblData: TLabel;
    edtData: TDBEdit;
    dbTxtID: TDBText;
    lblID: TLabel;
    lblEstoque: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  viewProdutos: TviewProdutos;

implementation

{$R *.dfm}

procedure TviewProdutos.btnCancelarClick(Sender: TObject);
begin
  inherited;
  if DmConexao.sdsProdutos.State in dsEditModes then
    DmConexao.sdsProdutos.Cancel;
  PageControl1.TabIndex := 1;
end;

procedure TviewProdutos.btnEditarClick(Sender: TObject);
begin
  inherited;
  PageControl1.TabIndex := 0;
  if DmConexao.sdsProdutos.State = dsBrowse then
    DmConexao.sdsProdutos.Edit;
  edtDescricao.SetFocus;
end;

procedure TviewProdutos.btnExcluirClick(Sender: TObject);
var
  aviso: Integer;
begin
  inherited;
  Application.Title := 'Aten��o!';
  aviso := Application.MessageBox('Deseja mesmo excluir o registro? ',
    'Aten��o', MB_YESNO + MB_DEFBUTTON2 + MB_ICONQUESTION);
  if aviso <> IDNO then
    DmConexao.sdsProdutos.Delete;
  DmConexao.sdsProdutos.ApplyUpdates(0);
end;

procedure TviewProdutos.btnNovoClick(Sender: TObject);

var
  proxregistro: Integer;
begin
  inherited;
  PageControl1.TabIndex := 0;
  DmConexao.sdsProdutos.Last;
  proxregistro := DmConexao.sdsProdutosPROD_ID.AsInteger + 1;
  DmConexao.sdsProdutos.Append;
  DmConexao.sdsProdutosPROD_ID.AsInteger := proxregistro;
  //receber o edt j� com a data que vai cadastrar
  DmConexao.sdsProdutosPROD_DATA_CADASTRO.AsDateTime := Now;
  LkFornecedor.SetFocus;
end;

procedure TviewProdutos.btnPesquisaClick(Sender: TObject);
begin
  inherited;
  DmConexao.sdsProdutos.Filtered := False;
  DmConexao.sdsProdutos.IndexFieldNames := DBGrid1.SelectedField.FieldName;
  DmConexao.sdsProdutos.FindNearest([edtPesquisa.Text]);
end;

procedure TviewProdutos.btnSalvarClick(Sender: TObject);
begin
  inherited;
  DmConexao.sdsProdutos.Post;
  DmConexao.sdsProdutos.ApplyUpdates(0);
  MessageDlg('Registro salvo com sucesso!', mtInformation, [mbOK], 0);
  PageControl1.TabIndex := 1;
end;

procedure TviewProdutos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DmConexao.sdsProdutos.Close;
end;

procedure TviewProdutos.FormCreate(Sender: TObject);
begin
  inherited;
  DmConexao.sdsProdutos.Active := True;
  DmConexao.sdsFornecedores.Active := True;
  DmConexao.sdsProdutos.Append;
end;

end.