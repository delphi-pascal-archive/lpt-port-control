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

********************************* [РУССКИЙ] *********************************

*****************************************************************************

Длл-ку "LPTControl.dll" можно использовать не только в Delphi, но и в C#, C++ и т.п..
Достаточно будет обьявить константы и нижеописанные функции в проекте.

Ваш проект должен содержать:
 * inpout32.dll
 * LPTControl.dll


------------------ Константы (Delphi code): ------------------

 * Значения, которые возвращают некоторые нижеописанные функции
 
 LPT_ALREADY_STARTED  = 0;
 -> LPT уже запущен

 LPT_STARTED          = 1;
 -> LPT успешно запущен

 LPT_NOT_STARTED      = 2;
 -> LPT не запущен (ошибка)

 LPT_PAUSED           = 3;
 -> LPT приостановлен

 LPT_ALREADY_PAUSED   = 4;
 -> LPT уже приостановлен

 LPT_STOPPED          = 5;
 -> LPT остановлен / не активен

 LPT_STATUS_ACTIVE    = 6;
 -> LPT активен, после деактивации паузы 

 LPT_REFRESH_INTERVAL = 25;
 -> Не менять на время меньше
 --> Интервал обновления функции "ShowBytesState"

 LPT_DLL_NAME         = 'LPTControl.dll';


------------------ Функции и их описание (Delphi code): ------------------ 

function StartLPTControl(Port: Integer): Integer; stdcall; external LPT_DLL_NAME;
--> Используется для старта работы модуля с функциями чтения/записи в порт

function PauseLPTControl(Pause: Boolean): Integer; stdcall; external LPT_DLL_NAME;
--> Используется для паузы/продолжения работы модуля после старта

function StopLPTControl: Integer; stdcall; external LPT_DLL_NAME;
--> Используется для остановки модуля чтения/записи после старта

function ShowBytesState: String; stdcall; external LPT_DLL_NAME;
--> Используется для получения статуса каждого порта
---> Например: 1010000
----> Значение: Порт 0 и 2 в состоянии ВКЛ., а все остальные имеют состояние ВЫКЛ.

function IsPortOn(Port: Byte): Boolean; stdcall; external LPT_DLL_NAME;
--> Используется для получения статуса определенного порта

function SwitchPortStatus(Port: Byte; P_ON: Boolean): Boolean; stdcall; external LPT_DLL_NAME;
--> Используется для изменения статуса определенного порта на ВКЛ. или ВЫКЛ.


------------------------------------------------------------------------------
.dL, December, 2013
ICQ: 360001595