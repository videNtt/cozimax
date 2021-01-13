unit DataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.UI.Intf, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Phys.ODBCBase, FireDAC.Comp.Client,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.UI, Vcl.Dialogs;

type
  TdataModuleMain = class(TDataModule)
    WaitCursor: TFDGUIxWaitCursor;
    Conexao: TFDConnection;
    DataSourceCliente: TDataSource;
    DataSourceProduto: TDataSource;
    DataSourceVenda: TDataSource;
    DataSourceVendaItem: TDataSource;
    TableCliente: TFDTable;
    TableClienteid: TFDAutoIncField;
    TableClientenome: TStringField;
    TableProduto: TFDTable;
    TableProdutoid: TFDAutoIncField;
    TableProdutodescricao: TStringField;
    TableProdutovalor: TFloatField;
    TableVenda: TFDTable;
    TableVendaItem: TFDTable;
    TableVendaItemid: TFDAutoIncField;
    TableVendaItemid_venda: TIntegerField;
    TableVendaItemid_produto: TIntegerField;
    TableVendaItemqtde: TIntegerField;
    TableVendaItemvalor_unitario: TFloatField;
    TableVendaItemvalor_total: TFloatField;
    TableVendaid: TFDAutoIncField;
    TableVendadata: TSQLTimeStampField;
    TableVendaid_cliente: TIntegerField;
    TableVendavalor_total: TFloatField;
    TableVendaItemproduto: TStringField;
    CommandAtualizaValorTotalVenda: TFDCommand;
    TableVendaItemvalor_unitario_parcial: TFloatField;
    QueryValidaProdutoVendaDuplicado: TFDQuery;
    DataSourceSQLVenda: TDataSource;
    FDSQLQueryVenda: TFDQuery;
    FDSQLQueryVendaItem: TFDQuery;
    DataSourceSQLVendaItem: TDataSource;
    FDSQLQueryVendaid: TFDAutoIncField;
    FDSQLQueryVendadata: TSQLTimeStampField;
    FDSQLQueryVendaid_cliente: TIntegerField;
    FDSQLQueryVendavalor_total: TFloatField;
    FDSQLQueryVendacliente: TStringField;
    FDSQLQueryVendaItemid: TFDAutoIncField;
    FDSQLQueryVendaItemid_venda: TIntegerField;
    FDSQLQueryVendaItemid_produto: TIntegerField;
    FDSQLQueryVendaItemqtde: TIntegerField;
    FDSQLQueryVendaItemvalor_unitario: TFloatField;
    FDSQLQueryVendaItemvalor_total: TFloatField;
    FDSQLQueryVendaItemproduto: TStringField;
    procedure TableVendaItemAfterPost(DataSet: TDataSet);
    procedure calcularTotais;
    procedure atualizarTotais;
    procedure TableVendaBeforeDelete(DataSet: TDataSet);
    procedure TableVendaItemBeforePost(DataSet: TDataSet);
    procedure TableVendaItemAfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dataModuleMain: TdataModuleMain;
  valorTotal : Real;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Venda;

{$R *.dfm}

procedure TdataModuleMain.atualizarTotais;
begin
  CommandAtualizaValorTotalVenda.ParamByName('pIdVenda').Value := TableVenda.FieldByName('id').Value;
  CommandAtualizaValorTotalVenda.ParamByName('pValorTotalParcial').Value := valorTotal;
  CommandAtualizaValorTotalVenda.Execute;
  TableVenda.Refresh;
end;

procedure TdataModuleMain.calcularTotais;
begin
  valorTotal := 0;
  TableVendaItem.First;
  while not TableVendaItem.Eof do
  begin
    valorTotal := valorTotal + (TableVendaItem.FieldByName('qtde').Value * TableVendaItem.FieldByName('valor_unitario').Value);
    TableVendaItem.Next;
  end;

end;

procedure TdataModuleMain.TableVendaBeforeDelete(DataSet: TDataSet);
begin
  if TableVendaItem.RecordCount > 0 then
    begin
      ShowMessage('Existe item(ns) cadastrados para essa venda. Exclua o(s) primeiro.');
      abort;
    end;

end;

procedure TdataModuleMain.TableVendaItemAfterDelete(DataSet: TDataSet);
begin
  calcularTotais;
  atualizarTotais;
end;

procedure TdataModuleMain.TableVendaItemAfterPost(DataSet: TDataSet);
begin
  calcularTotais;
  atualizarTotais;
end;

procedure TdataModuleMain.TableVendaItemBeforePost(DataSet: TDataSet);
begin
  QueryValidaProdutoVendaDuplicado.Close;
  QueryValidaProdutoVendaDuplicado.SQL.Clear;
  QueryValidaProdutoVendaDuplicado.SQL.Text := 'select * from venda_item where id_venda = :pIdVenda and id_produto = :pIdProduto';
  QueryValidaProdutoVendaDuplicado.ParamByName('pIdVenda').Value := TableVendaItem.FieldByName('id_venda').Value;
  QueryValidaProdutoVendaDuplicado.ParamByName('pIdProduto').Value := TableVendaItem.FieldByName('id_produto').Value;
  QueryValidaProdutoVendaDuplicado.Open;

  if QueryValidaProdutoVendaDuplicado.RecordCount > 0 then
    begin
      ShowMessage('Não é possível adicionar o mesmo produto duas vezes na mesma venda.');
      abort;
    end;
end;

end.
