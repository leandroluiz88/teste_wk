unit TesteWK.DataBase.DataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, Vcl.Forms, Vcl.StdCtrls, System.StrUtils, System.DateUtils, vcl.Controls,
  FireDAC.Phys.SQLiteVDataSet;

type
  TDBMod = class(TDataModule)
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink;
    Orders_itemsTable: TFDQuery;
    dsOrders_items: TDataSource;
    FDConnection1: TFDConnection;
    Orders_itemsTableID: TFDAutoIncField;
    Orders_itemsTableorder_code: TIntegerField;
    Orders_itemsTableproduct_code: TIntegerField;
    Orders_itemsTablequantity: TBCDField;
    Orders_itemsTablevalue: TBCDField;
    Orders_itemsTableamount: TBCDField;
    Busca: TFDQuery;
    Orders_itemsTablecode: TIntegerField;
    CommandExec: TFDQuery;
    Orders_itemsTabledescription: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function RetiraAlias(psCampo: string): string;
    function BuscaSimples(pCampos,pTabelas,pWhere,pCampoDes,pCampoCod,pCampoID,
                pTitulo,pTituloColunas,pValor:String;pEdit,pEditId:TEdit;pTamanhoColuna:Integer;pCampoDescAlternativo : string = '';pCampoCodAlternativo : string = '') : string;
    procedure CriarTabelaTemporaria;
  end;

var
  DBMod: TDBMod;

implementation

uses TesteWK.Helpers.Funcoes, TesteWK.View.Busca, DBGrids;

{$R *.dfm}

{ TDBMod }



{ TDBMod }

function TDBMod.BuscaSimples(pCampos, pTabelas, pWhere, pCampoDes, pCampoCod,
  pCampoID, pTitulo, pTituloColunas, pValor: String; pEdit, pEditId: TEdit;
  pTamanhoColuna: Integer; pCampoDescAlternativo,
  pCampoCodAlternativo: string): string;
var xValorStr,xCodigo,xID:string;
    xQtdeReg,nTamTitulo,nCol:integer;
    sTitulo:string;
    sCampo : string;
    iNum: Integer;
