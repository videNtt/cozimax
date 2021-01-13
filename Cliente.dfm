object clienteForm: TclienteForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Cliente'
  ClientHeight = 244
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
      DataSource = dataModuleMain.DataSourceCliente
      VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
      Align = alClient
      TabOrder = 0
    end
  end
  object panelDados: TPanel
    Left = 0
    Top = 41
    Width = 645
    Height = 56
    Align = alTop
    TabOrder = 1
    object labelId: TLabel
      Left = 8
      Top = 6
      Width = 33
      Height = 13
      Caption = 'C'#243'digo'
    end
    object labelNome: TLabel
      Left = 56
      Top = 6
      Width = 27
      Height = 13
      Caption = 'Nome'
      FocusControl = DBEditNome
    end
    object DBEditNome: TDBEdit
      Left = 56
      Top = 24
      Width = 569
      Height = 21
      DataField = 'nome'
      DataSource = dataModuleMain.DataSourceCliente
      TabOrder = 0
    end
    object DBEditId: TDBEdit
      Left = 8
      Top = 24
      Width = 33
      Height = 21
      DataField = 'id'
      DataSource = dataModuleMain.DataSourceCliente
      Enabled = False
      ReadOnly = True
      TabOrder = 1
    end
  end
  object panelLista: TPanel
    Left = 0
    Top = 97
    Width = 645
    Height = 147
    Align = alClient
    TabOrder = 2
    object DBGrid: TDBGrid
      Left = 1
      Top = 1
      Width = 643
      Height = 145
      Align = alClient
      DataSource = dataModuleMain.DataSourceCliente
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
          FieldName = 'nome'
          Title.Caption = 'Nome'
          Visible = True
        end>
    end
  end
end
