unit TesteWK.View.Busca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls;

type
  TFBusca = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    btnOk: TBitBtn;
    btnCancelar: TBitBtn;
    dsFiltro: TDataSource;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FBusca: TFBusca;

implementation

 uses
TesteWK.DataBase.DataModule ;

{$R *.dfm}

procedure TFBusca.DBGrid1DblClick(Sender: TObject);
begin
    btnOk.Click;
end;

procedure TFBusca.DBGrid1Enter(Sender: TObject);
begin
    btnOk.Click;
end;

procedure TFBusca.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  { Evento onKeyDown do DBGrid  }
  if Key = vk_Return then begin
    { Enter - confirma o valor selecionado }
    btnOk.Click;
  end else if Key = vk_Escape then begin
    { Esc - manda o foco para o Edit }
    btnCancelar.Click;
  end;
end;

procedure TFBusca.FormCreate(Sender: TObject);
begin
    DSFiltro.DataSet := DBMod.Busca;
end;

procedure TFBusca.FormShow(Sender: TObject);
begin
    DBGrid1.SetFocus;
end;

end.
