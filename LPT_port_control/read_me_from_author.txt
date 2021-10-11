*****************************************************************************

********************************* [ENGLISH] *********************************

*****************************************************************************

You can use my "LPTControl.dll" not only with Delphi, it's compatible with ex. C#, C++ and so on.

Project should include:
 * inpout32.dll
 * LPTControl.dll

------------------ Constants (Delphi code): ------------------

 * Return values from some functions (the meaning is in each constant name)
 
 LPT_ALREADY_STARTED  = 0;
 LPT_STARTED          = 1;
 LPT_NOT_STARTED      = 2;
 LPT_PAUSED           = 3;
 LPT_ALREADY_PAUSED   = 4;
 LPT_STOPPED          = 5;
 LPT_STATUS_ACTIVE    = 6;
 -> LPT active after pause

 LPT_REFRESH_INTERVAL = 25;
 -> Do not change to lower time
 --> Refresh interval from "ShowBytesState" function

 LPT_DLL_NAME         = 'LPTControl.dll';


------------------ Functions and descriptions (Delphi code): ------------------ 

function StartLPTControl(Port: Integer): Integer; stdcall; external LPT_DLL_NAME;
--> Used to start the listening/writing function from DLL

function PauseLPTControl(Pause: Boolean): Integer; stdcall; external LPT_DLL_NAME;
--> Used to pause/resume the listening/writing function after start

function StopLPTControl: Integer; stdcall; external LPT_DLL_NAME;
--> Used to stop the listening/writing function after start

function ShowBytesState: String; stdcall; external LPT_DLL_NAME;
--> Used to show the bits state from all ports after start
---> ex: 1010000
----> Meaning: Port 0 and 2 are ON, others are OFF

function IsPortOn(Port: Byte): Boolean; stdcall; external LPT_DLL_NAME;
--> Used to get status from any (but only one) port after start

function SwitchPortStatus(Port: Byte; P_ON: Boolean): Boolean; stdcall; external LPT_DLL_NAME;
--> Used to set any port status ON/OFF








*****************************************************************************

********************************* [�������] *********************************

*****************************************************************************

���-�� "LPTControl.dll" ����� ������������ �� ������ � Delphi, �� � � C#, C++ � �.�..
���������� ����� �������� ��������� � ������������� ������� � �������.

��� ������ ������ ���������:
 * inpout32.dll
 * LPTControl.dll


------------------ ��������� (Delphi code): ------------------

 * ��������, ������� ���������� ��������� ������������� �������
 
 LPT_ALREADY_STARTED  = 0;
 -> LPT ��� �������

 LPT_STARTED          = 1;
 -> LPT ������� �������

 LPT_NOT_STARTED      = 2;
 -> LPT �� ������� (������)

 LPT_PAUSED           = 3;
 -> LPT �������������

 LPT_ALREADY_PAUSED   = 4;
 -> LPT ��� �������������

 LPT_STOPPED          = 5;
 -> LPT ���������� / �� �������

 LPT_STATUS_ACTIVE    = 6;
 -> LPT �������, ����� ����������� ����� 

 LPT_REFRESH_INTERVAL = 25;
 -> �� ������ �� ����� ������
 --> �������� ���������� ������� "ShowBytesState"

 LPT_DLL_NAME         = 'LPTControl.dll';


------------------ ������� � �� �������� (Delphi code): ------------------ 

function StartLPTControl(Port: Integer): Integer; stdcall; external LPT_DLL_NAME;
--> ������������ ��� ������ ������ ������ � ��������� ������/������ � ����

function PauseLPTControl(Pause: Boolean): Integer; stdcall; external LPT_DLL_NAME;
--> ������������ ��� �����/����������� ������ ������ ����� ������

function StopLPTControl: Integer; stdcall; external LPT_DLL_NAME;
--> ������������ ��� ��������� ������ ������/������ ����� ������

function ShowBytesState: String; stdcall; external LPT_DLL_NAME;
--> ������������ ��� ��������� ������� ������� �����
---> ��������: 1010000
----> ��������: ���� 0 � 2 � ��������� ���., � ��� ��������� ����� ��������� ����.

function IsPortOn(Port: Byte): Boolean; stdcall; external LPT_DLL_NAME;
--> ������������ ��� ��������� ������� ������������� �����

function SwitchPortStatus(Port: Byte; P_ON: Boolean): Boolean; stdcall; external LPT_DLL_NAME;
--> ������������ ��� ��������� ������� ������������� ����� �� ���. ��� ����.


------------------------------------------------------------------------------
.dL, December, 2013
ICQ: 360001595