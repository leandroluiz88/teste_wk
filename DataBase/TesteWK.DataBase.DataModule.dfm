object DBMod: TDBMod
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 339
  Width = 659
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    Left = 120
    Top = 40
  end
  object Orders_itemsTable: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM teste_wk.draft_order_item i'
      'INNER JOIN products p'
      'ON (i.product_code = p.code)'
      '')
    Left = 335
    Top = 194
    object Orders_itemsTableID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object Orders_itemsTableorder_code: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'order_code'
      Origin = 'order_code'
    end
    object Orders_itemsTableproduct_code: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'product_code'
      Origin = 'product_code'
    end
    object Orders_itemsTablequantity: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'quantity'
      Origin = 'quantity'
      Precision = 15
    end
    object Orders_itemsTablevalue: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'value'
      Origin = 'value'
      Precision = 15
    end
    object Orders_itemsTableamount: TBCDField
      AutoGenerateValue = arDefault
      FieldName = 'amount'
      Origin = 'amount'
      Precision = 15
    end
    object Orders_itemsTablecode: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'code'
      Origin = 'code'
      ProviderFlags = []
      ReadOnly = True
    end
    object Orders_itemsTabledescription: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'description'
      Origin = 'description'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
  end
  object dsOrders_items: TDataSource
    DataSet = Orders_itemsTable
    Left = 336
    Top = 112
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=teste_wk'
      'User_Name=userwk'
      'Password=wk.2021'
      'Server=10.67.0.11'
      'Port=3302'
      'DriverID=MySQL')
    UpdateOptions.AssignedValues = [uvAutoCommitUpdates]
    UpdateOptions.AutoCommitUpdates = True
    Connected = True
    LoginPrompt = False
    Left = 120
    Top = 184
  end
  object Busca: TFDQuery
    Connection = FDConnection1
    Left = 184
    Top = 248
  end
  object CommandExec: TFDQuery
    Connection = FDConnection1
    Left = 296
    Top = 264
  end
end