begin
  xCodigo := '0';
  xQtdeReg := 0;
  xValorStr := '';

  if (Trim(PWHERE)<>'') then begin
    PWHERE := PWHERE + ' AND ';
  end;

  if (Not TryStrToInt(pValor,iNum)) AND (pTamanhoColuna=0) then begin
    if Pos('*', pValor) = 0 then begin
      pValor := '%' + pValor + '%';
    end else begin
      pValor := AnsiReplaceText(pValor,'*','%');
    end;


    Busca.Close;

    Busca.SQL.Text := '';
    Busca.SQL.Text := ('select '+PCAMPOS+' FROM '+PTABELAS+' WHERE '+PWHERE+' (UPPER('+PCAMPODES+') LIKE :PVALOR)'+'ORDER BY '+PCAMPODES+' ');

    Busca.Params.ParamByName('PVALOR').AsString := PVALOR;
    Busca.Open;
  end else begin
    Busca.Close;



    if Busca.Active then begin
       Busca.Close;
    end;

    Busca.SQL.Text := '';
    if pCampoCodAlternativo <> '' then begin
        Busca.SQL.Text := ('SELECT '+PCAMPOS+' FROM '+PTABELAS+' WHERE '+PWHERE+' ('+pCampoCodAlternativo+'REGEXP'''+PVALOR+''') ');
    end else begin
      Busca.SQL.Text := ('SELECT '+PCAMPOS+' FROM '+PTABELAS+' WHERE '+PWHERE+' ('+PCAMPOCOD+'='''+PVALOR+''') ');
    end;
    Busca.Open;
  end;

  {.. Resolvendo problema de ambiguidade ..}
  if Pos('.', pCampoCod) > 0 then begin
    sCampo := Trim(Copy(pCampoCod, Pos('.', pCampoCod)+1, Length(pCampoCod)));
  end else begin
    sCampo := pCampoCod;
  end;

  with Busca do begin
    xQtdeReg := RecordCount;
    if (xQtdeReg <= 1) then begin
      // Apenas um registro encontrado ...

      xCodigo   := FieldByName(RetiraAlias(sCampo)).AsString;
      if Trim(pCampoDescAlternativo) = '' then begin
        xValorStr := FieldByName(RetiraAlias(pCampoDes)).AsString;
      end else begin
        xValorStr := FieldByName(RetiraAlias(pCampoDescAlternativo)).AsString;
      end;
      if Trim(pCampoID) <> '' then begin
        xID := FieldByName(RetiraAlias(PCampoId)).AsString;
      end;
    end else begin
      // Mais de um registro abrir o Form para seleção
      First;
      FBusca := TFBusca.Create(nil);
      FBusca.Caption := pTitulo;
      if Trim(pTituloColunas) <> '' then begin
        FBusca.DBGrid1.Options := [dgTitles,dgColumnResize,dgColLines,dgRowLines,dgRowSelect,dgAlwaysShowSelection];
        nTamTitulo := 1;
        nCol := 0;
        sTitulo := '';
        while nTamTitulo <= Length(pTituloColunas) do begin
          if Copy(pTituloColunas,nTamTitulo,1) = ';' then begin
            FBusca.DBGrid1.Columns.Items[nCol].Title.Caption := sTitulo;
            sTitulo := '';
            nCol := nCol + 1;
          end else begin
            sTitulo := sTitulo + Copy(pTituloColunas,nTamTitulo,1);
            FBusca.DBGrid1.Columns.Items[nCol].Title.Caption := sTitulo;
          end;
          nTamTitulo := nTamTitulo + 1;
        end;
      end;
      try
        if FBusca.ShowModal = mrOK  then begin
          xCodigo   := FieldByName(RetiraAlias(sCampo)).AsString;
          if Trim(pCampoDescAlternativo) = '' then begin
            xValorStr := FieldByName(RetiraAlias(pCampoDes)).AsString;
          end else begin
            xValorStr := FieldByName(RetiraAlias(pCampoDescAlternativo)).AsString;
          end;
          if Trim(pCampoID) <> '' then begin
            xID := FieldByName(RetiraAlias(PCampoId)).AsString;
          end;
        end;
      finally
        FBusca.Free;
      end;
    end;
    Close;
//      pEditId.Text := CODIGO;
    if Trim(pCampoID) <> '' then begin
      pEditId.Text := xID;
    end;
  end;
  result := xValorStr;


end;

procedure TDBMod.CriarTabelaTemporaria;
Var
  Clause : String;
Begin
  Clause:= 'DROP TABLE IF EXISTS draft_order_item; '
 // Clause:= ' '

         + 'CREATE TEMPORARY TABLE  draft_order_item ( '
         + '`ID` int(11) NOT NULL AUTO_INCREMENT, '
         + '`product_code` int(11) DEFAULT 0, '
         + '`order_code` int(11) DEFAULT 0, '
         + '`quantity` decimal(15,4) DEFAULT ''0.0000'', '
         + '`value` decimal(15,4) DEFAULT ''0.0000'', '
         + '`amount` decimal(15,4) DEFAULT ''0.0000'','
         + 'PRIMARY KEY (ID) )';
  FDConnection1.Connected := False;
  FDConnection1.Connected := True;
  CommandExec.Close;
  CommandExec.SQL.Clear;
  CommandExec.SQL.Text:= Clause;
  CommandExec.ExecSQL(True);
  Orders_itemsTable.Close;
  Orders_itemsTable.Open;
end;

procedure TDBMod.DataModuleCreate(Sender: TObject);
begin
    CriarTabelaTemporaria;
end;

function TDBMod.RetiraAlias(psCampo: string): string;
var sResult : string;
begin
  if Pos('.', psCampo) > 0 then begin
    sResult := Copy(psCampo, Pos('.', psCampo)+1, Length(psCampo));
  end else begin
    sResult := psCampo;
  end;
  Result := Trim(sResult);
end;

end.
