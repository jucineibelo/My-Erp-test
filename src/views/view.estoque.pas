unit view.estoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, view.base.lista, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.Mask, JvExControls, JvDBLookup, dm.conexao, DB, Vcl.Grids, Vcl.DBGrids;

type
  TviewEstoque = class(TviewBaseListas)
    edtData: TDBEdit;
    lblData: TLabel;
    edtObs: TDBMemo;
    lblObs: TLabel;
    lblProduto: TLabel;
    lookupProd: TJvDBLookupCombo;
    edtQtd: TDBEdit;
    lblQtd: TLabel;
    id: TDBText;
    lblID: TLabel;
    DBGrid1: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
  private
    procedure desativarBotoes;
    procedure limparDados;
    procedure ImpedirDeEditar;
    // É para quando abre o form impedir que seja editado antes que se adicione um novo registro
    procedure permitirEditar;
  public
    { Public declarations }
  end;

var
  viewEstoque: TviewEstoque;

implementation

{$R *.dfm}

procedure TviewEstoque.btnCancelarClick(Sender: TObject);
begin
  inherited;
  if DmConexao.sdsEstoque.State in dsEditModes then
  // pra essa merda de Editmodes funcionar tem que importar a uses DB
    DmConexao.sdsEstoque.Cancel;
  desativarBotoes;
   // trazer formulario limpo (sem dados)
  DmConexao.sdsEstoque.Append;
  ImpedirDeEditar;
end;

procedure TviewEstoque.btnNovoClick(Sender: TObject);
var
  proxregistro: Integer;
begin
  inherited;
  // Criar novo registro na tabela
  PageControl1.TabIndex := 0;
  DmConexao.sdsEstoque.Last;
  proxregistro := DmConexao.sdsEstoqueID.AsInteger + 1;
  DmConexao.sdsEstoque.Append;
  DmConexao.sdsEstoqueID.AsInteger := proxregistro;

  // trazer a informação da data já preenchida
  DmConexao.sdsEstoqueDATA.AsDateTime := Now;
  lookupProd.SetFocus;

  // ativar os botões
  btnCancelar.Visible := True;
  btnSalvar.Visible := True;
  btnNovo.Visible := False;

  // tirar do modo readOnly
  permitirEditar;
end;

procedure TviewEstoque.btnPesquisaClick(Sender: TObject);
begin
  inherited;
  DmConexao.sdsProdutos.Filtered := False;
  DmConexao.sdsProdutos.IndexFieldNames := DBGrid1.SelectedField.FieldName;
  DmConexao.sdsProdutos.FindNearest([edtPesquisa.Text]);
end;

procedure TviewEstoque.btnSalvarClick(Sender: TObject);
begin
  inherited;
  DmConexao.sdsEstoque.Post;
  DmConexao.sdsEstoque.ApplyUpdates(0);
  DmConexao.sdsProdutos.Refresh;
  MessageDlg('Estoque salvo com sucesso!', mtInformation, [mbOK], 0);
  desativarBotoes;
  // trazer formulario limpo (sem dados)
  DmConexao.sdsEstoque.Append;
  ImpedirDeEditar;
end;

procedure TviewEstoque.desativarBotoes;   //desativar botões não utilizados que estão herdados
begin
  btnNovo.Visible := True;
  btnEditar.Visible := False;
  btnCancelar.Visible := False;
  btnSalvar.Visible := False;
  btnExcluir.Visible := False;

end;

procedure TviewEstoque.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DmConexao.sdsEstoque.Close;
  DmConexao.sdsProdutos.Close;
end;

procedure TviewEstoque.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  inherited;
  // Abrir conexão das tabelas ao iniciar FORM
  DmConexao.sdsEstoque.Open;
  DmConexao.sdsProdutos.Open;

  // trazer formulario limpo (sem dados)
  DmConexao.sdsEstoque.Append;
  ImpedirDeEditar;
end;

procedure TviewEstoque.FormShow(Sender: TObject);
begin
  inherited;
  // desativar botões ao abrir FORM
  desativarBotoes;

end;

procedure TviewEstoque.ImpedirDeEditar;
begin
  edtData.ReadOnly := True;
  lookupProd.ReadOnly := True;
  edtQtd.ReadOnly := True;
  edtObs.ReadOnly := True;

end;

procedure TviewEstoque.limparDados;
begin
  DmConexao.sdsEstoqueDATA.Clear;
  DmConexao.sdsEstoquePRODUTO.Clear;
  DmConexao.sdsEstoqueQTD.Clear;
  DmConexao.sdsEstoqueOBS.Clear;
end;

procedure TviewEstoque.permitirEditar;
begin
  edtData.ReadOnly := False;
  lookupProd.ReadOnly := False;
  edtQtd.ReadOnly := False;
  edtObs.ReadOnly := False;

end;

end.
