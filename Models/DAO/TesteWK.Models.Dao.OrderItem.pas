unit TesteWK.Models.Dao.OrderItem;


interface


type

    TDaoOrderItem = class

    private
    FValorUnit: Currency;
    FOrder_Code: Integer;
    FID: Integer;
    FAmount: Currency;
    FQuantity: Currency;
    FProduct_Code: Integer;
    procedure SetAmount(const Value: Currency);
    procedure SetID(const Value: Integer);
    procedure SetOrder_Code(const Value: Integer);
    procedure SetProduct_code(const Value: Integer);
    procedure SetQuantity(const Value: Currency);
    procedure SetValorUnit(const Value: Currency);

    public
        property ID: Integer read FID write SetID;
        property Order_Code: Integer read FOrder_Code write SetOrder_Code;
        property Product_code: Integer read FProduct_code write SetProduct_code;
        property Quantity: Currency read FQuantity write SetQuantity;
        property ValorUnit: Currency read FValorUnit write SetValorUnit;
        property Amount: Currency read FAmount write SetAmount;
        function Buscar(Avalor: string): TDaoOrderItem;  virtual; abstract;
        function Gravar: TDaoOrderItem;     virtual;   abstract;
        function Deletar: TDaoOrderItem;     virtual;  abstract;
        function Carregar(ACode: Integer):   TDaoOrderItem;   virtual; abstract;
    end;

implementation

{ TDaoOrderItem }

procedure TDaoOrderItem.SetAmount(const Value: Currency);
begin
  FAmount := Value;
end;

procedure TDaoOrderItem.SetID(const Value: Integer);
begin
  FID := Value;
end;

procedure TDaoOrderItem.SetOrder_Code(const Value: Integer);
begin
  FOrder_Code := Value;
end;

procedure TDaoOrderItem.SetProduct_code(const Value: Integer);
begin
  FProduct_code := Value;
end;

procedure TDaoOrderItem.SetQuantity(const Value: Currency);
begin
  FQuantity := Value;
end;

procedure TDaoOrderItem.SetValorUnit(const Value: Currency);
begin
  FValorUnit := Value;
end;

end.
