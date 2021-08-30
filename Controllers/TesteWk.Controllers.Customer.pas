unit TesteWk.Controllers.Customer;

interface

uses  TesteWK.Models.Customer, Vcl.StdCtrls, Sysutils, StrUtils;

type

    TControllerCustomer = class
    private
    FModelo: TCustomer;
    procedure SetModelo(const Value: TCustomer);

    public
       property Modelo: TCustomer read FModelo write SetModelo;
       constructor Create;
       destructor Destroy; override;
       class function New: TControllerCustomer;
       function Buscar(AValor: String):  TControllerCustomer;
       function PreencherEditName(AValor: TEdit): TControllerCustomer;
       function PreencherEditCode(AValor: TEdit): TControllerCustomer;
       function PreencherEditCity(AValor: TEdit): TControllerCustomer;
       function PreencherEditState(AValor: TEdit): TControllerCustomer;

    end;

implementation

{ TControllerCustomer }

function TControllerCustomer.Buscar(AValor: String): TControllerCustomer;
begin
  Result := Self;
  FModelo.Buscar(AValor);
end;

constructor TControllerCustomer.Create;
begin
  FModelo := TCustomer.New;
end;

destructor TControllerCustomer.Destroy;
begin

  inherited;
end;

class function TControllerCustomer.New: TControllerCustomer;
begin
   Result := Self.Create;
end;

function TControllerCustomer.PreencherEditCity(
  AValor: TEdit): TControllerCustomer;
begin
  Result := Self;
  AValor.Text := FModelo.City;

end;

function TControllerCustomer.PreencherEditName(
  AValor: TEdit): TControllerCustomer;
begin
  Result := Self;
  AValor.Text := FModelo.Name;
end;

function TControllerCustomer.PreencherEditCode(
  AValor: TEdit): TControllerCustomer;
begin
  Result := Self;
  AValor.Text := FModelo.Code.toString;
end;

function TControllerCustomer.PreencherEditState(
  AValor: TEdit): TControllerCustomer;
begin
  Result := Self;
  AValor.Text := FModelo.FederationState;
end;

procedure TControllerCustomer.SetModelo(const Value: TCustomer);
begin
  FModelo := Value;
end;

end.
