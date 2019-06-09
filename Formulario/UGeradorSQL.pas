unit UGeradorSQL;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TFrGeradorSQL = class(TForm)

    Panel1: TPanel;
    Label1: TLabel;
    ME_Colunas: TMemo;
    Label2: TLabel;
    ME_Tabelas: TMemo;
    Label3: TLabel;
    ME_Condicoes: TMemo;
    BB_GerarSQL: TButton;
    Bevel1: TBevel;
    Label4: TLabel;
    ME_SQL: TMemo;
    procedure BB_GerarSQLClick(Sender: TObject);

  private

    FColunaSQL,
    FTabelaSQL,
    FCondicaoSQL : array of string;

    const FConteudoMemoColuna : string = 'COLUNA';
    const FConteudoMemoTabela : string = 'TABELA';
    const FConteudoMemoCondicao : string = 'CONDICAO';

  public

    function ValidarMemo(TipoValidacao : string) : Boolean;

    procedure AdicionarColuna(PosicaoLinha : integer);
    procedure AdicionarTabela(PosicaoLinha : integer);
    procedure AdicionarCondicao(PosicaoLinha : integer);
    function GerarSQL : Boolean;

  end;

var
  FrGeradorSQL: TFrGeradorSQL;

implementation

{$R *.dfm}

procedure TFrGeradorSQL.BB_GerarSQLClick(Sender: TObject);
begin
  GerarSQL;
end;

function TFrGeradorSQL.ValidarMemo(TipoValidacao: string) : Boolean;
var
  LinhasMemoColunas,
  LinhasMemoTabelas,
  LinhasMemoCondicoes : Boolean;
begin

  if TipoValidacao = FConteudoMemoColuna then
  begin
    LinhasMemoColunas := length(Trim(ME_Colunas.Lines.Text)) > 0;

    Result := LinhasMemoColunas;
  end
  else if TipoValidacao = FConteudoMemoTabela then
  begin
    LinhasMemoTabelas := length(Trim(ME_Tabelas.Lines.Text)) > 0;

    Result := LinhasMemoTabelas;
  end
  else if TipoValidacao = FConteudoMemoCondicao then
  begin
    LinhasMemoCondicoes := length(Trim(ME_Condicoes.Lines.Text)) > 0;

    Result := LinhasMemoCondicoes;
  end;

end;

procedure TFrGeradorSQL.AdicionarColuna(PosicaoLinha : integer);
begin
  if length(Trim(ME_Colunas.Lines.Strings[PosicaoLinha])) > 0 then
  begin
    SetLength(FColunaSQL, Length(FColunaSQL) + 1);

    FColunaSQL[Length(FColunaSQL) - 1] := ME_Colunas.Lines.Strings[PosicaoLinha];
  end;
end;

procedure TFrGeradorSQL.AdicionarTabela(PosicaoLinha: Integer);
begin
  if length(Trim(ME_Tabelas.Lines.Strings[PosicaoLinha])) > 0 then
  begin
    SetLength(FTabelaSQL, Length(FTabelaSQL) + 1);

    FTabelaSQL[Length(FTabelaSQL) - 1] := ME_Tabelas.Lines.Strings[PosicaoLinha];
  end;
end;

procedure TFrGeradorSQL.AdicionarCondicao(PosicaoLinha: Integer);
begin
  if length(Trim(ME_Condicoes.Lines.Strings[PosicaoLinha])) > 0 then
  begin
    SetLength(FCondicaoSQL, Length(FCondicaoSQL) + 1);

    FCondicaoSQL[Length(FCondicaoSQL) - 1] := ME_Condicoes.Lines.Strings[PosicaoLinha];
  end;
end;

function TFrGeradorSQL.GerarSQL : Boolean;
var
  i : integer;

  LinhaSelect,
  LinhaFrom,
  LinhaWhere : string;
begin

  if Not ValidarMemo(FConteudoMemoTabela) then
  begin
    MessageDlg('Necessário preenher o campo Tabela!', mtWarning, [mbOK], 0);
    Exit
  end
  else
  begin
    for i := 0 to ME_Tabelas.Lines.Count -1 do
    begin
      AdicionarTabela(i);
    end;
  end;

  if ValidarMemo(FConteudoMemoColuna) then
  begin
    for i := 0 to ME_Colunas.Lines.Count -1 do
    begin
      AdicionarColuna(i);
    end;
  end;

  if ValidarMemo(FConteudoMemoCondicao) then
  begin
    for i := 0 to ME_Condicoes.Lines.Count -1 do
    begin
      AdicionarCondicao(i);
    end;
  end;


  try

    if Length(FColunaSQL) = 0 then
      LinhaSelect := 'SELECT * '
    else
    begin
      for i := 0 to Length(FColunaSQL) -1 do
      begin
        if LinhaSelect = EmptyStr then
          LinhaSelect := 'SELECT ' + FColunaSQL[i]
        else
          LinhaSelect := LinhaSelect + ', ' + FColunaSQL[i];
      end;
    end;

    for i := 0 to Length(FTabelaSQL) -1 do
    begin
      if LinhaFrom = EmptyStr then
        LinhaFrom := 'FROM ' + FTabelaSQL[i]
      else
        LinhaFrom := LinhaFrom + ', ' + FTabelaSQL[i];
    end;

    for i := 0 to Length(FCondicaoSQL) -1 do
    begin
      if LinhaWhere = EmptyStr then
        LinhaWhere := 'WHERE ' + FCondicaoSQL[i]
      else
        LinhaWhere := LinhaWhere + ' AND ' + FCondicaoSQL[i];
    end;

    ME_SQL.Lines.Clear;
    ME_SQL.Lines.Add(LinhaSelect);
    ME_SQL.Lines.Add(LinhaFrom);
    ME_SQL.Lines.Add(LinhaWhere);

    Finalize(FColunaSQL);
    Finalize(FTabelaSQL);
    Finalize(FCondicaoSQL);

  except
    MessageDlg('Verifique as Colunas e Tabelas informadas!', mtWarning, [mbOK], 0);
  end;

end;

end.
