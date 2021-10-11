unit MainForm;

interface

{
  ***************************************************************************
  ***************************************************************************
  ************* LPT Control Form with LPTControl.dll by .dL *****************
  *********************** (c) 2012-2013, iamdl.tk ***************************
  ***************************************************************************
  **************************** ICQ: 360001595 *******************************
  ***************************************************************************
  ***************************************************************************
}

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XPMan, ExtCtrls;

type
  TLPTForm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button7: TButton;
    XPManifest1: TXPManifest;
    GroupBox1: TGroupBox;
    Port0State: TLabel;
    Port1State: TLabel;
    Port2State: TLabel;
    Port3State: TLabel;
    Port4State: TLabel;
    Port5State: TLabel;
    Port6State: TLabel;
    Port7State: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    GroupBox2: TGroupBox;
    StateChangeDd: TComboBox;
    SwitchPorts: TButton;
    GroupBox3: TGroupBox;
    BytesE: TEdit;
    StatusLabel: TLabel;
    Bevel: TBevel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Refresh_Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure StateChangeDdChange(Sender: TObject);
    procedure SwitchPortsClick(Sender: TObject);
  private
  public
  end;

var
  LPTForm: TLPTForm;
  PortStatusRefresh: TTimer;

const
 LPT_ALREADY_STARTED  = 0;
 LPT_STARTED          = 1;
 LPT_NOT_STARTED      = 2;
 LPT_PAUSED           = 3;
 LPT_ALREADY_PAUSED   = 4;
 LPT_STOPPED          = 5;
 LPT_STATUS_ACTIVE    = 6;
 LPT_REFRESH_INTERVAL = 25;

 LPT_DLL_NAME = 'LPTControl.dll';


implementation

function StartLPTControl(Port: Integer): Integer; stdcall; external LPT_DLL_NAME;
function PauseLPTControl(Pause: Boolean): Integer; stdcall; external LPT_DLL_NAME;
function StopLPTControl: Integer; stdcall; external LPT_DLL_NAME;
function ShowBytesState: String; stdcall; external LPT_DLL_NAME;
function IsPortOn(Port: Byte): Boolean; stdcall; external LPT_DLL_NAME;
function SwitchPortStatus(Port: Byte; P_ON: Boolean): Boolean; stdcall; external LPT_DLL_NAME;

{$R *.dfm}

function Get_LPT_Const_Info(Input: Integer): String;
begin
 case Input of
  LPT_ALREADY_STARTED: Result := 'LPT already started!';
  LPT_STARTED:         Result := 'LPT successfully started!';
  LPT_NOT_STARTED:     Result := 'LPT not started';
  LPT_PAUSED:          Result := 'LPT paused';
  LPT_ALREADY_PAUSED:  Result := 'LPT already paused';
  LPT_STOPPED:         Result := 'LPT stopped and destroyed!';
  LPT_STATUS_ACTIVE:   Result := 'LPT active';
 else
                       Result := 'Unknown state';
 end;
end;

function LPT_StrIntToStr(Input: String): String;
begin
 if Input = '0' then
  Result := 'OFF'
 else
  Result := 'ON';
end;

procedure TLPTForm.Refresh_Timer(Sender: TObject);
var
 I: Integer;
begin
if ShowBytesState = '0' then begin
 BytesE.Text := Get_LPT_Const_Info(LPT_NOT_STARTED) + ' or ' + Get_LPT_Const_Info(LPT_PAUSED);
 Exit;
end;
 PortStatusRefresh.Enabled := False;
 BytesE.Text := ShowBytesState;

for I := 0 to 7 do
 with TLabel(FindComponent(Format('Port%sState', [IntToStr(I)]))) do
  Caption := LPT_StrIntToStr(BytesE.Text[I + 1]);

 PortStatusRefresh.Enabled := True;
end;

procedure TLPTForm.StateChangeDdChange(Sender: TObject);
begin
 case StateChangeDd.ItemIndex of
 0: SwitchPorts.Enabled := False;
 else
  SwitchPorts.Enabled := True;
 end;
end;

procedure TLPTForm.SwitchPortsClick(Sender: TObject);
var
 PortPos: Integer;
begin
 PortPos := StateChangeDd.ItemIndex - 1;
 SwitchPortStatus(PortPos, not IsPortOn(PortPos));
end;

procedure Create_Refresh_Timer;
begin
 if PortStatusRefresh <> nil then Exit;
 PortStatusRefresh := TTimer.Create(nil);
 PortStatusRefresh.Interval := LPT_REFRESH_INTERVAL;
 PortStatusRefresh.OnTimer := LPTForm.Refresh_Timer;
 PortStatusRefresh.Enabled := True;
end;

procedure TLPTForm.Button1Click(Sender: TObject);
begin
 StatusLabel.Caption := 'Status: ' +  Get_LPT_Const_Info(StartLPTControl(888));
end;

procedure TLPTForm.Button2Click(Sender: TObject);
begin
 StatusLabel.Caption := 'Status: ' +  Get_LPT_Const_Info(PauseLPTControl(True));
end;

procedure TLPTForm.Button3Click(Sender: TObject);
begin
 StatusLabel.Caption := 'Status: ' +  Get_LPT_Const_Info(StopLPTControl);
end;

procedure TLPTForm.Button7Click(Sender: TObject);
begin
 StatusLabel.Caption := 'Status: ' +  Get_LPT_Const_Info(PauseLPTControl(False));
end;

procedure TLPTForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 StopLPTControl;
 FreeAndNil(PortStatusRefresh);
end;

procedure TLPTForm.FormCreate(Sender: TObject);
begin
 Create_Refresh_Timer;
end;

end.
