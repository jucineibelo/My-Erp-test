program ERPCurso;

uses
  Vcl.Forms,
  view.principal in 'src\views\view.principal.pas' {frmPrincipal},
  view.base in 'src\views\view.base.pas' {viewBase},
  view.base.lista in 'src\views\view.base.lista.pas' {viewBaseListas},
  view.fundo in 'src\views\view.fundo.pas' {frmViewFundo},
  view.clientes in 'src\views\view.clientes.pas' {viewClientes},
  dm.conexao in 'src\services\dm.conexao.pas' {DmConexao: TDataModule},
  view.fornecedores in 'src\views\view.fornecedores.pas' {viewFornecedores},
  view.produtos in 'src\views\view.produtos.pas' {viewProdutos},
  view.estoque in 'src\views\view.estoque.pas' {viewEstoque},
  view.funcionarios in 'src\views\view.funcionarios.pas' {viewFuncionarios},
  view.empresa in 'src\views\view.empresa.pas' {viewEmpresa},
  view.login in 'src\views\view.login.pas' {frmLogin};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDmConexao, DmConexao);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
