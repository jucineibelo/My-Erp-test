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
  Vcl.Grids,
  Vcl.DBGrids, botoes, Vcl.WinXCtrls;


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
    pnlQtd: TPanel;
    Qtde: TDBText;
    lblData: TLabel;
    edtData: TDBEdit;
    dbTxtID: TDBText;
    lblID: TLabel;
    lblEstoque: TLabel;
    LookupFornecedor: TDBLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
  private
    var lCrudBotoes: TBotoes;
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
  lCrudBotoes.botaoCancelar(DmConexao.sdsProdutos);
  PageControl1.TabIndex := 1;
end;

procedure TviewProdutos.btnEditarClick(Sender: TObject);
begin
  inherited;
  PageControl1.TabIndex := 0;
  lCrudBotoes.botaoEditar(DmConexao.sdsProdutos, DmConexao.sdsProdutos.FieldByName('PROD_DATA_CADASTRO'));
  edtDescricao.SetFocus;
end;

procedure TviewProdutos.btnExcluirClick(Sender: TObject);
begin
  inherited;
  lCrudBotoes.botaoExcluir(DmConexao.sdsProdutos);
end;

procedure TviewProdutos.btnNovoClick(Sender: TObject);
begin
  inherited;
  PageControl1.TabIndex := 0;
  lCrudBotoes.botaoNovo(DmConexao.sdsProdutos,'PROD_ID', DmConexao.sdsProdutos.FieldByName('PROD_DATA_CADASTRO'));
  LookupFornecedor.SetFocus;
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
  lCrudBotoes.botaoSalvar(DmConexao.sdsProdutos, 'Registro salvo com sucesso!')
end;

procedure TviewProdutos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DmConexao.sdsProdutos.Close;
  DmConexao.sdsFornecedores.Close;
end;

procedure TviewProdutos.FormCreate(Sender: TObject);
begin
  inherited;
  DmConexao.sdsProdutos.Open;
  DmConexao.sdsFornecedores.Open;
end;

end.
