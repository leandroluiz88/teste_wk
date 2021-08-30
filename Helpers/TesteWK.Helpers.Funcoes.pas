unit TesteWK.Helpers.Funcoes;

interface

uses Vcl.Dialogs, Vcl.Controls, System.SysUtils, System.StrUtils, System.DateUtils, System.Math,
  Winapi.Windows, Winapi.Messages, Tlhelp32, System.Hash, Vcl.Forms, Data.DB, Vcl.StdCtrls;

Procedure FormatarComoMoeda( Componente : TObject; var Key: Char );

procedure MsgInfo(const Frase: string);
procedure MsgAviso(const Frase: string);

procedure MsgErro(const Frase: string);
function MsgConf(const Frase: string): Boolean;
function MsgConfB(const Frase: string; Botao: TMsgDlgBtn): Boolean;
function FloatToSQL(pcValor :Currency) :string;


const
    c13 = #13#10;

implementation

procedure FormatarComoMoeda(Componente: TObject; var Key: Char);
var
   str_valor  : String;
   dbl_valor  : double;
begin

   if Componente is TEdit then begin
      if ( Key in ['0'..'9', #8, #9] ) then begin
         { guarda valor do TEdit com que vamos trabalhar }
         str_valor := TEdit( Componente ).Text ;
         { verificando se nao esta vazio }
         if str_valor = EmptyStr THEN str_valor := '0,00' ;
         { se valor numerico ja insere na string temporaria }
         if Key in ['0'..'9'] THEN str_valor := Concat( str_valor, Key ) ;
         { retira pontos e virgulas se tiver! }
         str_valor := Trim( StringReplace( str_valor, '.', '', [rfReplaceAll, rfIgnoreCase] ) ) ;
         str_valor := Trim( StringReplace( str_valor, ',', '', [rfReplaceAll, rfIgnoreCase] ) ) ;
         {inserindo 2 casas decimais}
         dbl_valor := StrToFloat( str_valor ) ;
         dbl_valor := ( dbl_valor / 100 ) ;

         {reseta posicao do tedit}
         TEdit( Componente ).SelStart := Length( TEdit( Componente ).Text );
         {retornando valor tratado ao TEdit}
         TEdit( Componente ).Text := FormatFloat( '###,##0.00', dbl_valor ) ;
      end;
      {se nao e' key relevante entao reseta}
      if NOT( Key in [#8, #9] ) then key := #0;
   end;
end;

procedure MsgInfo(const Frase: string);
begin
  MessageDlg(Frase, mtInformation, [mbOk], 0);
end;

procedure MsgAviso(const Frase: string);
begin
  MessageDlg(Frase, mtWarning, [mbOk], 0);
end;

procedure MsgErro(const Frase: string);
begin
  MessageDlg(Frase, mtError, [mbOk], 0);
end;

function MsgConf(const Frase: string): Boolean;
begin
  Result := MessageDlg(Frase, mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes;
end;

function MsgConfB(const Frase: string; Botao: TMsgDlgBtn): Boolean;
begin
  Result := MessageDlg(Frase, mtConfirmation, [mbYes, mbNo], 0, Botao) = mrYes;
end;


function FloatToSQL(pcValor :Currency) :string;
begin
  Result := CurrToStr(pcValor);
  Result := StringReplace(Result, '.', '', [rfReplaceAll]);
  Result := StringReplace(Result, ',', '.', [rfReplaceAll]);
end;

end.
