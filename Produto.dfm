object produtoForm: TprodutoForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Produto'
  ClientHeight = 309
  ClientWidth = 645
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
  object panelNavegacao: TPanel
    Left = 0
    Top = 0
    Width = 645
    Height = 41
    Align = alTop
    TabOrder = 0
    object DBNavigator: TDBNavigator
      Left = 1
      Top = 1
      Width = 643
      Height = 39
      DataSource = dataModuleMain.DataSourceProduto
      VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
      Align = alClient
      TabOrder = 0
    end
  end
  object panelDados: TPanel
    Left = 0
    Top = 41
    Width = 645
    Height = 58
    Align = alTop
    TabOrder = 1
    object labelId: TLabel
      Left = 8
      Top = 5
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
      FocusControl = DBEditId
    end
    object labelDescricao: TLabel
      Left = 58
      Top = 5
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
      FocusControl = DBEditDescricao
    end
    object labelValor: TLabel
      Left = 554
      Top = 5
      Width = 48
      Height = 13
      Caption = 'Valor (R$)'
      FocusControl = DBEditValor
    end
    object DBEditId: TDBEdit
      Left = 8
      Top = 24
      Width = 33
      Height = 21
      DataField = 'id'
      DataSource = dataModuleMain.DataSourceProduto
      Enabled = False
      ReadOnly = True
      TabOrder = 0
    end
    object DBEditDescricao: TDBEdit
      Left = 56
      Top = 24
      Width = 481
      Height = 21
      DataField = 'descricao'
      DataSource = dataModuleMain.DataSourceProduto
      TabOrder = 1
    end
    object DBEditValor: TDBEdit
      Left = 552
      Top = 24
      Width = 70
      Height = 21
      DataField = 'valor'
      DataSource = dataModuleMain.DataSourceProduto
      TabOrder = 2
    end
  end
  object panelLista: TPanel
    Left = 0
    Top = 99
    Width = 645
    Height = 210
    Align = alClient
    TabOrder = 2
    object DBGrid: TDBGrid
      Left = 1
      Top = 1
      Width = 643
      Height = 208
      Align = alClient
      DataSource = dataModuleMain.DataSourceProduto
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
          FieldName = 'descricao'
          Title.Caption = 'Descri'#231#227'o'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valor'
          Title.Caption = 'Valor (R$)'
          Visible = True
        end>
    end
  end
end
