object DmConexao: TDmConexao
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 494
  Width = 378
  object SQLConexao: TSQLConnection
    ConnectionName = 'FBConnection'
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver210.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=21.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXFirebirdMetaDataCommandFactory,DbxFire' +
        'birdDriver210.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXFirebirdMetaDataCommandF' +
        'actory,Borland.Data.DbxFirebirdDriver,Version=21.0.0.0,Culture=n' +
        'eutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverINTERBASE'
      'LibraryName=dbxfb.dll'
      'LibraryNameOsx=libsqlfb.dylib'
      'VendorLib=fbclient.dll'
      'VendorLibWin64=fbclient.dll'
      'VendorLibOsx=/Library/Frameworks/Firebird.framework/Firebird'
      'Role=RoleName'
      'MaxBlobSize=-1'
      'TrimChar=False'
      'DriverName=Firebird'
      
        'Database=C:\Users\Juci\Desktop\projeto\my-sys\Banco de Dados\DAT' +
        'ABASE.FDB'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'IsolationLevel=ReadCommitted'
      'Trim Char=False')
    Left = 32
    Top = 16
  end
  object dsClientes: TDataSource
    DataSet = sdsClientes
    Left = 136
    Top = 72
  end
  object dsFornecedores: TDataSource
    DataSet = sdsFornecedores
    Left = 136
    Top = 128
  end
  object sdsFornecedores: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConexao
    DataSet.CommandText = 
      'select f.fornecedor_id, f.fornecedor_razao, f.fornecedor_telefon' +
      'e, f.fornecedor_cpf, f.fornecedor_cnpj, f.fornecedor_rg, f.forne' +
      'cedor_ie,'#13#10'f.fornecedor_obs, f.fornecedor_endereco, f.data_cadas' +
      'tro, f.fornecedor_cidade, f.fornecedor_estado, f.fornecedor_tipo' +
      ','#13#10'case when f.fornecedor_tipo = '#39'J'#39' then f.fornecedor_cnpj'#13#10'els' +
      'e f.fornecedor_cpf end as tipo_Pessoa'#13#10'from fornecedores f'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    BeforeEdit = sdsFornecedoresBeforeEdit
    Left = 32
    Top = 128
    object sdsFornecedoresFORNECEDOR_ID: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'FORNECEDOR_ID'
      Required = True
    end
    object sdsFornecedoresFORNECEDOR_RAZAO: TStringField
      FieldName = 'FORNECEDOR_RAZAO'
      Required = True
      Size = 100
    end
    object sdsFornecedoresFORNECEDOR_TELEFONE: TStringField
      FieldName = 'FORNECEDOR_TELEFONE'
    end
    object sdsFornecedoresFORNECEDOR_CPF: TStringField
      FieldName = 'FORNECEDOR_CPF'
      EditMask = '999.999.999-99;1;_'
    end
    object sdsFornecedoresFORNECEDOR_CNPJ: TStringField
      FieldName = 'FORNECEDOR_CNPJ'
      EditMask = '99.999.999/9999-99;1;_'
    end
    object sdsFornecedoresFORNECEDOR_RG: TStringField
      FieldName = 'FORNECEDOR_RG'
    end
    object sdsFornecedoresFORNECEDOR_IE: TStringField
      FieldName = 'FORNECEDOR_IE'
    end
    object sdsFornecedoresFORNECEDOR_OBS: TStringField
      FieldName = 'FORNECEDOR_OBS'
      Size = 200
    end
    object sdsFornecedoresFORNECEDOR_ENDERECO: TStringField
      FieldName = 'FORNECEDOR_ENDERECO'
      Size = 150
    end
    object sdsFornecedoresFORNECEDOR_CIDADE: TStringField
      FieldName = 'FORNECEDOR_CIDADE'
      Size = 100
    end
    object sdsFornecedoresFORNECEDOR_ESTADO: TStringField
      FieldName = 'FORNECEDOR_ESTADO'
      FixedChar = True
      Size = 2
    end
    object sdsFornecedoresFORNECEDOR_TIPO: TStringField
      FieldName = 'FORNECEDOR_TIPO'
      FixedChar = True
      Size = 1
    end
    object sdsFornecedoresDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      EditMask = '!99/99/0000;1;_'
    end
    object sdsFornecedoresTIPO_PESSOA: TStringField
      FieldName = 'TIPO_PESSOA'
    end
  end
  object sdsClientes: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConexao
    DataSet.CommandText = 'select * from CLIENTES'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    BeforeEdit = sdsClientesBeforeEdit
    Left = 32
    Top = 72
    object sdsClientesCLIENTE_ID: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'CLIENTE_ID'
      Required = True
    end
    object sdsClientesCLIENTE_RAZAO: TStringField
      FieldName = 'CLIENTE_RAZAO'
      Required = True
      Size = 100
    end
    object sdsClientesCLIENTE_TELEFONE: TStringField
      FieldName = 'CLIENTE_TELEFONE'
      EditMask = '(99) 9999-9999;0;_'
    end
    object sdsClientesCLIENTE_CPF: TStringField
      FieldName = 'CLIENTE_CPF'
      EditMask = '999.999.999-99;1;_'
    end
    object sdsClientesCLIENTE_CNPJ: TStringField
      FieldName = 'CLIENTE_CNPJ'
      EditMask = '99.999.999/9999-99;1;_'
    end
    object sdsClientesCLIENTE_RG: TStringField
      FieldName = 'CLIENTE_RG'
    end
    object sdsClientesCLIENTE_IE: TStringField
      FieldName = 'CLIENTE_IE'
    end
    object sdsClientesCLIENTE_OBS: TStringField
      FieldName = 'CLIENTE_OBS'
      Size = 200
    end
    object sdsClientesCLIENTE_ENDERECO: TStringField
      FieldName = 'CLIENTE_ENDERECO'
      Size = 150
    end
    object sdsClientesCLIENTE_CIDADE: TStringField
      FieldName = 'CLIENTE_CIDADE'
      Size = 100
    end
    object sdsClientesCLIENTE_ESTADO: TStringField
      FieldName = 'CLIENTE_ESTADO'
      FixedChar = True
      Size = 2
    end
    object sdsClientesCLIENTE_TIPO: TStringField
      FieldName = 'CLIENTE_TIPO'
      FixedChar = True
      Size = 1
    end
    object sdsClientesDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      EditMask = '!99/99/0000;1;_'
    end
  end
  object sdsProdutos: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConexao
    DataSet.CommandText = 
      'select p.prod_id, p.prod_descricao, p.prod_marca, p.prod_fornece' +
      'dor, p.prod_preco, p.prod_data_cadastro, sum(e.qtd) as QtdTotal,' +
      ' f.fornecedor_razao'#13#10'from produtos p'#13#10'left join estoque e on e.p' +
      'roduto = p.prod_id'#13#10'left join fornecedores f on f.fornecedor_id ' +
      '= p.prod_fornecedor'#13#10'GROUP BY p.prod_id, p.prod_descricao, p.pro' +
      'd_marca, p.prod_fornecedor, p.prod_data_cadastro, p.prod_preco, ' +
      'f.fornecedor_razao'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 32
    Top = 192
    object sdsProdutosPROD_ID: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'PROD_ID'
      Required = True
    end
    object sdsProdutosPROD_DESCRICAO: TStringField
      FieldName = 'PROD_DESCRICAO'
      Required = True
      Size = 100
    end
    object sdsProdutosPROD_MARCA: TStringField
      FieldName = 'PROD_MARCA'
      Size = 100
    end
    object sdsProdutosPROD_FORNECEDOR: TIntegerField
      FieldName = 'PROD_FORNECEDOR'
    end
    object sdsProdutosPROD_PRECO: TFMTBCDField
      FieldName = 'PROD_PRECO'
      currency = True
      Precision = 18
      Size = 2
    end
    object sdsProdutosQTDTOTAL: TFMTBCDField
      FieldName = 'QTDTOTAL'
      Precision = 18
      Size = 2
    end
    object sdsProdutosFORNECEDOR_RAZAO: TStringField
      FieldName = 'FORNECEDOR_RAZAO'
      Size = 100
    end
    object sdsProdutosPROD_DATA_CADASTRO: TDateField
      FieldName = 'PROD_DATA_CADASTRO'
      EditMask = '!99/99/0000;1;_'
    end
  end
  object dsProdutos: TDataSource
    DataSet = sdsProdutos
    Left = 136
    Top = 192
  end
  object sdsEstoque: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConexao
    DataSet.CommandText = 'select * from estoque'
    DataSet.MaxBlobSize = 1
    DataSet.Params = <>
    Params = <>
    Left = 32
    Top = 256
    object sdsEstoqueID: TIntegerField
      AutoGenerateValue = arAutoInc
      FieldName = 'ID'
      Required = True
    end
    object sdsEstoqueDATA: TDateField
      FieldName = 'DATA'
      Required = True
      EditMask = '!99/99/0000;1;_'
    end
    object sdsEstoquePRODUTO: TIntegerField
      FieldName = 'PRODUTO'
    end
    object sdsEstoqueQTD: TFMTBCDField
      FieldName = 'QTD'
      EditFormat = '0.00'
      Precision = 18
      Size = 2
    end
    object sdsEstoqueOBS: TBlobField
      FieldName = 'OBS'
      Size = 1
    end
  end
  object dsEstoque: TDataSource
    DataSet = sdsEstoque
    Left = 136
    Top = 256
  end
  object sdsFuncionarios: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConexao
    DataSet.CommandText = 'select * from funcionarios'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 32
    Top = 320
    object sdsFuncionariosCODIGO: TIntegerField
      FieldName = 'CODIGO'
      Required = True
    end
    object sdsFuncionariosNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object sdsFuncionariosSETOR: TStringField
      FieldName = 'SETOR'
    end
    object sdsFuncionariosCARGO: TStringField
      FieldName = 'CARGO'
    end
    object sdsFuncionariosUSUARIO: TStringField
      FieldName = 'USUARIO'
      Size = 30
    end
    object sdsFuncionariosSENHA: TStringField
      FieldName = 'SENHA'
      Size = 30
    end
    object sdsFuncionariosDATA_CADASTRO: TDateField
      FieldName = 'DATA_CADASTRO'
      EditMask = '!99/99/0000;1;_'
    end
  end
  object dsFuncionarios: TDataSource
    DataSet = sdsFuncionarios
    Left = 136
    Top = 320
  end
  object sdsEmpresa: TSimpleDataSet
    Aggregates = <>
    Connection = SQLConexao
    DataSet.CommandText = 'select * from EMPRESA'
    DataSet.MaxBlobSize = -1
    DataSet.Params = <>
    Params = <>
    Left = 136
    Top = 16
    object sdsEmpresaRAZAO_SOCIAL: TStringField
      FieldName = 'RAZAO_SOCIAL'
      Required = True
      Size = 100
    end
    object sdsEmpresaCNPJ_CPF: TStringField
      FieldName = 'CNPJ_CPF'
      Size = 30
    end
    object sdsEmpresaIE_RG: TStringField
      FieldName = 'IE_RG'
      Size = 15
    end
    object sdsEmpresaENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 100
    end
    object sdsEmpresaMUNICIPIO: TStringField
      FieldName = 'MUNICIPIO'
    end
    object sdsEmpresaESTADO: TStringField
      FieldName = 'ESTADO'
      FixedChar = True
      Size = 2
    end
    object sdsEmpresaEMAIL: TStringField
      FieldName = 'EMAIL'
      Size = 30
    end
    object sdsEmpresaTELEFONE: TStringField
      FieldName = 'TELEFONE'
    end
  end
  object sdEmpresa: TDataSource
    DataSet = sdsEmpresa
    Left = 224
    Top = 16
  end
end
