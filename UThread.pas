// Base Thread Class
// Date 05.09.21

// NOTE: Use Thread.Start instead of Thread.Resume (deprecated)

// 26.07.12 nk add THREAD_INET_ALIVE to close Internet handle if connection is frozen
// 10.01.17 nk del all 3D frustum culling stuff
// 05.09.21 nk add THREAD_INET_ONLINE and improved CheckInternetAvailable

unit UThread;

interface

uses //23.07.12 nk add WinInet / mov UInternet to implementation
  Classes, SysUtils, Windows, WinInet;

const
  THREAD_CULL_TIME   = 1000; //23.10.13 nk add [ms]
  THREAD_LOOP_TIME   = 2000; //[ms]
  THREAD_TASK_NONE   = -1;
  THREAD_ALIVE_CLEAR = 0;    //26.07.12 nk add ff
  THREAD_ALIVE_LOOPS = 4;
  THREAD_HEART_BEAT  = 0;
  THREAD_LAN_CHECK   = 1;
  THREAD_WAN_CHECK   = 2;
  THREAD_INET_ALIVE  = 3;    //26.07.12 nk add
  THREAD_INET_ONLINE = 4;    //05.09.21 nk add

  //5..n reserved for future use

type
  TBaseThread = class(TThread)
  private
    LoopTime: Integer;
    LoopTask: Integer;
    AliveCount: Integer; //26.07.12 nk add ff
    AliveInet: HInternet;
  protected
    TaskCardinal: Cardinal;
    TaskString: string;
    procedure Execute; override;
  public
    constructor Create; virtual;
    procedure SetLoopTime(NewLoopTime: Integer); virtual;
    procedure SetLoopTask(NewLoopTask: Integer); virtual;
    procedure SetAliveCount(NewAliveCount: Integer); virtual; //26.07.12 nk add ff
    procedure SetAliveInet(NewAliveInet: HInternet); virtual;
    function GetLoopTime: Integer; virtual;
    function GetAliveCount: Integer; virtual;                 //26.07.12 nk add
    function GetTaskCardinal: Cardinal; virtual;
    function GetTaskString: string; virtual;
  end;

implementation

uses UInternet;

constructor TBaseThread.Create;
begin
  inherited Create(True); //True=CreateSuspended
  LoopTime        := THREAD_LOOP_TIME;
  LoopTask        := THREAD_TASK_NONE;
  AliveCount      := THREAD_ALIVE_CLEAR; //26.07.12 nk add ff
  AliveInet       := nil;
  TaskCardinal    := 0;
  TaskString      := '';
  FreeOnTerminate := True;
end;

procedure TBaseThread.Execute;
var //53//05.09.21 nk add THREAD_INET_ONLINE
  cres: Cardinal;
  sres: string;
begin
  while not Terminated do begin
    case LoopTask of
      THREAD_HEART_BEAT: begin
        Windows.Beep(3000, 5);                  //heartbeat for test
      end;

      THREAD_LAN_CHECK: begin
        sres := GetInetConnection(cres, False); //get LAN status
        TaskString   := sres;
        TaskCardinal := cres;
      end;

      THREAD_WAN_CHECK: begin
        sres := GetInetConnection(cres, True);  //get WAN status (Internet connection)
        TaskString   := sres;
        TaskCardinal := cres;
      end;

      THREAD_INET_ALIVE: begin                  //26.07.12 nk add - check if Internet connection is not frozen
        Inc(AliveCount);
        if AliveCount > THREAD_ALIVE_LOOPS then begin
          Windows.Beep(2000, 500);
          InternetCloseHandle(AliveInet);       //close Internet handle to release connection
        end;
      end;

      THREAD_INET_ONLINE: begin                 //05.09.21 nk add improved function
        if CheckInternetOnline then
          TaskCardinal := INET_WAN
        else
          TaskCardinal := INET_OFFLINE;
      end;

      //5..n reserved for future use
    end;

    Sleep(LoopTime);
  end;
end;

procedure TBaseThread.SetLoopTask(NewLoopTask: Integer);
begin //set task number to execute
  LoopTask := NewLoopTask;
end;

procedure TBaseThread.SetLoopTime(NewLoopTime: Integer);
begin //set loop delay time [ms]
  LoopTime := NewLoopTime;
end;

procedure TBaseThread.SetAliveInet(NewAliveInet: HInternet);
begin //26.07.12 nk add - set Internet connection handle
   AliveInet := NewAliveInet;
end;

procedure TBaseThread.SetAliveCount(NewAliveCount: Integer);
begin //26.07.12 nk add - set anti-freeze counter
  AliveCount := NewAliveCount;
end;

function TBaseThread.GetAliveCount: Integer;
begin //26.07.12 nk add - get anti-freeze counter
  Result := AliveCount;
end;

function TBaseThread.GetLoopTime: Integer;
begin
  Result := LoopTime;
end;

function TBaseThread.GetTaskCardinal: Cardinal;
begin
  Result := TaskCardinal;
end;

function TBaseThread.GetTaskString: string;
begin
  Result := TaskString;
end;

end.
