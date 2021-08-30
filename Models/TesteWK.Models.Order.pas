unit TesteWK.Models.Order;

interface


uses
    Data.DB,
    System.DateUtils,
    TesteWK.Helpers.Funcoes,
    System.Generics.Collections,
    TesteWK.Models.Dao.Order,
    TesteWK.Models.Dao.OrderItem,
    TesteWK.Models.Customer,
    TesteWK.Models.Product;


type

    TOrderItem  = class(TDaoOrderItem)
    private

    public
       constructor Create;     overload;
       constructor Create(AID, AOrder_Code,AProduct_Code: Integer; AQuantity,AValorUnit, AAmount: Currency);   overload;
       destructor Destroy; override;
       function Buscar(Avalor: string): TDaoOrderItem;
       function Gravar: TDaoOrderItem;
       function Deletar: TDaoOrderItem;
       function Carregar(ACode: Integer):   TDaoOrderItem;
    end;

    TOrder = class(TDaoOrder)

    private
    FItems: TList<TOrderItem>;
    FCustomer: TCustomer;
    procedure SetItems(const Value: TList<TOrderItem>);
    procedure SetCustomer(const Value: TCustomer);

    public
        constructor Create;

        destructor Destroy; override;
        property Items: TList<TOrderItem> read FItems write SetItems;
        property Customer: TCustomer read FCustomer write SetCustomer;
        class function New: TOrder;
        function Incluir(AOrderItem: TOrderItem): TOrder;
        function Criar: TOrder;
        function Buscar(Avalor: string): TDaoOrder;
        function Gravar: TDaoOrder;
        function Deletar: TDaoOrder;
        function DeletarItems: TDaoOrder;
        function LimparTabelaTemporaria:  TDaoOrder;
        function Carregar(ACode: Integer):   TDaoOrder;
        function getUltimoPedido: Integer;
        procedure IncluirItem(AOder_code, AProduct_code: Integer; AQuantity,AValorUnit, AAmount: Currency);
    end;



implementation

uses
    TesteWK.DataBase.DataModule, Vcl.StdCtrls, System.SysUtils;

{ TOrder }

function TOrder.Buscar(Avalor: string): TDaoOrder;
var edtDescription, edtCode: TEdit;
    lKey: string;
begin
   Result := nil;
   edtDescription := TEdit.Create(Nil);
   edtCode := TEdit.Create(Nil);
   try
      lKey :=  DBMod.BuscaSimples('O.customer_code,C.Name,O.code,O.issue_date,O.Amount ', ' orders O INNER JOIN customers C ON (O.customer_code = C.code)',
                                    '', 'O.code', 'O.code', 'O.code',
                                   'Busca Pedidos', 'Cod.Cliente;Nome;Pedido;Data;Total', Avalor, TEdit(edtCode), edtCode, 0, 'O.code');
   finally
      edtDescription.Free;
      edtCode.Free;
   end;
   if lKey <> '' then
        Result :=   Carregar(lKey.ToInteger);
end;

function TOrder.Carregar(ACode: Integer): TDaoOrder;
begin
  DBMod.Busca.Sql.Text := 'SELECT * FROM orders';
  DBMod.Busca.Sql.Add(' WHERE code='+ACode.ToString);
  DBmod.Busca.Open;

  if NOT DBMod.Busca.IsEmpty then begin
    with DBMod.Busca do begin
      Code  := FieldByName('Code').AsInteger;
      DataEmissao  := FieldByName('issue_date').AsDateTime;
      Amount  := FieldByName('Amount').AsCurrency;
      Customer_code := FieldByName('Customer_code').AsInteger;
    end;
  end;
  //Carregando Cliente
  if  Customer_code > 0 then begin
     Customer.Carregar(Customer_code);
  end;
  //Carregando Itens
  DBMod.Busca.Sql.Text := 'SELECT * FROM orders_items';
  DBMod.Busca.Sql.Add(' WHERE order_code='+ACode.ToString);
  DBmod.Busca.Open;
  if NOT DBMod.Busca.IsEmpty then begin
    with DBMod.Busca do begin
        First;
        while NOT eof do begin
            Items.Add(
                TOrderItem.Create(
                       FieldByName('ID').AsInteger,
                       FieldByName('Order_Code').AsInteger,
                       FieldByName('Product_code').AsInteger,
                       FieldByName('Quantity').AsCurrency,
                       FieldByName('Value').AsCurrency,
                       FieldByName('Amount').AsCurrency
                    )
                );
            Next;
        end;

    end;
  end;
  Result := Self;
end;

constructor TOrder.Create;
begin
  FItems := TList<TOrderItem>.Create;
  FCustomer := TCustomer.Create;
end;

function TOrder.Criar: TOrder;
begin
  Result := Self
end;

function TOrder.Deletar: TDaoOrder;
var sclause: string;
begin
    if Code > 0 then begin
        sClause :=  'DELETE FROM orders_items WHERE order_code = '+Code.ToString+';'+
                    'DELETE FROM orders WHERE code = '+Code.ToString;
        DBmod.FDConnection1.ExecSQL(sClause);
    end;
   Result := Self;
end;

