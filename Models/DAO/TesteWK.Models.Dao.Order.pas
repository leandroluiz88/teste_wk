unit TesteWK.Models.Dao.Order;

interface



type

    TDaoOrder = class

    private
    FCode: Integer;
    FAmount: Currency;
    FDataEmissao: TDate;
    Fcustomer_code: Integer;
    procedure SetAmount(const Value: Currency);
    procedure SetCode(const Value: Integer);
    procedure SetDataEmissao(const Value: TDate);
    procedure Setcustomer_code(const Value: Integer);

    public
        property Code: Integer read FCode write SetCode;
        property DataEmissao: TDate read FDataEmissao write SetDataEmissao;
        property Amount: Currency read FAmount write SetAmount;
        property customer_code: Integer read Fcustomer_code write Setcustomer_code;

        function Buscar(Avalor: string): TDaoOrder;  virtual; abstract;
        function Gravar: TDaoOrder;     virtual;   abstract;
        function Deletar: TDaoOrder;     virtual;  abstract;
        function Carregar(ACode: Integer):   TDaoOrder;   virtual; abstract;
    end;

implementation

{ TDaoOrder }

procedure TDaoOrder.SetAmount(const Value: Currency);
begin
  FAmount := Value;
end;

procedure TDaoOrder.SetCode(const Value: Integer);
begin
  FCode := Value;
end;

procedure TDaoOrder.Setcustomer_code(const Value: Integer);
begin
  Fcustomer_code := Value;
end;

procedure TDaoOrder.SetDataEmissao(const Value: TDate);
begin
  FDataEmissao := Value;
end;

end.
