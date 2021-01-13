unit VendaConsulta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TvendaConsultaForm = class(TForm)
    panelTitulo: TPanel;
    panelFiltros: TPanel;
    textDataInicial: TMaskEdit;
    labelDataInicial: TStaticText;
    textDataFinal: TMaskEdit;
    labelDataFinal: TStaticText;
    buttonConsultarVendas: TButton;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    labelTotalVendas: TStaticText;
    labelTotalVendasValor: TStaticText;
    radioGroupFiltro: TRadioGroup;
    textNome: TEdit;
    labelCodigo: TStaticText;
    labelNome: TStaticText;
    textCodigo: TEdit;
    buttonLimpar: TButton;
    procedure buttonConsultarVendasClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure radioGroupFiltroClick(Sender: TObject);
    procedure buttonLimparClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  vendaConsultaForm: TvendaConsultaForm;

implementation

{$R *.dfm}

uses DataModule;

procedure TvendaConsultaForm.buttonConsultarVendasClick(Sender: TObject);
begin
  if (StrToDate(textDataInicial.Text) > StrToDate(textDataFinal.Text)) then
    begin
      ShowMessage('A data inicial não pode ser maior que a data final.');
      abort;
    end;

  with dataModuleMain.FDSQLQueryVenda do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from venda');

      case radioGroupFiltro.ItemIndex of
        0:
        begin
          SQL.Add('where convert(varchar, data, 103) between :pDataInicial and :pDataFinal');
          ParamByName('pDataInicial').Value := FormatDateTime('dd/mm/yyyy', StrToDate(textDataInicial.Text));
          ParamByName('pDataFinal').Value := FormatDateTime('dd/mm/yyyy', StrToDate(textDataFinal.Text));
        end;
        1:
        begin
          SQL.Add('inner join cliente on cliente.id = venda.id_cliente where cliente.nome like :pNome');
          ParamByName('pNome').Value := '%' + textNome.Text + '%';
        end;
        2:
        begin
          SQL.Add('where id = :pIdVenda');
          ParamByName('pIdVenda').Value := textCodigo.Text;
        end;
    end;
    Open;
  end;

  labelTotalVendasValor.Caption := IntToStr(dataModuleMain.FDSQLQueryVenda.RecordCount);
end;

procedure TvendaConsultaForm.buttonLimparClick(Sender: TObject);
begin
  with dataModuleMain.FDSQLQueryVenda do
    begin
      Close;
      SQL.Clear;
      SQL.Add('select * from venda');
      Open;
    end;
end;

procedure TvendaConsultaForm.FormShow(Sender: TObject);
begin
  labelTotalVendasValor.Caption := IntToStr(dataModuleMain.TableVenda.RecordCount);
  dataModuleMain.FDSQLQueryVenda.Refresh;
  dataModuleMain.FDSQLQueryVendaItem.Refresh;
  textNome.Visible := false;
  labelDataInicial.Visible := true;
  labelDataFinal.Visible := true;
  labelNome.Visible := false;
  labelCodigo.Visible := false;
  textDataInicial.Visible := true;
  textDataFinal.Visible := true;
  textDataInicial.Text := FormatDateTime('dd/mm/yyyy', Now);
  textDataFinal.Text := FormatDateTime('dd/mm/yyyy', Now);
  textNome.Visible := false;
  textCodigo.Visible := false;
end;

procedure TvendaConsultaForm.radioGroupFiltroClick(Sender: TObject);
begin
  case radioGroupFiltro.ItemIndex of
    0:
    begin
       labelDataInicial.Visible := true;
       labelDataFinal.Visible := true;
       labelNome.Visible := false;
       labelCodigo.Visible := false;
       textDataInicial.Visible := true;
       textDataFinal.Visible := true;
       textNome.Visible := false;
       textCodigo.Visible := false;
       textDataInicial.SetFocus;
       buttonConsultarVendas.Left := 833;
       buttonLimpar.Left := 921;
    end;

    1:
    begin
       labelDataInicial.Visible := false;
       labelDataFinal.Visible := false;
       labelNome.Visible := true;
       labelCodigo.Visible := false;
       textDataInicial.Visible := false;
       textDataFinal.Visible := false;
       textNome.Visible := true;
       textCodigo.Visible := false;
       textNome.SetFocus;
       buttonConsultarVendas.Left := 833;
       buttonLimpar.Left := 921;
    end;

    2:
    begin
       labelDataInicial.Visible := false;
       labelDataFinal.Visible := false;
       labelNome.Visible := false;
       labelCodigo.Visible := true;
       textDataInicial.Visible := false;
       textDataFinal.Visible := false;
       textNome.Visible := false;
       textCodigo.Visible := true;
       textCodigo.SetFocus;
       buttonConsultarVendas.Left := 672;
       buttonLimpar.Left := 763;
    end;
  end;
end;

end.
