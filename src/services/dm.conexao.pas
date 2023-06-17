unit dm.conexao;

interface

uses
  System.SysUtils, System.Classes, Data.DBXFirebird, Data.DB, Data.SqlExpr,
  Datasnap.DBClient, SimpleDS, view.clientes, view.fornecedores, IniFiles;

type
  TDmConexao = class(TDataModule)
    SQLConexao: TSQLConnection;
    dsClientes: TDataSource;
    dsFornecedores: TDataSource;
    sdsFornecedores: TSimpleDataSet;
    sdsFornecedoresFORNECEDOR_ID: TIntegerField;
    sdsFornecedoresFORNECEDOR_RAZAO: TStringField;
    sdsFornecedoresFORNECEDOR_TELEFONE: TStringField;
    sdsFornecedoresFORNECEDOR_CPF: TStringField;
    sdsFornecedoresFORNECEDOR_CNPJ: TStringField;
    sdsFornecedoresFORNECEDOR_RG: TStringField;
    sdsFornecedoresFORNECEDOR_IE: TStringField;
    sdsFornecedoresFORNECEDOR_OBS: TStringField;
    sdsFornecedoresFORNECEDOR_ENDERECO: TStringField;
    sdsFornecedoresFORNECEDOR_CIDADE: TStringField;
    sdsFornecedoresFORNECEDOR_ESTADO: TStringField;
    sdsFornecedoresFORNECEDOR_TIPO: TStringField;
    sdsClientes: TSimpleDataSet;
    sdsClientesCLIENTE_ID: TIntegerField;
    sdsClientesCLIENTE_RAZAO: TStringField;
    sdsClientesCLIENTE_TELEFONE: TStringField;
    sdsClientesCLIENTE_CPF: TStringField;
    sdsClientesCLIENTE_CNPJ: TStringField;
    sdsClientesCLIENTE_RG: TStringField;
    sdsClientesCLIENTE_IE: TStringField;
    sdsClientesCLIENTE_OBS: TStringField;
    sdsClientesCLIENTE_ENDERECO: TStringField;
    sdsClientesCLIENTE_CIDADE: TStringField;
    sdsClientesCLIENTE_ESTADO: TStringField;
    sdsClientesCLIENTE_TIPO: TStringField;
    sdsProdutos: TSimpleDataSet;
    dsProdutos: TDataSource;
    sdsProdutosPROD_ID: TIntegerField;
    sdsProdutosPROD_DESCRICAO: TStringField;
    sdsProdutosPROD_MARCA: TStringField;
    sdsProdutosPROD_FORNECEDOR: TIntegerField;
    sdsProdutosPROD_PRECO: TFMTBCDField;
    sdsEstoque: TSimpleDataSet;
    dsEstoque: TDataSource;
    sdsEstoqueID: TIntegerField;
    sdsEstoqueDATA: TDateField;
    sdsEstoquePRODUTO: TIntegerField;
    sdsEstoqueQTD: TFMTBCDField;
    sdsEstoqueOBS: TBlobField;
    sdsProdutosQTDTOTAL: TFMTBCDField;
    sdsProdutosFORNECEDOR_RAZAO: TStringField;
    sdsProdutosPROD_DATA_CADASTRO: TDateField;
    sdsClientesDATA_CADASTRO: TDateField;
    sdsFornecedoresDATA_CADASTRO: TDateField;
    sdsFuncionarios: TSimpleDataSet;
    dsFuncionarios: TDataSource;
    sdsFuncionariosCODIGO: TIntegerField;
    sdsFuncionariosNOME: TStringField;
    sdsFuncionariosSETOR: TStringField;
    sdsFuncionariosCARGO: TStringField;
    sdsFuncionariosUSUARIO: TStringField;
    sdsFuncionariosSENHA: TStringField;
    sdsFuncionariosDATA_CADASTRO: TDateField;
    sdsEmpresa: TSimpleDataSet;
    sdEmpresa: TDataSource;
    sdsEmpresaRAZAO_SOCIAL: TStringField;
    sdsEmpresaCNPJ_CPF: TStringField;
    sdsEmpresaIE_RG: TStringField;
    sdsEmpresaENDERECO: TStringField;
    sdsEmpresaMUNICIPIO: TStringField;
    sdsEmpresaESTADO: TStringField;
    sdsEmpresaEMAIL: TStringField;
    sdsEmpresaTELEFONE: TStringField;
    sdsFornecedoresTIPO_PESSOA: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure sdsClientesBeforeEdit(DataSet: TDataSet);
    procedure sdsFornecedoresBeforeEdit(DataSet: TDataSet);
  private
    { Private declarations }
  public
    function caminhDoConfigTxt: string;
  end;

var
  DmConexao: TDmConexao;

implementation

{$R *.dfm}

function TDmConexao.caminhDoConfigTxt: string;
var
  ini: Tinifile;
  path: string;
begin
  ini := Tinifile.Create(ExtractFilePath(ParamStr(0)) + '\Config.ini');
  path := ini.ReadString('BASE', 'BASE', 'ADM');
  result := path;
end;

procedure TDmConexao.DataModuleCreate(Sender: TObject);
begin
  with SQLConexao do
  begin
    Close;
    Params.Values['DataBase'] := caminhDoConfigTxt;
    Open;
  end;
end;

procedure TDmConexao.sdsClientesBeforeEdit(DataSet: TDataSet);
begin
  if DmConexao.sdsClientesCLIENTE_TIPO.AsString = 'F' then
  begin
    viewClientes.edtCPF.Enabled := True;
    viewClientes.edtRG.Enabled := True;
    viewClientes.edtCNPJ.Enabled := False;
    viewClientes.edtIE.Enabled := False;
  end
  else if DmConexao.sdsClientesCLIENTE_TIPO.AsString = 'J' then
  begin
    viewClientes.edtCPF.Enabled := False;
    viewClientes.edtRG.Enabled := False;
    viewClientes.edtCNPJ.Enabled := True;
    viewClientes.edtIE.Enabled := True;
  end;
end;

procedure TDmConexao.sdsFornecedoresBeforeEdit(DataSet: TDataSet);
begin
  if DmConexao.sdsFornecedoresFORNECEDOR_TIPO.AsString = 'F' then
  begin
    viewFornecedores.edtCPF.Enabled := True;
    viewFornecedores.edtRG.Enabled := True;
    viewFornecedores.edtCNPJ.Enabled := False;
    viewFornecedores.edtIE.Enabled := False;
  end
  else if DmConexao.sdsFornecedoresFORNECEDOR_TIPO.AsString = 'J' then
  begin
    viewFornecedores.edtCPF.Enabled := False;
    viewFornecedores.edtRG.Enabled := False;
    viewFornecedores.edtCNPJ.Enabled := True;
    viewFornecedores.edtIE.Enabled := True;
  end;

end;

end.
