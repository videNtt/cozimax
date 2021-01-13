unit Cliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TclienteForm = class(TForm)
    panelNavegacao: TPanel;
    panelDados: TPanel;
    labelId: TLabel;
    labelNome: TLabel;
    DBEditNome: TDBEdit;
    panelLista: TPanel;
    DBEditId: TDBEdit;
    DBNavigator: TDBNavigator;
    DBGrid: TDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  clienteForm: TclienteForm;

implementation

{$R *.dfm}

uses DataModule;

end.
