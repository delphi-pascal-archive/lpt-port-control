program LPT_Control_with_dll;

uses
  Forms,
  MainForm in 'MainForm.pas' {LPTForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TLPTForm, LPTForm);
  Application.Run;
end.
