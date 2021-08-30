unit TesteWK.Models.Customer;


interface


uses TesteWk.Models.DAO.Customer;

type

    TCustomer = class(TDaoCustomer)
    private

    public
       constructor Create;
       destructor Destroy; override;

       class function New: TCustomer;
       function Buscar(Avalor: string): TDaoCustomer;
       function Gravar: TDaoCustomer;
       function Deletar: TDaoCustomer;
       function Carregar(ACode: Integer):   TDaoCustomer;
    end;



implementation

uses TesteWK.DataBase.DataModule, StrUtils ,SysUtils, Vcl.StdCtrls;

{ TCustomer }

function TCustomer.Buscar(Avalor: string): TDaoCustomer;
var edtName, edtCodeCliente: TEdit;
    lCodeCli: string;
begin
   Result := nil;
   edtName := TEdit.Create(Nil);
   edtCodeCliente := TEdit.Create(Nil);
   try
      lCodeCli :=  DBMod.BuscaSimples('C.code,C.name,C.city,C.State  ', ' customers C ',
                                   ' ', 'C.name', 'C.Code', 'C.Code',
                                   'Busca Cliente', 'Codigo;Nome;Cidade;Estado', Avalor, TEdit(edtCodeCliente), edtCodeCliente, 0, 'C.code');
   finally
      edtName.Free;
      edtCodeCliente.Free;
   end;
   if lCodeCli <> '' then
        Result :=   Carregar(LCodeCli.ToInteger);
end;

function TCustomer.Carregar(ACode: Integer): TDaoCustomer;
begin
  DBMod.Busca.Sql.Text := 'SELECT * FROM customers';
  DBMod.Busca.Sql.Add(' WHERE code='+InttoStr(ACode));
  DBmod.Busca.Open;

  if NOT DBMod.Busca.IsEmpty then begin
    with DBMod.Busca do begin
      Code  := FieldByName('Code').AsInteger;
      Self.Name  := FieldByName('Name').AsString;
      City  := FieldByName('City').AsString;
      FederationState :=   FieldByName('State').AsString;
    end;

  end;

  Result := Self;

end;

constructor TCustomer.Create;
begin

end;

function TCustomer.Deletar: TDaoCustomer;
begin
  Result := Self;
end;

destructor TCustomer.Destroy;
begin

  inherited;
end;

function TCustomer.Gravar: TDaoCustomer;
begin
  Result := Self;
end;

class function TCustomer.New: TCustomer;
begin
  Result := Self.Create;
end;

end.
