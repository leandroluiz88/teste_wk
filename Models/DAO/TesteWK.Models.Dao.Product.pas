unit TesteWK.Models.Dao.Product;

interface


type

    TDaoProduct = class
    private
    FCode: Integer;
    FPrice: Currency;
    FDescription: string;
    procedure SetCode(const Value: Integer);
    procedure SetDescription(const Value: string);
    procedure SetPrice(const Value: Currency);
    public
        property Code: Integer read FCode write SetCode;
        property Description: string read FDescription write SetDescription;
        property Price: Currency read FPrice write SetPrice;
        function Buscar(Avalor: string): TDaoProduct;  virtual; abstract;
        function Gravar: TDaoProduct;     virtual;   abstract;
        function Deletar: TDaoProduct;     virtual;  abstract;
        function Carregar(ACode: Integer):   TDaoProduct;   virtual; abstract;
    end;

implementation







{ TDaoProduct }

procedure TDaoProduct.SetCode(const Value: Integer);
begin
  FCode := Value;
end;

procedure TDaoProduct.SetDescription(const Value: string);
begin
  FDescription := Value;
end;

procedure TDaoProduct.SetPrice(const Value: Currency);
begin
  FPrice := Value;
end;

end.


