object vendaForm: TvendaForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cadastro de vendas'
  ClientHeight = 402
  ClientWidth = 1253
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object panelGerenciarVendas: TPanel
    Left = 16
    Top = 50
    Width = 490
    Height = 337
    TabOrder = 0
    object panelDadosVendas: TPanel
      Left = 1
      Top = 42
      Width = 488
      Height = 63
      Align = alTop
      TabOrder = 0
      object labelId: TLabel
        Left = 8
        Top = 8
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        FocusControl = DBEditId
      end
      object labelData: TLabel
        Left = 281
        Top = 8
        Width = 23
        Height = 13
        Caption = 'Data'
        FocusControl = DBEditData
      end
      object labelValorTotal: TLabel
        Left = 407
        Top = 8
        Width = 73
        Height = 13
        Caption = 'Valor total (R$)'
        FocusControl = DBEditValorTotal
      end
      object labelCliente: TLabel
        Left = 59
        Top = 8
        Width = 33
        Height = 13
        Caption = 'Cliente'
        FocusControl = DBEditData
      end
      object DBEditId: TDBEdit
        Left = 8
        Top = 25
        Width = 33
        Height = 21
        DataField = 'id'
        DataSource = dataModuleMain.DataSourceVenda
        ReadOnly = True
        TabOrder = 0
      end
      object DBEditData: TDBEdit
        Left = 280
        Top = 25
        Width = 111
        Height = 21
        DataField = 'data'
        DataSource = dataModuleMain.DataSourceVenda
        MaxLength = 10
        TabOrder = 2
      end
      object DBEditValorTotal: TDBEdit
        Left = 407
        Top = 25
        Width = 74
        Height = 21
        Color = cl3DLight
        DataField = 'valor_total'
        DataSource = dataModuleMain.DataSourceVenda
        Enabled = False
        ReadOnly = True
        TabOrder = 3
      end
      object DBLookupComboBoxCliente: TDBLookupComboBox
        Left = 57
        Top = 25
        Width = 208
        Height = 21
        DataField = 'id_cliente'
        DataSource = dataModuleMain.DataSourceVenda
        KeyField = 'id'
        ListField = 'nome'
        ListSource = dataModuleMain.DataSourceCliente
        TabOrder = 1
      end
    end
    object panelListaVendas: TPanel
      Left = 1
      Top = 105
      Width = 488
      Height = 231
      Align = alClient
      TabOrder = 1
      object DBGridGerenciarVendas: TDBGrid
        Left = 1
        Top = 1
        Width = 486
        Height = 229
        Align = alClient
        DataSource = dataModuleMain.DataSourceVenda
        TabOrder = 0
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
            FieldName = 'data'
            Title.Caption = 'Data'
            Width = 105
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor_total'
            Title.Caption = 'Valor Total (R$)'
            Visible = True
          end>
      end
    end
    object panelNavegacaoVendas: TPanel
      Left = 1
      Top = 1
      Width = 488
      Height = 41
      Align = alTop
      TabOrder = 2
      object DBNavigatorGerenciarVendas: TDBNavigator
        Left = 1
        Top = 1
        Width = 486
        Height = 39
        DataSource = dataModuleMain.DataSourceVenda
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel]
        Align = alClient
        TabOrder = 0
        OnClick = DBNavigatorGerenciarVendasClick
      end
    end
  end
  object labelGerenciarVenda: TStaticText
    Left = 18
    Top = 14
    Width = 185
    Height = 29
    Caption = 'Gerenciar vendas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object labelProdutosVenda: TStaticText
    Left = 554
    Top = 14
    Width = 200
    Height = 29
    Caption = 'Produtos da venda'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object panelProdutosVenda: TPanel
    Left = 536
    Top = 50
    Width = 697
    Height = 335
    TabOrder = 3
    object panelListaProdutosVenda: TPanel
      Left = 1
      Top = 42
      Width = 695
      Height = 292
      Align = alClient
      TabOrder = 0
      object DBGridProdutosVenda: TDBGrid
        Left = 1
        Top = 1
        Width = 693
        Height = 290
        Align = alClient
        DataSource = dataModuleMain.DataSourceVendaItem
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnColExit = DBGridProdutosVendaColExit
        Columns = <
          item
            Expanded = False
            FieldName = 'id'
            Title.Caption = 'C'#243'digo'
            Width = 44
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'id_venda'
            Title.Caption = 'C'#243'd. Venda'
            Width = 62
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'produto'
            Title.Caption = 'Produto'
            Width = 217
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor_unitario_parcial'
            ReadOnly = True
            Title.Caption = 'Valor Unit'#225'rio (R$)'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'qtde'
            Title.Caption = 'Qtde'
            Width = 29
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor_total'
            Title.Caption = 'Valor Total (R$)'
            Visible = True
          end>
      end
    end
    object panelNavegacaoProdutosVenda: TPanel
      Left = 1
      Top = 1
      Width = 695
      Height = 41
      Align = alTop
      TabOrder = 1
      object DBNavigatorProdutosVenda: TDBNavigator
        Left = 1
        Top = 1
        Width = 693
        Height = 39
        DataSource = dataModuleMain.DataSourceVendaItem
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel]
        Align = alClient
        TabOrder = 0
      end
    end
  end
end
