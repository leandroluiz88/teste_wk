unit TesteWK.Models.Dao.Customer;

interface


type

    TDaoCustomer = class
    private
    FName: String;
    FCode: Integer;

    FCity: string;
    FFederationState: string;

    procedure SetCity(const Value: string);
    procedure SetCode(const Value: Integer);
    procedure SetName(const Value: String);
    procedure SetFederationState(const Value: string);


    public
        property Code: Integer read FCode write SetCode;
        property Name: String read FName write SetName;
        property City: string read FCity write SetCity;
        property FederationState: string read FFederationState write SetFederationState;
        function Buscar(Avalor: string): TDaoCustomer;  virtual; abstract;
        function Gravar: TDaoCustomer;     virtual;   abstract;
        function Deletar: TDaoCustomer;     virtual;  abstract;
        function Carregar(ACode: Integer):   TDaoCustomer;   virtual; abstract;
    end;

implementation

{ TDaoCustomer }

procedure TDaoCustomer.SetCity(const Value: string);
begin
  FCity := Value;
end;

procedure TDaoCustomer.SetCode(const Value: Integer);
begin
  FCode := Value;
end;



procedure TDaoCustomer.SetFederationState(const Value: string);
begin
  FFederationState := Value;
end;

procedure TDaoCustomer.SetName(const Value: String);
begin
  FName := Value;
end;



end.
