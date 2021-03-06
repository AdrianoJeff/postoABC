object dm: Tdm
  OldCreateOrder = False
  Left = 642
  Top = 32
  Height = 429
  Width = 602
  object conn: TSQLConnection
    DriverName = 'Firebird'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbxfb.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver160.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=16.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXFirebirdMetaDataCommandFactory,DbxFire' +
        'birdDriver160.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXFirebirdMetaDataCommandF' +
        'actory,Borland.Data.DbxFirebirdDriver,Version=16.0.0.0,Culture=n' +
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
      
        'Database=C:\Users\VAIO\Desktop\postoABC\Base de Dados\POSTOABC.f' +
        'db'
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
    VendorLib = 'fbclient.dll'
    Connected = True
    Left = 24
    Top = 32
  end
  object qryCombustivel: TSQLQuery
    NumericMapping = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from tbcombustivel order by 1')
    SQLConnection = conn
    Left = 228
    Top = 33
  end
  object dspCombustivel: TDataSetProvider
    DataSet = qryCombustivel
    Left = 228
    Top = 81
  end
  object cdsCombustivel: TClientDataSet
    Active = True
    Aggregates = <
      item
        Active = True
        AggregateName = 'seq'
        Expression = 'max(id_combustivel)'
        Visible = False
      end>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspCombustivel'
    AfterInsert = cdsCombustivelAfterInsert
    BeforeDelete = cdsCombustivelBeforeDelete
    AfterDelete = cdsCombustivelAfterDelete
    Left = 228
    Top = 129
    object cdsCombustivelID_COMBUSTIVEL: TIntegerField
      DisplayLabel = 'Id.'
      FieldName = 'ID_COMBUSTIVEL'
      Required = True
    end
    object cdsCombustivelDESCRICAO: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'DESCRICAO'
      Required = True
      Size = 50
    end
    object cdsCombustivelVALOR: TFMTBCDField
      DisplayLabel = 'Valor/Litro'
      FieldName = 'VALOR'
      DisplayFormat = '#,###0.000'
      EditFormat = '#,###0.000'
      Precision = 15
      Size = 6
    end
    object cdsCombustivelIMPOSTO: TFMTBCDField
      DisplayLabel = '% Imposto'
      FieldName = 'IMPOSTO'
      Required = True
      DisplayFormat = '#,###0.000'
      EditFormat = '#,###0.000'
      Precision = 15
      Size = 6
    end
  end
  object qryTanque: TSQLQuery
    NumericMapping = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from tbtanque order by 1')
    SQLConnection = conn
    Left = 308
    Top = 33
  end
  object dspTanque: TDataSetProvider
    DataSet = qryTanque
    Left = 308
    Top = 81
  end
  object cdsTanque: TClientDataSet
    Aggregates = <
      item
        Active = True
        AggregateName = 'seq'
        Expression = 'max(id_tanque)'
        Visible = False
      end>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspTanque'
    AfterInsert = cdsTanqueAfterInsert
    BeforeDelete = cdsTanqueBeforeDelete
    AfterDelete = cdsTanqueAfterDelete
    Left = 308
    Top = 129
    object cdsTanqueID_TANQUE: TIntegerField
      DisplayLabel = 'Id.'
      FieldName = 'ID_TANQUE'
      Required = True
    end
    object cdsTanqueID_COMBUSTIVEL: TIntegerField
      DisplayLabel = 'Id.'
      FieldName = 'ID_COMBUSTIVEL'
    end
    object cdsTanqueCOMBUSTIVEL: TStringField
      DisplayLabel = 'Combust'#237'vel'
      FieldKind = fkLookup
      FieldName = 'COMBUSTIVEL'
      LookupDataSet = cdsCombustivel
      LookupKeyFields = 'ID_COMBUSTIVEL'
      LookupResultField = 'DESCRICAO'
      KeyFields = 'ID_COMBUSTIVEL'
      Lookup = True
    end
    object cdsTanqueVALOR: TFloatField
      FieldKind = fkLookup
      FieldName = 'VALOR'
      LookupDataSet = cdsCombustivel
      LookupKeyFields = 'ID_COMBUSTIVEL'
      LookupResultField = 'VALOR'
      KeyFields = 'ID_COMBUSTIVEL'
      Lookup = True
    end
    object cdsTanqueIMPOSTO: TFloatField
      FieldKind = fkLookup
      FieldName = 'IMPOSTO'
      LookupDataSet = cdsCombustivel
      LookupKeyFields = 'ID_COMBUSTIVEL'
      LookupResultField = 'IMPOSTO'
      KeyFields = 'ID_COMBUSTIVEL'
      Lookup = True
    end
  end
  object qryBomba: TSQLQuery
    NumericMapping = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from tbbomba order by 1')
    SQLConnection = conn
    Left = 388
    Top = 33
  end
  object dspBomba: TDataSetProvider
    DataSet = qryBomba
    Left = 388
    Top = 81
  end
  object cdsBomba: TClientDataSet
    Aggregates = <
      item
        Active = True
        AggregateName = 'seq'
        Expression = 'max(id_bomba)'
        Visible = False
      end>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspBomba'
    AfterInsert = cdsBombaAfterInsert
    BeforeDelete = cdsBombaBeforeDelete
    AfterDelete = cdsBombaAfterDelete
    Left = 388
    Top = 129
    object cdsBombaID_BOMBA: TIntegerField
      DisplayLabel = 'Id.'
      FieldName = 'ID_BOMBA'
      Required = True
    end
    object cdsBombaID_TANQUE: TIntegerField
      DisplayLabel = 'Tanque'
      FieldName = 'ID_TANQUE'
    end
    object cdsBombaCOMBUSTIVEL: TStringField
      DisplayLabel = 'Combust'#237'vel'
      FieldKind = fkLookup
      FieldName = 'COMBUSTIVEL'
      LookupDataSet = cdsTanque
      LookupKeyFields = 'ID_TANQUE'
      LookupResultField = 'COMBUSTIVEL'
      KeyFields = 'ID_TANQUE'
      Lookup = True
    end
    object cdsBombaVALOR_LITRO: TFloatField
      FieldKind = fkLookup
      FieldName = 'VALOR_LITRO'
      LookupDataSet = cdsTanque
      LookupKeyFields = 'ID_TANQUE'
      LookupResultField = 'VALOR'
      KeyFields = 'ID_TANQUE'
      DisplayFormat = '#,###0.000'
      EditFormat = '#,###0.000'
      Lookup = True
    end
    object cdsBombaTAXA_IMPOSTO: TFloatField
      FieldKind = fkLookup
      FieldName = 'TAXA_IMPOSTO'
      LookupDataSet = cdsTanque
      LookupKeyFields = 'ID_TANQUE'
      LookupResultField = 'IMPOSTO'
      KeyFields = 'ID_TANQUE'
      DisplayFormat = '#,###0.000'
      EditFormat = '#,###0.000'
      Lookup = True
    end
    object cdsBombaTANQUE: TIntegerField
      DisplayLabel = 'Tanque'
      FieldKind = fkLookup
      FieldName = 'TANQUE'
      LookupDataSet = cdsTanque
      LookupKeyFields = 'ID_TANQUE'
      LookupResultField = 'ID_TANQUE'
      KeyFields = 'ID_TANQUE'
      Lookup = True
    end
    object cdsBombaQTDE: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'QTDE'
      DisplayFormat = '#,###0.000'
      EditFormat = '#,###0.000'
    end
    object cdsBombaIMPOSTO: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'IMPOSTO'
      DisplayFormat = '#,###0.000'
      EditFormat = '#,###0.000'
    end
    object cdsBombaTOTAL: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'TOTAL'
      DisplayFormat = '#,###0.000'
      EditFormat = '#,###0.000'
    end
    object cdsBombaVALOR: TFloatField
      FieldKind = fkInternalCalc
      FieldName = 'VALOR'
      DisplayFormat = '#,###0.000'
      EditFormat = '#,###0.000'
    end
  end
  object qryAbastecimento: TSQLQuery
    NumericMapping = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select * from tbabastecimento order by 1')
    SQLConnection = conn
    Left = 468
    Top = 33
  end
  object dspAbastecimento: TDataSetProvider
    DataSet = qryAbastecimento
    Left = 468
    Top = 81
  end
  object cdsAbastecimento: TClientDataSet
    Aggregates = <
      item
        Active = True
        AggregateName = 'seq'
        Expression = 'max(id_abastecimento)'
        Visible = False
      end>
    AggregatesActive = True
    Params = <>
    ProviderName = 'dspAbastecimento'
    AfterInsert = cdsAbastecimentoAfterInsert
    BeforeDelete = cdsAbastecimentoBeforeDelete
    AfterDelete = cdsAbastecimentoAfterDelete
    Left = 468
    Top = 129
    object cdsAbastecimentoID_ABASTECIMENTO: TIntegerField
      DisplayLabel = 'Id.'
      FieldName = 'ID_ABASTECIMENTO'
      LookupDataSet = cdsBomba
      LookupKeyFields = 'ID_BOMBA'
      LookupResultField = 'ID_BOMBA'
      Required = True
    end
    object cdsAbastecimentoID_BOMBA: TIntegerField
      DisplayLabel = 'Bomba'
      FieldName = 'ID_BOMBA'
    end
    object cdsAbastecimentoDATA: TSQLTimeStampField
      DisplayLabel = 'Data'
      FieldName = 'DATA'
      Required = True
    end
    object cdsAbastecimentoQUANTIDADE: TFMTBCDField
      DisplayLabel = 'Quantidade/Litros'
      FieldName = 'QUANTIDADE'
      Required = True
      DisplayFormat = '#,###0.000'
      EditFormat = '#,###0.000'
      Precision = 15
      Size = 6
    end
    object cdsAbastecimentoVALOR: TFMTBCDField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
      Required = True
      DisplayFormat = '#,###0.000'
      EditFormat = '#,###0.000'
      Precision = 15
      Size = 6
    end
    object cdsAbastecimentoVALOR_IMPOSTO: TFMTBCDField
      DisplayLabel = 'Valor do Imposto'
      FieldName = 'VALOR_IMPOSTO'
      Required = True
      DisplayFormat = '#,###0.000'
      EditFormat = '#,###0.000'
      Precision = 15
      Size = 6
    end
  end
  object qryRelatorio: TSQLQuery
    NumericMapping = True
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select '
      '    cast('
      '        extract(MONTH FROM data) || '#39'/'#39' ||'
      '        extract(DAY FROM data) || '#39'/'#39' ||'
      '        extract(YEAR FROM data) '
      '    as timestamp) as DATA, '
      '    B.ID_TANQUE,    '
      '    A.ID_BOMBA,'
      '    C.DESCRICAO,'
      '    COUNT(1) AS QTDE_ABASTECIMENTOS,    '
      '    SUM(A.QUANTIDADE) AS QUANTIDADE_LITROS,'
      '    SUM(A.VALOR) AS VALOR,'
      '    SUM(A.VALOR_IMPOSTO) AS VALOR_IMPOSTO,'
      '    SUM(A.VALOR) + SUM(A.VALOR_IMPOSTO) AS VALOR_PAGO'
      ' from TBABASTECIMENTO A'
      ' join TBBOMBA B ON'
      ' (B.ID_BOMBA = A.ID_BOMBA)'
      'join TBTANQUE T ON'
      ' (T.ID_TANQUE = B.ID_TANQUE) '
      'join TBCOMBUSTIVEL C ON'
      ' (C.ID_COMBUSTIVEL = T.ID_COMBUSTIVEL)  '
      ' GROUP BY'
      '    A.DATA,'
      '    A.ID_BOMBA,'
      '    B.ID_TANQUE,'
      '    C.DESCRICAO     '
      'order by'
      '    A.DATA,'
      '    A.ID_BOMBA')
    SQLConnection = conn
    Left = 60
    Top = 185
  end
  object dspRelatorio: TDataSetProvider
    DataSet = qryRelatorio
    Left = 60
    Top = 241
  end
  object cdsRelatorio: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspRelatorio'
    AfterInsert = cdsCombustivelAfterInsert
    BeforeDelete = cdsCombustivelBeforeDelete
    AfterDelete = cdsCombustivelAfterDelete
    Left = 60
    Top = 289
    object cdsRelatorioDATA: TSQLTimeStampField
      FieldName = 'DATA'
      Required = True
    end
    object cdsRelatorioID_TANQUE: TIntegerField
      FieldName = 'ID_TANQUE'
    end
    object cdsRelatorioID_BOMBA: TIntegerField
      FieldName = 'ID_BOMBA'
    end
    object cdsRelatorioDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Required = True
      Size = 50
    end
    object cdsRelatorioQTDE_ABASTECIMENTOS: TIntegerField
      FieldName = 'QTDE_ABASTECIMENTOS'
      Required = True
    end
    object cdsRelatorioQUANTIDADE_LITROS: TFMTBCDField
      FieldName = 'QUANTIDADE_LITROS'
      DisplayFormat = '#,###0.000'
      EditFormat = '#,###0.000'
      Precision = 15
      Size = 6
    end
    object cdsRelatorioVALOR: TFMTBCDField
      FieldName = 'VALOR'
      DisplayFormat = '#,###0.000'
      EditFormat = '#,###0.000'
      Precision = 15
      Size = 6
    end
    object cdsRelatorioVALOR_IMPOSTO: TFMTBCDField
      FieldName = 'VALOR_IMPOSTO'
      EditFormat = '#,###0.000'
      Precision = 15
      Size = 6
    end
    object cdsRelatorioVALOR_PAGO: TFloatField
      FieldName = 'VALOR_PAGO'
      DisplayFormat = '#,###0.000'
      EditFormat = '#,###0.000'
    end
  end
end
