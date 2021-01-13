unit Cozimax;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Menus;

type
  TformMain = class(TForm)
    statusBarMain: TStatusBar;
    timerMain: TTimer;
    menuMain: TMainMenu;
    Cadastro: TMenuItem;
    Aes1: TMenuItem;
    Cliente: TMenuItem;
    Produto: TMenuItem;
    Venda: TMenuItem;
    Sair1: TMenuItem;
    Sair2: TMenuItem;
    ConsultarVendas1: TMenuItem;
    procedure timerMainTimer(Sender: TObject);
    procedure ClienteClick(Sender: TObject);
    procedure ProdutoClick(Sender: TObject);
    procedure VendaClick(Sender: TObject);
    procedure Sair2Click(Sender: TObject);
    procedure ConsultarVendas1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formMain: TformMain;

implementation

{$R *.dfm}

uses DataModule, Cliente, Produto, Venda, VendaConsulta;

procedure TformMain.ClienteClick(Sender: TObject);
begin
  clienteForm.ShowModal;
end;

procedure TformMain.ConsultarVendas1Click(Sender: TObject);
begin
  vendaConsultaForm.ShowModal;
end;

procedure TformMain.ProdutoClick(Sender: TObject);
begin
  produtoForm.ShowModal;
end;

procedure TformMain.Sair2Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TformMain.VendaClick(Sender: TObject);
begin
  vendaForm.ShowModal;
end;

procedure TformMain.timerMainTimer(Sender: TObject);
begin
  statusBarMain.Panels[3].Text := 'Data: ' + FormatDateTime('dddd, dd" de "mmmm" de "yyyy', Now);
  statusBarMain.Panels[4].Text := 'Hora: ' + FormatDateTime('hh:mm:ss', Now);
end;

end.
