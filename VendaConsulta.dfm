object vendaConsultaForm: TvendaConsultaForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Consulta de vendas'
  ClientHeight = 465
  ClientWidth = 1238
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object panelTitulo: TPanel
    Left = 0
    Top = 0
    Width = 1238
    Height = 41
    Align = alTop
    Caption = 'Consultar vendas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object panelFiltros: TPanel
    Left = 0
    Top = 41
    Width = 1238
    Height = 48
    Align = alTop
    TabOrder = 1
    object textNome: TEdit
      Left = 596
      Top = 14
      Width = 222
      Height = 21
      TabOrder = 7
    end
    object textDataInicial: TMaskEdit
      Left = 596
      Top = 14
      Width = 73
      Height = 21
      EditMask = '##/##/####;1;_'
      MaxLength = 10
      TabOrder = 0
      Text = '  /  /    '
    end
    object labelDataInicial: TStaticText
      Left = 536
      Top = 18
      Width = 59
      Height = 17
      Caption = 'Data inicial:'
      TabOrder = 1
    end
    object textDataFinal: TMaskEdit
      Left = 745
      Top = 14
      Width = 73
      Height = 21
      EditMask = '##/##/####;1;_'
      MaxLength = 10
      TabOrder = 2
      Text = '  /  /    '
    end
    object labelDataFinal: TStaticText
      Left = 685
      Top = 18
      Width = 54
      Height = 17
      Caption = 'Data final:'
      TabOrder = 3
    end
    object buttonConsultarVendas: TButton
      Left = 833
      Top = 12
      Width = 75
      Height = 25
      Caption = 'Consultar'
      TabOrder = 4
      OnClick = buttonConsultarVendasClick
    end
    object radioGroupFiltro: TRadioGroup
      Left = 24
      Top = 6
      Width = 486
      Height = 35
      Caption = 'Filtrar por'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Data'
        'Cliente'
        'Venda')
      TabOrder = 6
      OnClick = radioGroupFiltroClick
    end
    object labelCodigo: TStaticText
      Left = 554
      Top = 18
      Width = 41
      Height = 17
      Caption = 'C'#243'digo:'
      TabOrder = 8
    end
    object labelNome: TStaticText
      Left = 560
      Top = 18
      Width = 35
      Height = 17
      Caption = 'Nome:'
      TabOrder = 9
    end
    object textCodigo: TEdit
      Left = 596
      Top = 14
      Width = 61
      Height = 21
      TabOrder = 10
    end
    object buttonLimpar: TButton
      Left = 921
      Top = 12
      Width = 75
      Height = 25
      Caption = 'Limpar'
      TabOrder = 5
      OnClick = buttonLimparClick
    end
  end
  object DBGrid1: TDBGrid
    Left = 24
    Top = 104
    Width = 486
    Height = 313
    DataSource = dataModuleMain.DataSourceSQLVenda
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cliente'
        Title.Caption = 'Cliente'
        Width = 207
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data'
        Title.Caption = 'Data'
        Width = 65
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valor_total'
        Title.Caption = 'Valor Total (R$)'
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 520
    Top = 104
    Width = 693
    Height = 313
    DataSource = dataModuleMain.DataSourceSQLVendaItem
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'id'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'id_venda'
        Title.Caption = 'C'#243'd. Venda'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'id_produto'
        Title.Caption = 'C'#243'd. Prod.'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'produto'
        Title.Caption = 'Produto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valor_unitario'
        Title.Caption = 'Valor Unit'#225'rio (R$)'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'qtde'
        Title.Caption = 'Qtde'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valor_total'
        Title.Caption = 'Valor Total (R$)'
        Visible = True
      end>
  end
  object labelTotalVendas: TStaticText
    Left = 32
    Top = 432
    Width = 140
    Height = 23
    Caption = 'Total de vendas:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object labelTotalVendasValor: TStaticText
    Left = 184
    Top = 432
    Width = 24
    Height = 23
    Caption = '00'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
end
