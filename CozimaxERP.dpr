program CozimaxERP;

uses
  Vcl.Forms,
  Cozimax in 'Cozimax.pas' {formMain},
  DataModule in 'DataModule.pas' {dataModuleMain: TDataModule},
  Cliente in 'Cliente.pas' {clienteForm},
  Produto in 'Produto.pas' {produtoForm},
  Venda in 'Venda.pas' {vendaForm},
  VendaConsulta in 'VendaConsulta.pas' {vendaConsultaForm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TformMain, formMain);
  Application.CreateForm(TdataModuleMain, dataModuleMain);
  Application.CreateForm(TclienteForm, clienteForm);
  Application.CreateForm(TprodutoForm, produtoForm);
  Application.CreateForm(TvendaForm, vendaForm);
  Application.CreateForm(TvendaConsultaForm, vendaConsultaForm);
  Application.Run;
end.
