object dataModuleMain: TdataModuleMain
  OldCreateOrder = False
  Height = 342
  Width = 471
  object WaitCursor: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 88
    Top = 64
  end
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=cozimax'
      'User_Name=cozimax'
      'Password=c0z1m@x'
      'Server=localhost'
      'DriverID=MSSQL')
    LoginPrompt = False
    Left = 88
    Top = 8
  end
  object DataSourceCliente: TDataSource
    DataSet = TableCliente
    Left = 240
    Top = 6
  end
  object DataSourceProduto: TDataSource
    DataSet = TableProduto
    Left = 240
    Top = 62
  end
  object DataSourceVenda: TDataSource
    DataSet = TableVenda
    Left = 240
    Top = 118
  end
  object DataSourceVendaItem: TDataSource
    DataSet = TableVendaItem
    Left = 240
    Top = 176
  end
  object TableCliente: TFDTable
    IndexFieldNames = 'id'
    Connection = Conexao
    UpdateOptions.UpdateTableName = 'cliente'
    TableName = 'cliente'
    Left = 376
    Top = 8
    object TableClienteid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object TableClientenome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Required = True
      Size = 50
    end
  end
  object TableProduto: TFDTable
    IndexFieldNames = 'id'
    Connection = Conexao
    UpdateOptions.UpdateTableName = 'produto'
    TableName = 'produto'
    Left = 376
    Top = 64
    object TableProdutoid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object TableProdutodescricao: TStringField
      DisplayWidth = 40
      FieldName = 'descricao'
      Origin = 'descricao'
      Required = True
      Size = 50
    end
    object TableProdutovalor: TFloatField
      DisplayWidth = 30
      FieldName = 'valor'
      Origin = 'valor'
      Required = True
      DisplayFormat = 'R$ #####.##'
    end
  end
  object TableVenda: TFDTable
    BeforeDelete = TableVendaBeforeDelete
    IndexFieldNames = 'id'
    Connection = Conexao
    UpdateOptions.UpdateTableName = 'venda'
    TableName = 'venda'
    Left = 376
    Top = 120
    object TableVendaid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ReadOnly = True
    end
    object TableVendadata: TSQLTimeStampField
      FieldName = 'data'
      Origin = 'data'
      Required = True
      EditMask = '##/##/####;1;_'
    end
    object TableVendaid_cliente: TIntegerField
      FieldName = 'id_cliente'
      Origin = 'id_cliente'
      Required = True
    end
    object TableVendavalor_total: TFloatField
      DefaultExpression = '0'
      FieldName = 'valor_total'
      Origin = 'valor_total'
      Required = True
    end
  end
  object TableVendaItem: TFDTable
    BeforePost = TableVendaItemBeforePost
    AfterPost = TableVendaItemAfterPost
    AfterDelete = TableVendaItemAfterDelete
    IndexFieldNames = 'id_venda'
    MasterSource = DataSourceVenda
    MasterFields = 'id'
    Connection = Conexao
    UpdateOptions.UpdateTableName = 'venda_item'
    TableName = 'venda_item'
    Left = 376
    Top = 176
    object TableVendaItemid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ReadOnly = True
    end
    object TableVendaItemid_venda: TIntegerField
      FieldName = 'id_venda'
      Origin = 'id_venda'
      Required = True
    end
    object TableVendaItemid_produto: TIntegerField
      FieldName = 'id_produto'
      Origin = 'id_produto'
      Required = True
    end
    object TableVendaItemqtde: TIntegerField
      FieldName = 'qtde'
      Origin = 'qtde'
      Required = True
    end
    object TableVendaItemvalor_unitario: TFloatField
      FieldName = 'valor_unitario'
      Origin = 'valor_unitario'
      Required = True
    end
    object TableVendaItemvalor_total: TFloatField
      FieldName = 'valor_total'
      Origin = 'valor_total'
      Required = True
    end
    object TableVendaItemproduto: TStringField
      FieldKind = fkLookup
      FieldName = 'produto'
      LookupDataSet = TableProduto
      LookupKeyFields = 'id'
      LookupResultField = 'descricao'
      KeyFields = 'id_produto'
      Size = 50
      Lookup = True
    end
    object TableVendaItemvalor_unitario_parcial: TFloatField
      FieldKind = fkLookup
      FieldName = 'valor_unitario_parcial'
      LookupDataSet = TableProduto
      LookupKeyFields = 'id'
      LookupResultField = 'valor'
      KeyFields = 'id_produto'
      Lookup = True
    end
  end
  object CommandAtualizaValorTotalVenda: TFDCommand
    Connection = Conexao
    CommandText.Strings = (
      
        'update venda set valor_total = :pValorTotalParcial where id = :p' +
        'IdVenda')
    ParamData = <
      item
        Name = 'pValorTotalParcial'
        DataType = ftFloat
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'pIdVenda'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    Left = 88
    Top = 120
  end
  object QueryValidaProdutoVendaDuplicado: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from venda_item')
    Left = 88
    Top = 176
  end
  object DataSourceSQLVenda: TDataSource
    DataSet = FDSQLQueryVenda
    Left = 240
    Top = 232
  end
  object FDSQLQueryVenda: TFDQuery
    Connection = Conexao
    SQL.Strings = (
      'select * from venda')
    Left = 376
    Top = 232
    ParamData = <
      item
        Name = 'pDataInicial'
        DataType = ftDateTime
        FDDataType = dtDateTime
        ParamType = ptInput
      end
      item
        Name = 'pDataFinal'
        DataType = ftDateTime
        FDDataType = dtDateTime
        ParamType = ptInput
      end>
    object FDSQLQueryVendaid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDSQLQueryVendadata: TSQLTimeStampField
      FieldName = 'data'
      Origin = 'data'
      Required = True
    end
    object FDSQLQueryVendaid_cliente: TIntegerField
      FieldName = 'id_cliente'
      Origin = 'id_cliente'
      Required = True
    end
    object FDSQLQueryVendavalor_total: TFloatField
      FieldName = 'valor_total'
      Origin = 'valor_total'
      Required = True
    end
    object FDSQLQueryVendacliente: TStringField
      FieldKind = fkLookup
      FieldName = 'cliente'
      LookupDataSet = TableCliente
      LookupKeyFields = 'id'
      LookupResultField = 'nome'
      KeyFields = 'id_cliente'
      Lookup = True
    end
  end
  object FDSQLQueryVendaItem: TFDQuery
    IndexFieldNames = 'id_venda'
    MasterSource = DataSourceSQLVenda
    MasterFields = 'id'
    Connection = Conexao
    SQL.Strings = (
      'select * from venda_item')
    Left = 376
    Top = 288
    object FDSQLQueryVendaItemid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDSQLQueryVendaItemid_venda: TIntegerField
      FieldName = 'id_venda'
      Origin = 'id_venda'
      Required = True
    end
    object FDSQLQueryVendaItemid_produto: TIntegerField
      FieldName = 'id_produto'
      Origin = 'id_produto'
      Required = True
    end
    object FDSQLQueryVendaItemqtde: TIntegerField
      FieldName = 'qtde'
      Origin = 'qtde'
      Required = True
    end
    object FDSQLQueryVendaItemvalor_unitario: TFloatField
      FieldName = 'valor_unitario'
      Origin = 'valor_unitario'
      Required = True
    end
    object FDSQLQueryVendaItemvalor_total: TFloatField
      FieldName = 'valor_total'
      Origin = 'valor_total'
      Required = True
    end
    object FDSQLQueryVendaItemproduto: TStringField
      FieldKind = fkLookup
      FieldName = 'produto'
      LookupDataSet = TableProduto
      LookupKeyFields = 'id'
      LookupResultField = 'descricao'
      KeyFields = 'id_produto'
      Lookup = True
    end
  end
  object DataSourceSQLVendaItem: TDataSource
    DataSet = FDSQLQueryVendaItem
    Left = 240
    Top = 288
  end
end
