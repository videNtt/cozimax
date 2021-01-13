unit Venda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.DBCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCGrids;

type
  TvendaForm = class(TForm)
    panelNavegacaoVendas: TPanel;
    panelListaVendas: TPanel;
    DBNavigatorGerenciarVendas: TDBNavigator;
    DBGridGerenciarVendas: TDBGrid;
    panelDadosVendas: TPanel;
    labelId: TLabel;
    labelData: TLabel;
    labelValorTotal: TLabel;
    labelCliente: TLabel;
    DBEditId: TDBEdit;
    DBEditData: TDBEdit;
    DBEditValorTotal: TDBEdit;
    DBLookupComboBoxCliente: TDBLookupComboBox;
    panelGerenciarVendas: TPanel;
    labelGerenciarVenda: TStaticText;
    labelProdutosVenda: TStaticText;
    panelProdutosVenda: TPanel;
    panelListaProdutosVenda: TPanel;
    panelNavegacaoProdutosVenda: TPanel;
    DBNavigatorProdutosVenda: TDBNavigator;
    DBGridProdutosVenda: TDBGrid;
    procedure DBNavigatorGerenciarVendasClick(Sender: TObject;
      Button: TNavigateBtn);
    procedure DBGridProdutosVendaColExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  vendaForm: TvendaForm;

implementation

{$R *.dfm}

uses DataModule;

procedure TvendaForm.DBGridProdutosVendaColExit(Sender: TObject);
begin
  if DBGridProdutosVenda.SelectedIndex = 4 then
    begin
      dataModuleMain.TableVendaItem.Fields[4].Value := dataModuleMain.TableVendaItem.Fields[7].Value;
      dataModuleMain.TableVendaItem.Fields[5].Value := dataModuleMain.TableVendaItem.Fields[3].Value * dataModuleMain.TableVendaItem.Fields[4].Value;
    end;
  
end;

procedure TvendaForm.DBNavigatorGerenciarVendasClick(Sender: TObject;
  Button: TNavigateBtn);
begin
  if Button = nbInsert then
    begin
      dataModuleMain.TableVenda.FieldByName('data').Value := FormatDateTime('dd/mm/yyyy', Now);
    end;

end;

end.
