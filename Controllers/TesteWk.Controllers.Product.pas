unit TesteWk.Controllers.Product;

interface

uses  TesteWK.Models.Product, Vcl.StdCtrls, Sysutils, StrUtils;

type

    TControllerProduct = class
    private
    FModelo: TProduct;
    procedure SetModelo(const Value: TProduct);

    public
       property Modelo: TProduct read FModelo write SetModelo;
       constructor Create;
       destructor Destroy; override;
       class function New: TControllerProduct;
       function Buscar(AValor: String):  TControllerProduct;
       function PreencherEditDescription(AValor: TEdit): TControllerProduct;
       function PreencherEditCode(AValor: TEdit): TControllerProduct;
       function PreencherEditPrice(AValor: TEdit): TControllerProduct;

    end;

implementation

{ TControllerCustomer }

function TControllerProduct.Buscar(AValor: String): TControllerProduct;
begin
  Result := Self;
  FModelo.Buscar(AValor);
end;

constructor TControllerProduct.Create;
begin
  FModelo := TProduct.New;
end;

destructor TControllerProduct.Destroy;
begin

  inherited;
end;

class function TControllerProduct.New: TControllerProduct;
begin
   Result := Self.Create;
end;



function TControllerProduct.PreencherEditDescription(
  AValor: TEdit): TControllerProduct;
begin
  Result := Self;
  AValor.Text := FModelo.Description;
end;

function TControllerProduct.PreencherEditPrice(AValor: TEdit): TControllerProduct;
begin
  Result := Self;
  AValor.Text := CurrToStr(FModelo.Price);
end;

function TControllerProduct.PreencherEditCode(
  AValor: TEdit): TControllerProduct;
begin
  Result := Self;
  AValor.Text := FModelo.Code.toString;
end;



procedure TControllerProduct.SetModelo(const Value: TProduct);
begin
  FModelo := Value;
end;

end.
