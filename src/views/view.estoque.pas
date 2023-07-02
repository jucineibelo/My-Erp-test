unit view.estoque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, view.base.lista, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.Mask, JvExControls, JvDBLookup, dm.conexao, DB, Vcl.Grids, Vcl.DBGrids, botoes;

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
    procedure impedirPermitirEditar(Value: Boolean); // quando abre o form impedir que seja editado antes que se adicione um novo registro
    var lCrudBotoes: TBotoes;
  public

  end;

var
  viewEstoque: TviewEstoque;

implementation

{$R *.dfm}

procedure TviewEstoque.btnCancelarClick(Sender: TObject);
begin
  inherited;
  try
    lCrudBotoes.botaoCancelar(DmConexao.sdsEstoque);
  finally
    lCrudBotoes.Free;
  end;
  desativarBotoes;
  DmConexao.sdsEstoque.Append; // trazer formulario limpo (sem dados)
  impedirPermitirEditar(True); // readOnly ativado
end;

procedure TviewEstoque.btnNovoClick(Sender: TObject);
var
  proxregistro: Integer;
begin
  inherited;
  PageControl1.TabIndex := 0;
  try
    lCrudBotoes.botaoNovo(DmConexao.sdsEstoque, 'ID');
  finally
    lCrudBotoes.Free;
  end;

  // trazer a informa��o da data j� preenchida
  DmConexao.sdsEstoqueDATA.AsDateTime := Now;
  lookupProd.SetFocus;

//  // ativar os bot�es
  btnCancelar.Visible := True;
  btnSalvar.Visible := True;
  btnNovo.Visible := False;

  // tirar do modo readOnly
  impedirPermitirEditar(False);
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
  try
    lCrudBotoes.botaoSalvar(DmConexao.sdsEstoque, 'Estoque registrado com sucesso!');
  finally
    lCrudBotoes.Free;
  end;
  desativarBotoes;
  DmConexao.sdsEstoque.Append; // trazer formulario limpo (sem dados)
  impedirPermitirEditar(True);
end;

procedure TviewEstoque.desativarBotoes;   //desativar bot�es n�o utilizados que est�o herdados
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
  // Abrir conex�o das tabelas ao iniciar FORM
  DmConexao.sdsEstoque.Open;
  DmConexao.sdsProdutos.Open;

  // trazer formulario limpo (sem dados)
  DmConexao.sdsEstoque.Append;
  impedirPermitirEditar(True);
end;

procedure TviewEstoque.FormShow(Sender: TObject);
begin
  inherited;
  // desativar bot�es ao abrir FORM
  desativarBotoes;
end;

procedure TviewEstoque.limparDados;
begin
  DmConexao.sdsEstoqueDATA.Clear;
  DmConexao.sdsEstoquePRODUTO.Clear;
  DmConexao.sdsEstoqueQTD.Clear;
  DmConexao.sdsEstoqueOBS.Clear;
end;

procedure TviewEstoque.impedirPermitirEditar(Value: Boolean);
begin
  edtData.ReadOnly := Value;
  lookupProd.ReadOnly := Value;
  edtQtd.ReadOnly := Value;
  edtObs.ReadOnly := Value;
end;

end.
