unit view.principal;

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
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Buttons,
  Vcl.Imaging.pngimage,
  Vcl.Imaging.jpeg,
  System.Actions,
  Vcl.ActnList,
  Vcl.ImgList,
  view.fornecedores,
  view.produtos,
  Vcl.Menus,
  view.estoque, view.funcionarios, view.empresa, System.ImageList;

type
  TfrmPrincipal = class(TForm)
    PnlTopPrincipal: TPanel;
    pnlOpcoes: TPanel;
    PanelBackgroundPrincipal: TPanel;
    pnlRodape: TPanel;
    pnlConteudo: TPanel;
    pnlLogo: TPanel;
    pnlLinhaEmpresa: TPanel;
    pnlVersao: TPanel;
    lblVersao: TLabel;
    lblNumVersao: TLabel;
    pnlNomeUsuario: TPanel;
    pnlLinhaUsuario: TPanel;
    pnlImagemUsuario: TPanel;
    imgUsuarioBranco: TImage;
    pnlDadosUsuarios: TPanel;
    lblUsuario: TLabel;
    lablPerfil: TLabel;
    pnlLicensiado: TPanel;
    pnlLinhaRodape: TPanel;
    pnlConteudoLicensa: TPanel;
    lblLicenciado: TLabel;
    lblEmpresaLicenciada: TLabel;
    pnlSair: TPanel;
    pnlShapeMenu: TPanel;
    ShapeMenu: TShape;
    pnlDadosMenu: TPanel;
    btnConfiguracoes: TSpeedButton;
    btnClientes: TSpeedButton;
    btnCaixa: TSpeedButton;
    btnFornecedores: TSpeedButton;
    btnProdutos: TSpeedButton;
    pnlConteudo2: TPanel;
    lblDescricaoEmpresa: TLabel;
    lvlNomeDaEmpresa: TLabel;
    imgUsuarioAmarelo: TImage;
    imgBackground: TImage;
    btnSair: TSpeedButton;
    btnVendas: TSpeedButton;
    btnFuncionarios: TSpeedButton;
    Image1: TImage;
    imgIcones: TImageList;
    PopMenuProd: TPopupMenu;
    Estoque1: TMenuItem;
    Produtos1: TMenuItem;
    PopupMenuConfig: TPopupMenu;
    Empresa1: TMenuItem;
    procedure btnSairClick(Sender: TObject);
    procedure btnFornecedoresClick(Sender: TObject);
    procedure lvlNomeDaEmpresaMouseEnter(Sender: TObject);
    procedure lvlNomeDaEmpresaMouseLeave(Sender: TObject);
    procedure imgUsuarioBrancoMouseEnter(Sender: TObject);
    procedure imgUsuarioBrancoMouseLeave(Sender: TObject);
    procedure btnFuncionariosClick(Sender: TObject);
    procedure btnVendasClick(Sender: TObject);
    procedure btnClientesClick(Sender: TObject);
    procedure btnProdutosClick(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
    procedure Estoque1Click(Sender: TObject);
    procedure btnConfiguracoesClick(Sender: TObject);
    procedure Empresa1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private

  public

    procedure GetLineMenu(Sender: TObject);

  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  view.clientes, dm.conexao, view.vendas;

{$R *.dfm}

procedure TfrmPrincipal.btnClientesClick(Sender: TObject);
begin
  GetLineMenu(Sender);
  viewclientes := Tviewclientes.Create(Self);
  try
    viewclientes.showModal;

  finally
    FreeAndNil(viewclientes);
  end;
end;

procedure TfrmPrincipal.btnConfiguracoesClick(Sender: TObject);
begin
  if PopupMenuConfig <> nil then
  begin
    PopupMenuConfig.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
  end;
end;

procedure TfrmPrincipal.btnFornecedoresClick(Sender: TObject);
begin // fornecedores
  GetLineMenu(Sender);
  viewFornecedores := TviewFornecedores.Create(Self);
  try
    viewFornecedores.showModal;

  finally
    FreeAndNil(viewFornecedores);
  end;

end;

procedure TfrmPrincipal.btnFuncionariosClick(Sender: TObject);
begin // Funcionarios
  GetLineMenu(Sender);
  viewfuncionarios := TviewFuncionarios.Create(Self);
  try
    viewfuncionarios.showModal;

  finally
    FreeAndNil(viewfuncionarios);
  end;

end;

procedure TfrmPrincipal.btnProdutosClick(Sender: TObject);
begin
  if PopMenuProd <> nil then
  begin
    PopMenuProd.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
  end;
end;

procedure TfrmPrincipal.btnSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmPrincipal.btnVendasClick(Sender: TObject);
begin // Vendas
  GetLineMenu(Sender);
  viewVendas := TviewVendas.Create(Self);
  try
    viewVendas.ShowModal
  finally
    FreeAndNil(viewVendas);
  end;
end;

procedure TfrmPrincipal.Empresa1Click(Sender: TObject);
begin // Empresa

  GetLineMenu(Sender);
  viewEmpresa := TviewEmpresa.Create(Self);
  try
    viewEmpresa.showModal;
  finally
    FreeAndNil(viewEmpresa);
  end;
end;

procedure TfrmPrincipal.Estoque1Click(Sender: TObject);
begin
  GetLineMenu(Sender);
  viewEstoque := TviewEstoque.Create(Self);
  try
    viewEstoque.showModal;
  finally
    FreeAndNil(viewEstoque);
  end;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
//Parametro para carregar o nome da empresa
var
  sEmpresa, sFuncionario: string;
begin
  if not DmConexao.sdsEmpresa.Active then
  // Verifica se o dataset já está aberto
    DmConexao.sdsEmpresa.Open;

  try
    sEmpresa := DmConexao.sdsEmpresaRAZAO_SOCIAL.AsString;
    lblEmpresaLicenciada.Caption := sEmpresa;
  except
    on E: Exception do
      ShowMessage('Erro ao obter o nome da empresa: ' + E.Message);
  end;
  DmConexao.sdsEmpresa.Close;
end;

procedure TfrmPrincipal.GetLineMenu(Sender: TObject);
begin
  ShapeMenu.Left := 0;
  ShapeMenu.Top := 0;
  ShapeMenu.Height := TSpeedButton(Sender).Height;
  ShapeMenu.Top := TSpeedButton(Sender).Top;
  pnlShapeMenu.Repaint;

end;

procedure TfrmPrincipal.imgUsuarioBrancoMouseEnter(Sender: TObject);
begin
  imgUsuarioBranco.Visible := False;
  imgUsuarioAmarelo.Visible := True;
end;

procedure TfrmPrincipal.imgUsuarioBrancoMouseLeave(Sender: TObject);
begin
  imgUsuarioBranco.Visible := True;
  imgUsuarioAmarelo.Visible := False;

end;

procedure TfrmPrincipal.lvlNomeDaEmpresaMouseEnter(Sender: TObject);
begin
  lvlNomeDaEmpresa.Font.Color := $0080FFFF;
end;

procedure TfrmPrincipal.lvlNomeDaEmpresaMouseLeave(Sender: TObject);
begin
  lvlNomeDaEmpresa.Font.Color := clWhite;
end;

procedure TfrmPrincipal.Produtos1Click(Sender: TObject);
begin
  GetLineMenu(Sender);
  viewProdutos := TviewProdutos.Create(Self);
  try
    viewProdutos.showModal;
  finally
    FreeAndNil(viewProdutos);
  end;
end;

end.
