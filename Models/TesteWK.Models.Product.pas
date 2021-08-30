unit TesteWK.Models.Product;

interface

uses TesteWK.Models.Dao.Product;

type

    TProduct = Class(TDaoProduct)
    private

    public
        constructor Create;
        destructor Destroy; override;
        class function New: TProduct;
        function Buscar(Avalor: string): TDaoProduct;
        function Gravar: TDaoProduct;
        function Deletar: TDaoProduct;
        function Carregar(ACode: Integer):   TDaoProduct;
    end;


implementation

uses TesteWK.DataBase.DataModule, Vcl.StdCtrls, System.SysUtils;

{ TProduct }

function TProduct.Buscar(Avalor: string): TDaoProduct;
var edtDescription, edtCode: TEdit;
    lKey: string;
begin
   Result := nil;
   edtDescription := TEdit.Create(Nil);
   edtCode := TEdit.Create(Nil);
   try
      lKey :=  DBMod.BuscaSimples('P.code,P.description,P.price ', ' products P ',
                                    '', 'P.description', 'P.code', 'P.code',
                                   'Busca Cliente', 'Codigo;Descrição;Preço', Avalor, TEdit(edtCode), edtCode, 0, 'P.code');
   finally
      edtDescription.Free;
      edtCode.Free;
   end;
   if lKey <> '' then
        Result :=   Carregar(lKey.ToInteger);

end;

function TProduct.Carregar(ACode: Integer): TDaoProduct;
begin
  DBMod.Busca.Sql.Text := 'SELECT * FROM products';
  DBMod.Busca.Sql.Add(' WHERE code='+ACode.ToString);
  DBmod.Busca.Open;

  if NOT DBMod.Busca.IsEmpty then begin
    with DBMod.Busca do begin
      Code  := FieldByName('Code').AsInteger;
      Description  := FieldByName('Description').AsString;
      Price  := FieldByName('Price').AsCurrency;
    end;

  end;

  Result := Self;
end;

constructor TProduct.Create;
begin

end;

function TProduct.Deletar: TDaoProduct;
begin

end;

destructor TProduct.Destroy;
begin

  inherited;
end;

function TProduct.Gravar: TDaoProduct;
begin

end;

class function TProduct.New: TProduct;
begin
   Result := Self.Create;
end;

end.
