object Form6: TForm6
  Left = 0
  Top = 0
  Caption = ' Vendas'
  ClientHeight = 395
  ClientWidth = 844
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object pnlCliente: TPanel
    Left = 0
    Top = 0
    Width = 844
    Height = 66
    Align = alTop
    TabOrder = 0
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 842
      Height = 64
      Align = alClient
      Caption = 'Dados Gerais'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object lbkpCliente: TLabel
        Left = 24
        Top = 50
        Width = 3
        Height = 13
        Visible = False
      end
      object edtName: TButtonedEdit
        Left = 16
        Top = 23
        Width = 242
        Height = 21
        Images = ImageList1
        RightButton.ImageIndex = 0
        RightButton.Visible = True
        TabOrder = 2
        TextHint = 'Pesquisar Cliente'
        OnKeyDown = edtNameKeyDown
      end
      object edtCodCliente: TEdit
        Tag = 1
        Left = 264
        Top = 24
        Width = 77
        Height = 21
        TabStop = False
        Color = clSilver
        OEMConvert = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        TextHint = 'C'#243'digo'
      end
      object edtCity: TEdit
        Tag = 1
        Left = 347
        Top = 24
        Width = 121
        Height = 21
        TabStop = False
        Color = clSilver
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        TextHint = 'Cidade'
      end
      object edtState: TEdit
        Tag = 1
        Left = 474
        Top = 24
        Width = 121
        Height = 21
        TabStop = False
        Color = clSilver
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        TextHint = 'Estado'
      end
      object btnLerPedido: TButton
        Left = 627
        Top = 9
        Width = 98
        Height = 50
        Caption = 'Ler Pedidos'
        ImageAlignment = iaBottom
        ImageIndex = 3
        Images = ImageList1
        TabOrder = 0
        OnClick = btnLerPedidoClick
      end
      object btnCancelarPedido: TButton
        Left = 731
        Top = 9
        Width = 106
        Height = 50
        Caption = 'Cancelar Pedidos'
        ImageAlignment = iaBottom
        ImageIndex = 2
        Images = ImageList1
        TabOrder = 1
        OnClick = btnCancelarPedidoClick
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 89
    Width = 844
    Height = 247
    Align = alClient
    TabOrder = 2
    object DBGrid1: TDBGrid
      Left = 1
      Top = 65
      Width = 842
      Height = 181
      Align = alClient
      DataSource = DBMod.dsOrders_items
      FixedColor = clWindow
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnKeyDown = DBGrid1KeyDown
      Columns = <
        item
          Color = clWindow
          Expanded = False
          FieldName = 'product_code'
          Title.Caption = 'Cod.Produto'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'description'
          Title.Caption = 'Descri'#231#227'o'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'quantity'
          Title.Caption = 'Quantidade'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'value'
          Title.Caption = 'Valor.Unit'#225'rio'
          Width = 64
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'amount'
          Title.Caption = 'Total'
          Width = 64
          Visible = True
        end>
    end
    object Panel5: TPanel
      Left = 1
      Top = 1
      Width = 842
      Height = 64
      Align = alTop
      Alignment = taLeftJustify
      TabOrder = 0
      object GroupBox2: TGroupBox
        Left = 1
        Top = 1
        Width = 840
        Height = 62
        Align = alClient
        Caption = 'Produto'
        TabOrder = 0
        object edtProduto: TButtonedEdit
          Tag = 10
          Left = 16
          Top = 23
          Width = 241
          Height = 21
          Images = ImageList1
          RightButton.ImageIndex = 0
          RightButton.Visible = True
          TabOrder = 1
          TextHint = 'Pesquisar Produto'
          OnKeyDown = edtProdutoKeyDown
        end
        object edtCodProd: TEdit
          Tag = 10
          Left = 263
          Top = 23
          Width = 77
          Height = 21
          TabStop = False
          Color = clSilver
          TabOrder = 2
          TextHint = 'C'#243'digo'
        end
        object btnIncluir: TButton
          Left = 601
          Top = 21
          Width = 37
          Height = 25
          Hint = 'Incluir Item'
          ImageAlignment = iaCenter
          ImageIndex = 1
          Images = ImageList1
          ParentShowHint = False
          PressedImageIndex = 1
          SelectedImageIndex = 1
          ShowHint = True
          StylusHotImageIndex = 1
          TabOrder = 5
          OnClick = btnIncluirClick
        end
        object edtQuantity: TEdit
          Tag = 10
          Left = 346
          Top = 23
          Width = 121
          Height = 21
          NumbersOnly = True
          TabOrder = 3
          TextHint = 'Quantidade'
        end
        object edtValorUnit: TEdit
          Tag = 10
          Left = 473
          Top = 23
          Width = 121
          Height = 21
          TabOrder = 4
          TextHint = 'Valor Unit'#225'rio'
          OnKeyPress = edtValorUnitKeyPress
        end
        object Button1: TButton
          Left = 659
          Top = 4
          Width = 98
          Height = 53
          Caption = 'Salvar'
          ImageAlignment = iaBottom
          ImageIndex = 4
          Images = ImageList1
          TabOrder = 0
          TabStop = False
          OnClick = Button1Click
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 66
    Width = 844
    Height = 23
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 18
      Top = 1
      Width = 32
      Height = 13
      Caption = 'Pedido'
    end
    object edtNumOrder: TEdit
      Tag = 3
      Left = 56
      Top = 0
      Width = 121
      Height = 21
      TabStop = False
      BevelInner = bvNone
      BevelOuter = bvNone
      Color = clBtnFace
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 0
      Text = '0'
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 336
    Width = 844
    Height = 59
    Align = alBottom
    TabOrder = 3
    object LTotPedido: TLabel
      Left = 717
      Top = 1
      Width = 126
      Height = 57
      Align = alRight
      Alignment = taCenter
      AutoSize = False
      BiDiMode = bdLeftToRight
      Caption = 'R$ 0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
      Layout = tlCenter
      ExplicitLeft = 624
    end
    object Label3: TLabel
      Left = 560
      Top = 1
      Width = 157
      Height = 57
      Align = alRight
      Alignment = taCenter
      AutoSize = False
      BiDiMode = bdLeftToRight
      Caption = 'Total do Pedido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
      Layout = tlCenter
      ExplicitLeft = 472
    end
  end
  object ImageList1: TImageList
    Left = 328
    Top = 144
    Bitmap = {
      494C010105002400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FFFDEEDF00FCCF
      A200F9CCA100F8CCA100F8CCA100F8CCA100F9CCA100FCCFA200FDD0A300FDD0
      A300FDD0A300FDEEDF00000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FFFDD2A900FFAA
      5600F8B26E00F2B37400F2B37400F2B37400F2B37400F2B37400F6B57500F9B3
      6F00FFAA5600FDD2A900000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FFFDD2A900FFAA
      5600E8D0B800E0DBD800DDD8D500DCD8D500DCD8D500DCD8D500DDD8D500E7CF
      B700FFAA5600FDD2A900000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FFFDD2A900FFAA
      5600E8D0B800E1DCD900E0DBD800DDD8D500DCD8D500DCD8D500DCD8D500E4CC
      B500FEA95500FDD2A900000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FFFDD2A900FFAA
      5600E8D0B800E1DCD900E1DCD900E0DBD800DDD8D500DCD8D500DCD8D500E3CC
      B500FAA75500FCD1A800000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FFFDD2A900FFAA
      5600E8D0B800E1DCD900E1DCD900E1DCD900E0DBD800DDD8D500DCD8D500E3CC
      B500FAA75500F8CFA600000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FFFDD2A900FFAA
      5600EEC6A000E8D0B800E8D0B800E8D0B800E8D0B800E7CFB700E4CCB500E9C2
      9D00FAA75500F8CEA500000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FFFDD2A900FFAA
      5600FFAA5600FFAA5600FFAA5600FFAA5600FFAA5600FFAA5600FEA95500FAA7
      5500FAA75500F8CEA500000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FFFDD2A900FFAA
      5600FCA14700ED790500ED780400ED780400F6912D00EE7C0A00FFAA5600FEA9
      5500FAA75500F8CEA500000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FFFDE6D100FFAA
      5600FA9D4100ED780400ED780400ED780400FFAA5600ED780400FFAA5600FFAA
      5600FCB16700F9EEE400000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FFFDD7B200FFAA
      5600FA9D4100ED780400ED780400ED780400FFAA5600ED780400FFAA5600FDB2
      6800FDF2E700000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FFFDEEDF00FDD5
      AE00FBCA9900F4A95E00F4A95E00F4A95E00F4A95E00F4A95E00FDD5AE00FDF2
      E900000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FF000000FF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D3D0CE00C8C6C4000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D6EBDA0086CD95004FB9650034B14E0034B24F004FBC670088D19800DBF0
      DF0000000000000000000000000000000000000000000000000000000000B8B8
      B800414242004243430042434300424343004343430043434300434343004242
      4200BBBBBB000000000000000000000000000000000000000000000000000000
      0000F3E4DA00E8B69200E1966000E0884800E1894800E5976000EEBA9400F8E9
      DE0000000000000000000000000000000000D0CDCB00645D5600635C55008984
      7F00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000082CB
      91002CAC46002CAD47002CAD47002CAD47002CAF47002CB048002CB048002CAF
      470084D095000000000000000000000000000000000000000000000000009393
      93004243430042434300424343004A4B4B004A4B4B0043434300434343004343
      430094949400000000000000000000000000000000000000000000000000E9B4
      8D00DB814100DE834100DE834100DF834100E2844100E3854100E3854100E083
      4100ECB89100000000000000000000000000CECCCA00645D5600645D5600635C
      55006F696200D1CFCD0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000061C376002CAF
      47002CAD47002CAD47002CAD47002DAD48002DAD48002CAF47002CB048002CB0
      48002CB0480063C2770000000000000000000000000000000000000000008284
      840042434300D3D3D300424343008F8F8F008F8F8F0042434300D8D8D8004343
      4300838383000000000000000000000000000000000000000000E8A27100E284
      4100DF834100DE834100DE834100DE834100DF834100E2844100E3854100E385
      4100E3854100E8A472000000000000000000000000008C858100645D5600645D
      5600635C5500615A54009F9C99008D8883006F696200645F580079736E00A8A4
      A100000000000000000000000000000000000000000084CF93002CB048002CB0
      48002CAF47002CAD47002CAD4700B2DFBA00B1DFBA002CAD47002CAF47002CB0
      48002CB048002CB0480084D09500000000000000000000000000000000006F6F
      6F00494A4A00D5D5D500424343008F8F8F008F8F8F0042434300DADADA004A4A
      4A007272720000000000000000000000000000000000EDB68F00E3854100E385
      4100E2844100DF834100E08A4A00E5A06E00E5A06E00E18A4A00E2844100E385
      4100E3854100E3854100ECB89100000000000000000000000000716A6400645D
      5600645D5600635C5500635C5500635C5500635D560068625B00635C5500635C
      55006A625D00CECCC9000000000000000000D9EFDE002CAF47002CB048002CB0
      48002CB048002CAF47002CAD4700D1EAD600D1EAD6002CAD47002CAD47002CAF
      47002CB048002CB048002CAF4700DBF0DF000000000000000000000000005E5E
      5E0057575700CDCDCD00424343008F8F8F008F8F8F0042434300CACACA005555
      55005F5F5F00000000000000000000000000F8E8DD00E0834100E3854100E799
      6000E6925600EFBB9600F9F4F100FAFAFA00FAFAFA00F8F3F000ECB99400E284
      4100E3854100E3854100E0834100F8E9DE000000000000000000D4D2D000625B
      5500645D5600645D560077716900C9C7C5000000000000000000E5E4E4009F9C
      9900625B5400665F5800D9D8D6000000000086D097002CB048002CB048002CB0
      48002CB048002CB048002CAF4700D1EBD600D1EAD6002CAD47002CAD47002CAD
      47002CAF47002CB048002CB0480088D198000000000000000000000000004B4B
      4B0065656500BEBEBE00424343008F8F8F008F8F8F0042434300BCBDBD006263
      63004C4D4D00000000000000000000000000EDB89300E3854100E3854100EAA6
      7400FDF7F200FFFFFF00F2CBAE00E4996200E3986300EEC8AD00FAFAFA00EBB7
      9100E2844100E3854100E3854100EEBA9400000000000000000000000000A29F
      9A00645D560077716B0000000000000000000000000000000000000000000000
      0000B5B3AF00635C55007E777200000000004DB964002CB048002CB048002DB0
      49003AB554003AB554003AB55400D7EFDB00D4ECD8003AB253003AB253003AB2
      53002DAD48002CAF47002CB048004FBC67000000000000000000000000004343
      430072727200B1B1B10043434300919191008F8F8F0042434300B0B0B0006F70
      700042434300000000000000000000000000E5965D00E3854100E3854100EAA6
      7400FFFFFF00FDF9F500E7945900E2844100DF834100DE834100EEC8AD00F0CF
      B700DF834100E2844100E3854100E59760000000000000000000000000008E89
      8400645D5600CCCAC70000000000000000000000000000000000000000000000
      0000000000007D787100635C5500DCDAD90035B14F002CB048002CB04800B2E2
      BC00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FEFEFE00FAFAFA00FAFAFA00FAFA
      FA00AEDEB9002CAD47002CAF470036B14F000000000000000000E5E5E5004343
      43007F7F7F00A4A4A40043434300919191009191910042434300A2A3A3007B7C
      7C0042434300E3E3E3000000000000000000E0884900E3854100E3854100E489
      4800E7955A00E7955A00E58E4E00E3854100E2844100DF834100DE834100DE83
      4100DE834100DF834100E2844100E28A48000000000000000000000000006F68
      6100645E57000000000000000000000000000000000000000000000000000000
      000000000000ABA7A400635C5500BCB9B50034B24F002CB048002CB0480064C5
      79009DDAAA009DDAAA009DDAAA00EBF8EE00EBF8EE009CD9A9009AD6A7009AD6
      A70063C177002CAD47002CAD470035B04E000000000000000000D1D1D1004343
      43008D8D8D009898980043434300919191009191910042434300969797008989
      890042434300D0D0D0000000000000000000E1894800E3854100E3854100E385
      4100E3854100E3854100E3854100E3854100E3854100E48D4D00E3935900E292
      5900DF874700DE834100DF834100E0874900000000000000000000000000675F
      59006A625D000000000000000000000000000000000000000000000000000000
      000000000000B4B1AE00635C5500B2AEAC004DB964002CB048002CB048002CB0
      48002CB048002CB048002CB04800D5EFDA00D5EFDA002CB048002CAF47002CAD
      47002CAD47002CAD47002CAD47004FB965000000000000000000BFBFBF004343
      43006363630060606000434343006161610061616100434343005F6060006262
      620042434300BDBDBD000000000000000000E5965D00E3854100E3854100E385
      4100F2C8A900F0BE9A00E3854100E3854100E3854100E6925600FCF5F000FAFA
      FA00E5A37200DE834100DE834100E19660000000000000000000000000007872
      6D00645D56000000000000000000000000000000000000000000000000000000
      0000000000009A959100635C5500C4C1BF0084D095002CB048002CB048002CB0
      48002CB048002CB048002CB04800D5EFDA00D5EFDA002CB048002CB048002CAF
      47002CAD47002CAD47002CAD470086CD95000000000000000000ADADAD004343
      4300434343004343430043434300434343004343430043434300434343004243
      430042434300ABABAB000000000000000000ECB89100E3854100E3854100E385
      4100F2C5A500FFFEFD00F0BC9700E58C4B00E58C4C00F0BD9800FFFEFD00FCF6
      F100E6A37200DE834100DE834100E8B69200000000000000000000000000A6A2
      9F00645D5600A5A19D0000000000000000000000000000000000000000000000
      00000000000066605A00655E570000000000D8EFDE002CAE47002CB048002CB0
      48002CB048002CB048002CB04800D2EED800D2EED8002CB048002CB048002CB0
      48002CAF47002CAD47002CAC4600D6EBDA000000000000000000E6E6E600CCCC
      CC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCCCC00CCCC
      CC00CCCCCC00E2E2E2000000000000000000F8E7DB00E0843F00E3854100E385
      4100E3864300F3CBAF00FFFEFD00FFFFFF00FFFFFF00FFFEFD00F3CBAE00E693
      5800E6985F00DF834100DB814100F3E4DA000000000000000000000000000000
      000069625B00635C5500B9B7B400000000000000000000000000000000000000
      00007E787200635C5500A4A19F0000000000000000007FCE92002CB048002CB0
      48002CB048002CB048002CB0480064C5790064C579002CB048002CB048002CB0
      48002CB048002CAF470082CB91000000000000000000C5C5C5004F4F4F004F4F
      4F004F4F4F004F4F4F004F4F4F004F4F4F004F4F4F004F4F4F004F4F4F004F4F
      4F004F4F4F004D4F4F00C2C2C2000000000000000000EBB58C00E3854100E385
      4100E3854100E3854100E7965C00EDB28700EDB28700E7965B00E3854100E385
      4100E3854100E2844100E9B48D00000000000000000000000000000000000000
      0000CCCAC800645D5700645D5600807A7400AFABA800B7B5B1009C9793006761
      5B00645D560087817C000000000000000000000000000000000060C175002CB0
      48002CB048002CB048002CB048002CB048002CB048002CB048002CB048002CB0
      48002CB0480062C27600000000000000000000000000DEDEDE00585858004F4F
      4F004D4D4D004343430054545400595959005959590053535300525252005959
      5900595959005E5E5E00DDDDDD00000000000000000000000000E6A16F00E385
      4100E3854100E3854100E3854100E3854100E3854100E3854100E3854100E385
      4100E3854100E7A36F0000000000000000000000000000000000000000000000
      000000000000D7D7D4007B757000645D5600645D5600645D5600645D5600665F
      5800A6A29F0000000000000000000000000000000000000000000000000081CF
      91002CAE47002CB048002CB048002CB048002CB048002CB048002CB048002CAF
      470084CF93000000000000000000000000000000000000000000000000000000
      000000000000C2C2C200C6C6C6000000000000000000C5C5C500C1C1C1000000
      000000000000000000000000000000000000000000000000000000000000EDB5
      8E00E0843F00E3854100E3854100E3854100E3854100E3854100E3854100E083
      4100EDB68F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000DAD9D700BCB9B600B5B2AF00C7C4C2000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D8EFDE0084D095004FBA650032B04E0032B04E004FBA650086D09700D9EF
      DE00000000000000000000000000000000000000000000000000000000000000
      000000000000D6D6D60066666600989898009898980065656500D6D6D6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F8E7DB00ECB89100E5985F00E1874700E1874700E5985F00EDB89300F8E8
      DD0000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000FFFF000000000000
      C003000000000000C003000000000000C003000000000000C003000000000000
      C003000000000000C003000000000000C003000000000000C003000000000000
      C003000000000000C003000000000000C007000000000000C00F000000000000
      FFFF000000000000FFFF0000000000009FFFF00FE007F00F0FFFE007E007E007
      03FFC003E007C003800F8001E0078001C0030000E0070000C0C10000E0070000
      E3F10000E0070000E3F80000C0030000E7F80000C0030000E7F80000C0030000
      E7F80000C0030000E3F90000C0030000F1F1800180018001F003C0038001C003
      F807E007F99FE007FE1FF00FF81FF00F00000000000000000000000000000000
      000000000000}
  end
end