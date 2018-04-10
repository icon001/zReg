unit uCommon;

interface

uses
  SysUtils, Classes;

type
  TAlarmList = Class(TComponent)
  private
    FOnEcuID: string;
  public
    AlarmList : TStringList;
    property EcuID : string read FOnEcuID write FOnEcuID;
  end;

  TDataModule1 = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

  Rcv_MsgNo     : Char;
  Send_MsgNo    : Integer;
  ComBuff       : String;   // 데이터 수신용
  IsConfigMCU   : Boolean;  // MCU 설정중인가?
  CurrentType   : string;   //현재 작업모드 기기타입 MCU/ECU/ICU
  RegCardMode   : Boolean;  // 카드등록 모드
  ErrorMessage : string; //통신 에러 데이터
  IsStop        : Boolean;  //프로세스 종료

    bMCUIDCheck : Boolean; //MCUIDCheck 여부
    bUsedDeviceCheck : Boolean; //확장기사용 갯수 체크
    bUsedAlarmCheck : Boolean; //알람표시기 체크
    bLinkusIDCheck : Boolean;  //시스템아이디 체크
    bLinksTelNoCheck :Boolean;  //방범 전송 전화번호 체크
    bRingCountCheck : Boolean;  //전화 거는 횟수 체크
    bControlDialTime : Boolean; //관제센터 Dial Time
    bWiznetCheck : Boolean;     //IP 및 체크
    bSysInfoCheck : Boolean;    //시스템정보 체크
    bSysInfo2Check : Boolean;   //출입문정보체크
    bPortCheck : Boolean;       //포트체크
    bCardReaderCheck : Boolean; //리더기 체크
    bCardReaderTypeCheck : Boolean; //리더기 타입 체크
    bVERCheck : Boolean; //버전체크
    bReaderVERCheck : Boolean;  //리더기 버젼 체크
    bSearch : Boolean;   //조회 후 통신환경 체크 해야됨
    bErrorCheck : Boolean; //통신 에러
    bECUStatusCheck : Boolean; //MCU일때 ECU 체크 하기 위함
    bECUCommState : Boolean;// ECU 통신상태 체크하기 위함
    bReaderCOMCheck : Boolean; //리더기 통신상태 체크하기 위함
    bIndicatorCheck : Boolean; //상황표시 체크하기 위함
    bDoorSch : Boolean; //스케줄 데이터 체크
    bSended : Boolean; //송신중인지 체크
    //bCardDownLoad : Boolean; //카드 다운로드
    DelayTime : integer;
    ComCheckDelayTime : integer;
    LoopCount : integer ; //에러 대기 횟수
    LANTime : integer;
    LANLoop : integer;
    TCPConf : string; //TCPIP,TCPPort
    ConnectMode : Integer; //TCP,RS232
    ServerMode : Integer;  //Server,Client
    ComPort : integer;
    LogMode : Integer;
    LogFileName : string;
    StopConnection : Boolean;
    DoCloseWinsock : Boolean;
    TraceDebug : integer;
    nFileSeq : integer;

  G_bNodeConnectChecked : Boolean;
  G_nNodeConnectDelayTime : integer = 30;

  //S-Tec 추가 되면서 생성되는 부분
  G_nProgramType : integer; //0:일반,1:Stec
  G_nIDLength : integer=7;
//const DelayTime = 600;
//const ComCheckDelayTime = 500;
//const  LoopCount = 12 ; //에러 대기 횟수

  DeviceAlarmList : TStringList; //알람 내역 보관메모리





//{$DEFINE DEBUG}


implementation

{$R *.dfm}


end.
