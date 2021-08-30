unit TesteWk.Controllers.Order;




interface

uses  TesteWK.Models.Order, Vcl.StdCtrls, Sysutils, StrUtils;

type

    TControllerOrder = class
    private
    FModelo: TOrder;
    procedure SetModelo(const Value: TOrder);

    public
       property Modelo: TOrder read FModelo write SetModelo;
       constructor Create;
       destructor Destroy; override;
       class function New: TControllerOrder;
       function Buscar(AValor: String):  TControllerOrder;


    end;

implementation

{ TControllerOrder }

function TControllerOrder.Buscar(AValor: String): TControllerOrder;
begin
  Result := Self;
  FModelo.Buscar(AValor);
end;

constructor TControllerOrder.Create;
begin
  FModelo := TOrder.New;
end;

destructor TControllerOrder.Destroy;
begin

  inherited;
end;

class function TControllerOrder.New: TControllerOrder;
begin
   Result := Self.Create;
end;


procedure TControllerOrder.SetModelo(const Value: TOrder);
begin
  FModelo := Value;
end;

end.


