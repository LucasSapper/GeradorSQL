program GeradorSQL;

uses
  Vcl.Forms,
  UGeradorSQL in 'Formulario\UGeradorSQL.pas' {FrGeradorSQL};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrGeradorSQL, FrGeradorSQL);
  Application.Run;
end.
