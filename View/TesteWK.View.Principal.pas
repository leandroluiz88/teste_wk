unit TesteWK.View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.WinXCtrls, System.ImageList,
  Vcl.ImgList,
  TesteWK.Controllers.Customer,
  TesteWK.Controllers.Product,
  TesteWK.Controllers.Order;

type
  TForm6 = class(TForm)
    pnlCliente: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    Panel5: TPanel;
    ImageList1: TImageList;
    GroupBox1: TGroupBox;
    edtName: TButtonedEdit;
    GroupBox2: TGroupBox;
    edtCodCliente: TEdit;
    edtCity: TEdit;
    edtState: TEdit;
    edtProduto: TButtonedEdit;
    edtCodProd: TEdit;
    btnIncluir: TButton;
    btnLerPedido: TButton;
    btnCancelarPedido: TButton;
    edtQuantity: TEdit;
    edtValorUnit: TEdit;
    Label1: TLabel;
    LTotPedido: TLabel;
    Label3: TLabel;
    Button1: TButton;
    edtNumOrder: TEdit;
    lbkpCliente: TLabel;
    procedure edtNameKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure edtProdutoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnIncluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edtQuantityKeyPress(Sender: TObject; var Key: Char);
    procedure edtValorUnitKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnLerPedidoClick(Sender: TObject);
    procedure btnCancelarPedidoClick(Sender: TObject);
  private
    { Private declarations }
    FEditou   : Boolean;
    FCustomer: TControllerCustomer;
    FProduct: TControllerProduct;
    FOrder: TControllerOrder;
    procedure LimparControles(ATag: Integer);
    procedure LimparDadosGrid;
    procedure Totalizar;
    procedure Incluir(ACode_Order, AProduct_Code: Integer;  AQuantity, AValorUnit, AAMount: Currency);
  public
    { Public declarations }

  end;

var
  Form6: TForm6;

implementation

uses
    TesteWK.DataBase.DataModule, TesteWK.Helpers.Funcoes;

{$R *.dfm}

procedure TForm6.btnCancelarPedidoClick(Sender: TObject);
begin
   FOrder :=   TControllerOrder.New.Buscar('');
    if  FOrder.Modelo.code = 0 then begin
       MsgAviso('Pedido não encontrado ou não existem pedidos para serem excluidos!');
       Exit;
    end;
    if NOT MsgConfB('Deseja realmente Excluir esse Pedido?', mbOK) then begin
            Exit;
    end;
    FOrder.Modelo.Deletar;
    MsgAviso('Pedido '+FOrder.Modelo.code.ToString+' excluído com sucesso!');
end;

procedure TForm6.btnIncluirClick(Sender: TObject);
begin
//
    if edtCodCliente.Text = '' then begin
        MsgAviso('O Campo de Código de Cliente não pode estar vazio!');
        edtCodCliente.setFocus;
        Exit;
    end;
    if StrToInt(edtCodCliente.text) <= 0 then begin
        MsgAviso('Código de Cliente Inválido!');
        edtCodCliente.setFocus;
        Exit;
    end;
    if edtCodProd.Text = '' then begin
        MsgAviso('O Campo de Código do Produto não pode estar vazio!');
        EdtProduto.setFocus;
        Exit;
    end;
    if edtQuantity.text = '' then begin
        MsgAviso('O Campo de Quantidade não pode estar vazio!');
        edtQuantity.setFocus;
        Exit;
    end;
    if StrToInt(edtQuantity.text) <= 0 then begin
        MsgAviso('O Campo de Quantidade não pode estar menor ou igual 0!');
        edtQuantity.setFocus;
        Exit;
    end;
    Incluir(StrToInt(edtNumOrder.Text),
                    StrToint(edtCodProd.text),
                    StrToCurr(edtQuantity.text),
                    StrToCurr(edtValorUnit.text),0);
    Totalizar;
    LimparControles(10);
    DBGrid1.DataSource.DataSet.refresh;
    edtProduto.setFocus;
end;

