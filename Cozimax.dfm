object formMain: TformMain
  Left = 0
  Top = 0
  Caption = 'Sistema de vendas'
  ClientHeight = 319
  ClientWidth = 837
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = menuMain
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object statusBarMain: TStatusBar
    Left = 0
    Top = 300
    Width = 837
    Height = 19
    Panels = <
      item
        Text = 'Empresa: Cozimax'
        Width = 120
      end
      item
        Text = 'Unidade: Mirassol'
        Width = 120
      end
      item
        Alignment = taCenter
        Text = 'Desenvolvido por: Rodrigo Almeida'
        Width = 250
      end
      item
        Alignment = taRightJustify
        Text = 'Data:'
        Width = 250
      end
      item
        Text = 'Hora:'
        Width = 100
      end>
  end
  object timerMain: TTimer
    OnTimer = timerMainTimer
    Left = 16
    Top = 56
  end
  object menuMain: TMainMenu
    Left = 16
    Top = 8
    object Cadastro: TMenuItem
      Caption = 'Cadastros'
      ShortCut = 49219
      object Cliente: TMenuItem
        Caption = 'Cliente'
        OnClick = ClienteClick
      end
      object Produto: TMenuItem
        Caption = 'Produto'
        OnClick = ProdutoClick
      end
    end
    object Aes1: TMenuItem
      Caption = 'Movimenta'#231#245'es'
      object Venda: TMenuItem
        Caption = 'Gerenciar Vendas'
        OnClick = VendaClick
      end
      object ConsultarVendas1: TMenuItem
        Caption = 'Consultar Vendas'
        OnClick = ConsultarVendas1Click
      end
    end
    object Sair1: TMenuItem
      Caption = 'Sistema'
      object Sair2: TMenuItem
        Caption = 'Sair'
        OnClick = Sair2Click
      end
    end
  end
end
