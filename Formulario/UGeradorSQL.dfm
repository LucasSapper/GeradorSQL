object FrGeradorSQL: TFrGeradorSQL
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Gerador de SQL'
  ClientHeight = 389
  ClientWidth = 759
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 759
    Height = 389
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 24
      Width = 47
      Height = 13
      Caption = 'Colunas:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 267
      Top = 24
      Width = 47
      Height = 13
      Caption = 'Tabelas:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 518
      Top = 24
      Width = 60
      Height = 13
      Caption = 'Condi'#231#245'es:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 16
      Top = 208
      Width = 727
      Height = 13
      Shape = bsTopLine
    end
    object Label4: TLabel
      Left = 16
      Top = 227
      Width = 24
      Height = 13
      Caption = 'SQL:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ME_Colunas: TMemo
      Left = 16
      Top = 43
      Width = 225
      Height = 102
      TabOrder = 0
    end
    object ME_Tabelas: TMemo
      Left = 267
      Top = 43
      Width = 225
      Height = 102
      TabOrder = 1
    end
    object ME_Condicoes: TMemo
      Left = 518
      Top = 43
      Width = 225
      Height = 102
      TabOrder = 2
    end
    object BB_GerarSQL: TButton
      Left = 328
      Top = 168
      Width = 105
      Height = 25
      Caption = 'Gerar SQL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = BB_GerarSQLClick
    end
    object ME_SQL: TMemo
      Left = 16
      Top = 246
      Width = 727
      Height = 131
      TabOrder = 4
    end
  end
end