procedure TForm6.btnLerPedidoClick(Sender: TObject);
var iIndex: Integer;
begin
    FOrder :=   TControllerOrder.New.Buscar('');
    if  FOrder.Modelo.code = 0 then begin
       MsgAviso('Pedido não encontrado ou não existem pedidos a serem listados!');
    end;
    FCustomer :=  TControllerCustomer.New;
    FCustomer.Modelo :=  FOrder.Modelo.Customer;
    FCustomer.PreencherEditName(TEdit(EdtName))
             .PreencherEditCode(edtCodCliente)
             .PreencherEditCity(edtCity)
             .PreencherEditState(edtState);

    edtNumOrder.text := FOrder.Modelo.code.TOString;
    for iIndex := 0 to Pred(FOrder.Modelo.Items.Count) do  begin
        Incluir(FOrder.Modelo.Items[iIndex].Order_code,
                FOrder.Modelo.Items[iIndex].Product_code,
                FOrder.Modelo.Items[iIndex].Quantity,
                FOrder.Modelo.Items[iIndex].ValorUnit,
                FOrder.Modelo.Items[iIndex].Amount);
        btnLerPedido.Visible := False;
        btnCancelarPedido.Visible := False;
        lbkpCliente.Caption :=  EdtName.Text;
    end;
    DBGrid1.DataSource.DataSet.refresh;




end;

procedure TForm6.Button1Click(Sender: TObject);
begin
   if edtCodCliente.Text = '' then begin
        MsgAviso('O Campo de Código de Cliente não pode estar vazio!');
        edtCodCliente.setFocus;
        Exit;
    end;
    if StrToInt(edtCodCliente.text) <= 0 then begin
        MsgAviso('Código de Cliente Inválido!');
        edtCodCliente.setFocus;
        Exit;
    end;
    if DBGrid1.DataSource.Dataset.IsEmpty  then begin
       MsgAviso('Pedido Vazio, favor incluir pelo menos um item no pedido!');
       Exit;
    end;

   FOrder := TControllerOrder.New;
   try
        Forder.Modelo.Code := DBGrid1.DataSource.Dataset.FieldByName('order_code').AsInteger;
        Forder.Modelo.Customer_code := StrToInt(edtCodCliente.text);
        Forder.Modelo.Amount := 0;
        with DBGrid1.DataSource.Dataset do begin
           First;
           while NOT EOF DO begin

             Forder.Modelo.IncluirItem(
                    FieldByName('order_code').AsInteger,
                    FieldByName('product_code').AsInteger,
                    FieldByName('quantity').AsCurrency,
                    FieldByName('value').AsCurrency,
                    FieldByName('amount').AsCurrency

             );
             Forder.Modelo.Amount := Forder.Modelo.Amount +
                                     FieldByName('amount').AsCurrency;
             Next;
           end;
        end;
        Forder.Modelo.Gravar;
        Forder.Modelo.LimparTabelaTemporaria;
        MsgInfo('Pedido '+Forder.Modelo.Code.ToString+' gravado com sucesso!' + c13 +
                'Detalhes ' + c13   +
                'Cliente: ' + edtName.text +   c13 +
                'Total:  ' + LTotPedido.Caption
                );
        LimparDadosGrid;
        LimparControles(0);

   finally
     Forder.Free;
   end;
   btnLerPedido.Visible := True;
   btnCancelarPedido.Visible := True;
end;

procedure TForm6.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_DELETE then begin
       if MsgConfB('Deseja Excluir esse Produto do Pedido?', mbOK ) then begin
            with DBGrid1.DataSource.Dataset do begin
              Edit;
              Delete;
            end;

       end;
       Totalizar;
  end;
  if Key = 13 then begin
        with DBGrid1.DataSource.Dataset do begin
            edtProduto.Text := FieldByName('description').AsString;
            edtCodProd.Text :=  FieldByName('product_code').AsString;
            edtNumOrder.Text :=   FieldByName('order_code').AsString;
            edtValorUnit.text :=   FieldByName('Value').ASstring;
            edtQuantity.text :=  FieldByName('Quantity').AsString;
            FEditou := True;
            edtQuantity.setFocus;
            edtQuantity.SelectAll;
        end;
  end;
end;

procedure TForm6.edtNameKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);

