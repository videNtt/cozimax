unit Produto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask;

type
  TprodutoForm = class(TForm)
    panelNavegacao: TPanel;
    panelDados: TPanel;
    panelLista: TPanel;
    DBNavigator: TDBNavigator;
    DBGrid: TDBGrid;
    labelId: TLabel;
    DBEditId: TDBEdit;
    labelDescricao: TLabel;
    DBEditDescricao: TDBEdit;
    labelValor: TLabel;
    DBEditValor: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  produtoForm: TprodutoForm;

implementation

{$R *.dfm}

uses DataModule;

end.
