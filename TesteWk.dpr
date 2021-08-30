program TesteWk;

uses
  Vcl.Forms,
  TesteWK.View.Principal in 'View\TesteWK.View.Principal.pas' {Form6},
  TesteWK.DataBase.DataModule in 'DataBase\TesteWK.DataBase.DataModule.pas' {DBMod: TDataModule},
  TesteWK.Helpers.Funcoes in 'Helpers\TesteWK.Helpers.Funcoes.pas',
  TesteWK.View.Busca in 'View\TesteWK.View.Busca.pas' {FBusca},
  TesteWK.Models.Customer in 'Models\TesteWK.Models.Customer.pas',
  TesteWK.Models.Dao.Customer in 'Models\DAO\TesteWK.Models.Dao.Customer.pas',
  TesteWk.Controllers.Customer in 'Controllers\TesteWk.Controllers.Customer.pas',
  TesteWK.Models.Dao.Product in 'Models\DAO\TesteWK.Models.Dao.Product.pas',
  TesteWK.Models.Dao.Order in 'Models\DAO\TesteWK.Models.Dao.Order.pas',
  TesteWK.Models.Dao.OrderItem in 'Models\DAO\TesteWK.Models.Dao.OrderItem.pas',
  TesteWK.Models.Product in 'Models\TesteWK.Models.Product.pas',
  TesteWk.Controllers.Product in 'Controllers\TesteWk.Controllers.Product.pas',
  TesteWK.Models.Order in 'Models\TesteWK.Models.Order.pas',
  TesteWk.Controllers.Order in 'Controllers\TesteWk.Controllers.Order.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;

  Application.CreateForm(TDBMod, DBMod);
  Application.CreateForm(TForm6, Form6);
  Application.Run;
end.