function TOrder.DeletarItems: TDaoOrder;
var sClause: string;
begin
    if Code > 0 then begin
        sClause := 'DELETE FROM orders_items WHERE order_code = '+Code.ToString;
        DBmod.FDConnection1.ExecSQL(sClause);
    end;

    Result := Self;
end;

destructor TOrder.Destroy;
begin

  inherited;
end;

function TOrder.getUltimoPedido: Integer;
begin

  DBMod.Busca.Sql.Clear;
  DBMod.Busca.Sql.Text := 'SELECT MAX(CODE) ULTPEDIDO FROM orders';
  DBmod.Busca.Open;
  Result := DBmod.Busca.FieldByName('ULTPEDIDO').AsInteger;

end;

function TOrder.Gravar: TDaoOrder;
var sClause: string;
    LOrdem_item: TOrderItem;
begin

    if Code = 0 then begin
        Code := getUltimoPedido;
        Code := Code + 1;
        DataEmissao :=  Now;
    end;
    sClause := ' INSERT INTO orders SET code = '+IntToStr(Code) + ',' +
               '    issue_date =  '+ QuotedStr(FormatDateTime('yyyy-mm-dd', DataEmissao))+   ',' +
               '    customer_code = ' + IntToStr(Customer_Code) +  ',' +
               '    amount = ' + QuotedStr(FloatToSQL(Amount)) +
               ' ON DUPLICATE KEY UPDATE  ' +
               '    issue_date =  '+ QuotedStr(FormatDateTime('yyyy-mm-dd', DataEmissao))+ ',' +
               '    customer_code = ' + IntToStr(Customer_Code) +  ',' +
               '    amount = ' + QuotedStr(FloatToSQL(Amount));
    DBmod.FDConnection1.ExecSQL(sClause);
    DeletarItems();
    for LOrdem_item in items do  begin
        LOrdem_item.Order_code := Code;
        LOrdem_item.Gravar;
    end;
    try
       DBmod.FDConnection1.Commit;
    except
       DBmod.FDConnection1.RollBack;
    end;
    Result := Self;
end;

function TOrder.Incluir(AOrderItem: TOrderItem): TOrder;
begin
   Result := Self;
end;

procedure TOrder.IncluirItem(AOder_code, AProduct_code: Integer; AQuantity,
  AValorUnit, AAmount: Currency);
begin
    Items.Add(
                TOrderItem.Create(
                        0,
                       AOder_code,
                       AProduct_code,
                       AQuantity,
                       AValorUnit,
                       AAmount
                    )
                );
end;

function TOrder.LimparTabelaTemporaria: TDaoOrder;
var sClause: string;
begin
   if Code > 0 then begin
        sClause := 'DELETE FROM draft_order_item WHERE order_code = '+Code.ToString;
        DBmod.FDConnection1.ExecSQL(sClause);
    end;
    Result := Self;
end;

class function TOrder.New: TOrder;
begin
    Result := TOrder.Create;
end;

procedure TOrder.SetCustomer(const Value: TCustomer);
begin
  FCustomer := Value;
end;

procedure TOrder.SetItems(const Value: TList<TOrderItem>);
begin
  FItems := Value;
end;

{ TOrderItem }

function TOrderItem.Buscar(Avalor: string): TDaoOrderItem;
begin
   Result := Self;
end;

function TOrderItem.Carregar(ACode: Integer): TDaoOrderItem;
begin

    Result := Self;

end;

constructor TOrderItem.Create(AID, AOrder_Code, AProduct_Code: Integer;
  AQuantity, AValorUnit, AAmount: Currency);
begin
    Id :=  AID;
    Order_code   :=  AOrder_Code;
    Product_Code := AProduct_Code;
    Quantity     := AQuantity;
    ValorUnit    := AValorUnit;
    Amount       := AAmount;
end;

constructor TOrderItem.Create;
begin

end;

function TOrderItem.Deletar: TDaoOrderItem;
begin
   Result := Self;
end;

destructor TOrderItem.Destroy;
begin

  inherited;
end;

function TOrderItem.Gravar: TDaoOrderItem;
var sClause: string;
begin
    sClause := ' INSERT INTO  orders_items SET '  +
               '    Order_code = '+IntToStr(Order_Code) + ',' +
               '    Product_code =  '+ IntToStr(Product_code) +  ',' +
               '    Value = ' + QuotedStr(FloatToSQL(ValorUnit)) + ',' +
               '    Amount = ' + QuotedStr(FloatToSQL(Amount)) + ',' +
               '    Quantity = ' + QuotedStr(FloatToSQL(Quantity)) +
               ' ON DUPLICATE KEY UPDATE  ' +
               '    Order_code = '+IntToStr(Order_Code) +     ',' +
               '    Product_code =  '+ IntToStr(Product_code) + ',' +
               '    Value = ' + QuotedStr(FloatToSQL(ValorUnit)) + ',' +
               '    Amount = ' + QuotedStr(FloatToSQL(Amount)) +   ',' +
               '    Quantity = ' + QuotedStr(FloatToSQL(Quantity)) ;
    DBmod.FDConnection1.ExecSQL(sClause);
    Result := Self;
end;

end.