begin

    If (Key = 13) then begin

        btnLerPedido.Visible := False;
        btnCancelarPedido.Visible := False;
        If EdtName.Text <> '' then begin
            FCustomer := TControllerCustomer
                                .New
                                .Buscar(EdtName.Text)
                                .PreencherEditName(TEdit(EdtName))
                                .PreencherEditCode(edtCodCliente)
                                .PreencherEditCity(edtCity)
                                .PreencherEditState(edtState);
          //  btnIncluir.Visible := True;
            lbkpCliente.Caption :=  EdtName.Text;
        end else begin
            if dbgrid1.DataSource.DataSet.isEmpty then begin
               LimparControles(1);
               btnLerPedido.Visible := True;
               btnCancelarPedido.Visible := True;
            end else begin
               MsgAviso('Não foi possivel habilitar os Botoes de Ler e Cancelar Pedidos, pois existem items lançados!');
               EdtName.Text := lbkpCliente.Caption;
            end;


       //     btnIncluir.Visible := False;
        end;

    end;

end;

procedure TForm6.edtProdutoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    If (Key = 13) then begin
        If EdtProduto.Text <> '' then begin
            FProduct := TControllerProduct
                                .New
                                .Buscar(EdtProduto.Text)
                                .PreencherEditDescription(TEdit(EdtProduto))
                                .PreencherEditCode(TEdit(edtCodProd))
                                .PreencherEditPrice(TEdit(edtValorUnit));
        end;
    end;
end;

procedure TForm6.edtQuantityKeyPress(Sender: TObject; var Key: Char);
begin
  // FormatarComoMoeda(TEdit(Sender),Key);
end;



procedure TForm6.edtValorUnitKeyPress(Sender: TObject; var Key: Char);
begin
   //FormatarComoMoeda(TEdit(Sender),Key);
end;

procedure TForm6.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FProduct.Free;
  FCustomer.Free;

end;

procedure TForm6.FormCreate(Sender: TObject);
begin
    FEditou := False;
end;

procedure TForm6.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then begin
        Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TForm6.Incluir(ACode_Order, AProduct_Code: Integer; AQuantity,
  AValorUnit, AAMount: Currency);
begin

  with DBGrid1.DataSource.Dataset do begin
        if FEditou then
            Edit
        else
            Append;
        FieldByName('product_code').AsString :=  AProduct_Code.ToString;
        FieldByName('quantity').AsCurrency :=  AQuantity;
        FieldByName('order_code').AsInteger:=  ACode_Order;
        FieldByName('Value').AsCurrency :=  AValorUnit;
        if AAMount = 0 then
           FieldByName('Amount').AsCurrency :=   FieldByName('quantity').AsCurrency *  FieldByName('Value').AsCurrency
        else
           FieldByName('Amount').AsCurrency :=    AAMount;
        Post;

  end;
  Totalizar;

  LimparControles(10);
end;

procedure TForm6.LimparControles(ATag: Integer);
var iIndex: Integer;
begin
    for iIndex := 0 to ComponentCount -1 do begin
        if (Components[iIndex] is TEdit) OR (Components[iIndex] is TButtonedEdit) then begin
           if (TEdit(Components[iIndex]).Tag = ATag) OR (ATag = 0) then begin
              TEdit(Components[iIndex]).Text := '';
           end;
           if ((ATag = 3) OR (ATag = 0))
                AND (TEdit(Components[iIndex]).Name = 'edtNumOrder') then begin
              TEdit(Components[iIndex]).Text := '0';
           end;
        end;
    end;

end;

procedure TForm6.LimparDadosGrid;
begin
  DBmod.FDConnection1.Close;
  DBmod.FDConnection1.Open;
  DBMod.CriarTabelaTemporaria;
  edtNumOrder.Text := '0';
  LTotPedido.Caption := 'R$ 0,00';
end;

procedure TForm6.Totalizar;
var CTotalPedido: Currency;
begin

   with DBGrid1.DataSource.Dataset do begin
        first;
        CTotalPedido := 0;
        while NOT eof do begin
           CTotalPedido := CTotalPedido +  fieldByName('Amount').AsCurrency;
           Next;
        end;
    end;
    LTotPedido.Caption := FormatFloat( 'R$ ###,##0.00', CTotalPedido);
    FEditou := False;
end;

end.
