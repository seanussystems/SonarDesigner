// Internet, Browser and Network Functions
// Date 19.06.22

/// See also UBrowser
///
/// Standard Web Browser is TWebBrowser based on Microsoft Internet Explorer
/// Supported functionality (like PDF or Flash viewer) depends on IE version,
/// settings and installed add-ons and plugins
///
/// IMPORTANT: Internet and email url's are case sensitive!
///
/// NOTE: Within mailto URLs, the characters '?', '=', '&' are reserved.
///       The standard URL encoding mechanisms ('%' followed by a two-digit HEX number)
///       must be used in certain cases.
///
/// NOTE: Within the mailto body, spaces '%20' in URL's must be replaced by '%2520' like:
///       Online Guide can be accessed here http://www.simwalk.com/manuals/SimWalk%2520User%2520Manual.htm

// 05.03.08 nk opt replace string fragments with text or numeric constants
// 05.03.08 nk opt convert Unix line feeds to Windows CRLF on url download
// 01.08.08 nk add web browser functionality like zoom and border
// 18.09.09 nk add DNS server and network functions
// 22.11.09 nk add ComObj and SendMail using MSMAPI OLE interface
// 06.01.10 nk add unit Sockets and improved GetIpFromHost using TTcpClient
// 01.10.10 nk upd to Delphi XE (2011) Unicode (some parts remain ANSI)
// 25.11.10 nk add Internet support state='Internet' and Internet-IP (WAN)
// 29.11.10 nk add GetMACAddress to get the MAC address of the Network adapter
// 29.11.11 nk fix replace reserved characters in email body by its %-constants
// 18.12.11 nk add DownloadFileEx for file download w/o the need of Internet Explorer
// 20.12.11 nk add Download icon (32x32x256) as internal resource
// 25.04.12 nk opt expand file names (with path) from MAXBYTE to MAX_PATH characters
// 26.07.12 nk opt file download from Internet / check if connection is not frozen
// 26.07.12 nk add show kBytes downloaded and transfer rate [kBytes/s]
// 21.01.13 nk opt use Thread.Start instead of Thread.Resume (deprecated)
// 04.05.13 nk add global flag InetAbort to abort a file download by user immediately
// 19.02.14 nk upd to Delphi XE3 (VER240 Version 24)
// 22.04.15 nk upd to Delphi XE7 Update 1 and Indy 10.6 / remove Sockets and IdTCPClient
// 26.04.15 nk opt use WinSock instead of Sockets in improved GetIpFromHost
// 27.02.16 nk opt DownloadFile/Ex - DeleteUrlCacheEntry do not work as desired
// 08.03.17 nk add GetInetTime - get Internet Time from NTP time servers
// 05.09.21 nk add improved CheckInternetOnline

unit UInternet;

interface
     //V5//add IdBaseComponent, IdComponent, IdUDPBase, IdUDPClient, and IdSNTP
uses //xe7//add AnsiStrings / del Sockets, ScktComp, IdTCPConnection, and IdTCPClient
  Windows, Messages, Classes, Forms, Graphics, SysUtils, TypInfo, Variants, Math,
  Registry, WinInet, WinSock, UrlMon, ShellApi, ShlObj, ShDocVw, ActiveX, NB30,
  AnsiStrings, StrUtils, ComObj, OleCtrls, IdHTTP, IdBaseComponent, IdComponent,
  IdUDPBase, IdUDPClient, IdSNTP, ComCtrls, ExtCtrls, Dialogs, UGlobal, USystem, 
  UFile, UThread;

const
  INET_ERR             = 1;       //05.03.08 nk add
  INET_OFFLINE         = 0;       //type of Internet connection
  INET_MODEM           = 1;
  INET_LAN             = 2;
  INET_PROXY           = 4;
  INET_ONLINE          = 5;
  INET_WAN             = 6;       //25.11.10 nk add
  INET_RAS             = 16;
  INET_WSA             = $0101;   //05.03.08 nk add
  INET_ZOOM_MIN        = 50;      //31.07.08 nk add ff
  INET_ZOOM_NORM       = 100;
  INET_ZOOM_MAX        = 400;
  INET_CACHE_PAGES     = 20;      //01.08.08 nk add - max sites to clear from cache
  INET_DELAY           = 1000;    //receive timeout = 1sec //V5//08.03.17 nk mov ff from GetInetTime
  TIME_PORT            = 123;     //NTP time server port (UDP)
  TEST_DATE            = 42669.0; //27.10.2016 00:00:00.000

  MAX_IPADDR_LEN       = 15;      //17.11.09 nk add
  MAX_HOSTNAME_LEN     = 128;     //18.09.09 nk add ff
  MAX_DOMAIN_NAME_LEN  = 128;
  MAX_SCOPE_ID_LEN     = 256;
  MAX_EXIT_LOOPS       = 1000;    //18.09.09 nk add
  DEF_PORT_NUM         = 1555;    //V5//26.03.15 nk add
  MIN_PORT_NUM         = 1025;    //26.11.09 nk add ff socket port range
  MAX_PORT_NUM         = 65535;

  HTMLID_FIND          = 1;
  HTMLID_VIEWSOURCE    = 2;
  HTMLID_OPTIONS       = 3;

  INET_BORDER_OFF      = '';                            //01.08.08 nk add ff
  INET_MAC_DEL         = '-';                           //29.11.10 nk add
  INET_HOST_DEL        = '\';                           //14.11.09 nk add ff
  INET_HOST_START      = '\\';
  INET_HTTP_DEL        = '/';                           //25.11.10 nk add ff
  INET_HTTP_START      = '//';
  INET_AMPER           = '%26';                         //'&' 29.11.11 nk add ff
  INET_EQUAL           = '%3D';                         //'=' reserved chars in mailto:body
  INET_QUEST           = '%3F';                         //'?' complies to UGlobal cConstants
  HTML_NEWLINE         = '<br />';                      //06.09.13 nk add
  INET_NEWLINE         = '%0D%0A';                      //17.04.07 nk mov from UOffice
  INET_SPEED_UNIT      = 'Mbit/s';                      //29.11.10 nk add
  INET_BORDER_ON       = 'none';
  INET_HTTP_HEADER     = 'http://';
  INET_FILE_HEADER     = 'file://';                     //06.09.13 nk add
  INET_LOCALE_HEADER   = 'file:///';                    //29.07.08 nk add
  INET_WEB_HEADER      = 'www.';
  INET_PROTOCOL_NORMAL = 'http:';
  INET_PROTOCOL_SECURE = 'https:';
  INET_PROTOCOL_LOCALE = 'file:';
  INET_PROTOCOL_MAIL   = 'mailto:';
  INET_PAGE_GOTO       = 'Goto: ';                      //02.08.08 nk add
  INET_PAGE_BLANK      = 'about:blank';                 //01.08.08 nk add
  INET_MAIL_BODY       = '&body=';                      //05.03.08 nk add ff
  INET_MAIL_SUBJECT    = '?subject=';                   //'&', '=', and '?' are reserved in mailto:url
  INET_FAVORITE_FILE   = '.url';
  INET_FAVORITE_SECT   = 'DEFAULT';
  INET_FAVORITE_KEY    = 'BASEURL';
  INET_FILE_PROTOCOL   = 'FILE';                        //29.07.08 nk add ff
  INET_HTML_PROTOCOL   = 'HTML';
  INET_NONE_PROTOCOL   = 'ABOUT';                       //02.08.08 nk add
  INET_TEXT_PROTOCOL   = 'Protocol';
  INET_TEXT_SECURE     = ' (SSL)';
  INET_TEXT_LOCALE     = ' (local)';                    //19.11.10 nk old=lokal
  INET_TEXT_DOWNLOAD   = 'Download ';                   //18.12.11 nk add
  INET_KEY_VERSION     = 'Version';                     //20.09.09 nk add
  INET_KEY_ACCOUNT     = 'srvcomment';                  //24.11.10 nk add
  INET_ETHERNET        = 'Ethernet';                    //29.11.10 nk add
  INET_FORM_DOWNLOAD   = '%d of %d kB (%d kB/s)';       //11.03.16 nk add
  INET_SHELL_OPEN      = 'Shell DocObject View';
  INET_SHELL_SERVER    = 'Internet Explorer_Server';
  INET_BROWSER_OPEN    = 'InternetBrowser.exe';
  INET_ORG_FAVORITES   = 'DoOrganizeFavDlg';
  INET_GET_NETPARAMS   = 'GetNetworkParams';             //18.09.09 nk add
  INET_API_NCPACPL     = ', Control_RunDLL ncpa.cpl,,4'; //05.03.08 nk add ff
  INET_API_INETCPL     = ', Control_RunDLL inetcpl.cpl';
  INET_LOCALHOST       = '127.0.0.1';
  INET_MAC_ADDR        = '00-00-00-00-00-00';            //29.11.10 nk add
  INET_INVALID_ADDR    = 'Invalid IP address';
  INET_CONNECTION      = 'Network connection: ';         //16.12.11 nk add
  INET_TRANSFER        = 'Internet File Transfer';       //20.12.11 nk add
  INET_DEFAULP_PAGE    = 'https://www.google.com';       //05.09.21 nk old=http
  INET_GETMYIP_PAGE    = 'https://ip-lookup.net/'; //nk//http://iplookup.flashfxp.com'; //25.11.10 nk add ff
//or as alternative    =  'http://www.whatismyip.com/automation/n09230945.asp';
  INET_REG_KEY         = 'Software\Microsoft\Internet Explorer'; //20.09.09 nk add
  INET_START_PATH      = 'Software\Microsoft\Internet Explorer\Main';
  INET_LANMAN_PATH     = 'System\CurrentControlSet\Services\LanmanServer\Parameters'; //24.11.10 nk add
  INET_HTML_BROWSER    = 'htmlfile\shell\open\command';  //22.11.10 nk add
  INET_START_PAGE      = 'Start Page';
  INET_IEXPLORE        = 'iexplore.exe';                 //22.11.10 nk add
  INET_MAPI_SESSION    = 'MSMAPI.MAPISession';           //22.11.09 nk add ff
  INET_MAPI_MESSAGE    = 'MSMAPI.MAPIMessages';
  INET_INVALID_CHARS   = [' ','ä','ö','ü','ß','[',']','(',')',':'];

  //command IDs handled by 'Shell DocObject View' (used by BrowserMessage)
  INET_FILE_PAGESETUP           = 259;
  INET_FILE_PRINT               = 260;
  INET_FILE_NEWWINDOW           = 275;
  INET_FILE_PRINTPREVIEW        = 277;
  INET_FILE_NEWMAIL             = 279;
  INET_FILE_SENDPAGE            = 282;
  INET_FILE_SENDLINK            = 283;
  INET_FILE_SENDDESKTOPSHORTCUT = 284;
  INET_HELP_VERSIONINFO         = 336;
  INET_HELP_HELPINDEX           = 337;
  INET_HELP_WEBTUTORIAL         = 338;
  INET_HELP_FREESTUFF           = 341;
  INET_HELP_PRODUCTUPDATE       = 342;
  INET_HELP_FAQ                 = 343;
  INET_HELP_ONLINESUPPORT       = 344;
  INET_HELP_FEEDBACK            = 345;
  INET_HELP_BESTPAGE            = 346;
  INET_HELP_SEARCHWEB           = 347;
  INET_HELP_MSHOME              = 348;
  INET_HELP_VISITINTERNET       = 349;
  INET_HELP_STARTPAGE           = 350;
  INET_HELP_NETSCAPEUSER        = 351;
  INET_FILE_IMPORTEXPORT        = 374;
  INET_HELP_ENHANCEDSECURITY    = 375;
  INET_FILE_ADDTRUST            = 376;
  INET_FILE_ADDLOCAL            = 377;
  INET_FILE_NEWPUBLISHINFO      = 387;
  INET_FILE_NEWPEOPLE           = 390;
  INET_FILE_NEWCALL             = 395;

  //command IDs handled by 'Internet Explorer_Server'
  INET_CONTEXTMENU_NEWWINDOW    = 2137;
  INET_CONTEXTMENU_ADDFAV       = 2261;
  INET_CONTEXTMENU_REFRESH      = 6042;

  CGID_WebBrowser: TGUID = '{ED016940-BD5B-11cf-BA4E-00C04FD70816}';

  //Network connectivity status - append to INET_CONNECTION string
  InetCon: array[INET_OFFLINE..INET_WAN] of string = //25.11.10 nk add Internet=WAN
    ('Offline', 'Modem', 'LAN', 'Proxy', 'RAS', 'Online', 'Internet');

var
  InetAbort: Boolean;      //04.05.13 nk add
  InetReturn: Integer;     //26.01.08 nk add
  ConnectionType: DWORD;
  BaseThread: TBaseThread; //26.07.12 nk add

type
  NET_API_STATUS = DWORD;

  USER_INFO_1 = record  //19.09.09 nk add
    usri1_name: LPWSTR;
    usri1_password: LPWSTR;
    usri1_password_age: DWORD;
    usri1_priv: DWORD;
    usri1_home_dir: LPWSTR;
    usri1_comment: LPWSTR;
    usri1_flags: DWORD;
    usri1_script_path: LPWSTR;
  end;
  PUSER_INFO_1 = ^USER_INFO_1;

  USER_INFO_2 = record  //types defined in UGlobal
    usri2_name: LPWSTR;
    usri2_password: LPWSTR;
    usri2_password_age: DWORD;
    usri2_priv: DWORD;
    usri2_home_dir: LPWSTR;
    usri2_comment: LPWSTR;
    usri2_flags: DWORD;
    usri2_script_path: LPWSTR;
    usri2_auth_flags: DWORD;
    usri2_full_name: LPWSTR;
    usri2_usr_comment: LPWSTR;
    usri2_parms: LPWSTR;
    usri2_workstations: LPWSTR;
    usri2_last_logon: DWORD;
    usri2_last_logoff: DWORD;
    usri2_acct_expires: DWORD;
    usri2_max_storage: DWORD;
    usri2_units_per_week: DWORD;
    usri2_logon_hours: PBYTE;
    usri2_bad_pw_count: DWORD;
    usri2_num_logons: DWORD;
    usri2_logon_server: LPWSTR;
    usri2_country_code: DWORD;
    usri2_code_page: DWORD;
  end;
  PUSER_INFO_2 = ^USER_INFO_2;

  SERVER_INFO_503 = record
    sv503_sessopens: DWORD;
    sv503_sessvcs: DWORD;
    sv503_opensearch: DWORD;
    sv503_sizreqbuf: DWORD;
    sv503_initworkitems: DWORD;
    sv503_maxworkitems: DWORD;
    sv503_rawworkitems: DWORD;
    sv503_irpstacksize: DWORD;
    sv503_maxrawbuflen: DWORD;
    sv503_sessusers: DWORD;
    sv503_sessconns: DWORD;
    sv503_maxpagedmemoryusage: DWORD;
    sv503_maxnonpagedmemoryusage: DWORD;
    sv503_enablesoftcompat: BOOL;
    sv503_enableforcedlogoff: BOOL;
    sv503_timesource: BOOL;
    sv503_acceptdownlevelapis: BOOL;
    sv503_lmannounce: BOOL;
    sv503_domain: LPWSTR;
    sv503_maxcopyreadlen: DWORD;
    sv503_maxcopywritelen: DWORD;
    sv503_minkeepsearch: DWORD;
    sv503_maxkeepsearch: DWORD;
    sv503_minkeepcomplsearch: DWORD;
    sv503_maxkeepcomplsearch: DWORD;
    sv503_threadcountadd: DWORD;
    sv503_numblockthreads: DWORD;
    sv503_scavtimeout: DWORD;
    sv503_minrcvqueue: DWORD;
    sv503_minfreeworkitems: DWORD;
    sv503_xactmemsize: DWORD;
    sv503_threadpriority: DWORD;
    sv503_maxmpxct: DWORD;
    sv503_oplockbreakwait: DWORD;
    sv503_oplockbreakresponsewait: DWORD;
    sv503_enableoplocks: BOOL;
    sv503_enableoplockforceclose: BOOL;
    sv503_enablefcbopens: BOOL;
    sv503_enableraw: BOOL;
    sv503_enablesharednetdrives: BOOL;
    sv503_minfreeconnections: DWORD;
    sv503_maxfreeconnections: DWORD;
  end;
  PSERVER_INFO_503 = ^SERVER_INFO_503;

  //18.09.09 nk add - TIPAddressString - store an IP address or mask as dotted decimal string
  PIPAddressString = ^TIPAddressString;
  PIPMaskString    = ^TIPAddressString;
  TIPAddressString = record
    _String: array[0..(4 * 4) - 1] of AnsiChar; //xe//
  end;
  TIPMaskString = TIPAddressString;

  //18.09.09 nk add - TIPAddrString - store an IP address with its
  // corresponding subnet mask, both as dotted decimal strings
  PIPAddrString = ^TIPAddrString;
  TIPAddrString = packed record
    Next: PIPAddrString;
    IpAddress: TIPAddressString;
    IpMask: TIPMaskString;
    Context: DWORD;
  end;

  //18.09.09 nk add - the set of IP-related information which does not depend on DHCP
  PFixedInfo = ^TFixedInfo;
  TFixedInfo = packed record
    HostName: array[0..MAX_HOSTNAME_LEN + 4 - 1] of AnsiChar; //xe//
    DomainName: array[0..MAX_DOMAIN_NAME_LEN + 4 - 1] of AnsiChar; //xe//
    CurrentDnsServer: PIPAddrString;
    DnsServerList: TIPAddrString;
    NodeType: UINT;
    ScopeId: array[0..MAX_SCOPE_ID_LEN + 4 - 1] of AnsiChar; //xe//
    EnableRouting,
    EnableProxy,
    EnableDns: UINT;
  end;

  //25.11.10 nk add ff
  TaPInAddr = array[0..10] of PInAddr;
  PaPInAddr = ^TaPInAddr;

  //18.09.09 nk add ff
  PNetResourceArray = ^TNetResourceArray;
  TNetResourceArray = array[0..100] of TNetResource;

  function GetInetConnection(var ConType: DWORD; WAN: Boolean = False): string;
  function GetInetStartPage: string;
  function GetInetVers(NoReg: Boolean = False): string;   //18.12.11 nk add NoReg / 20.09.09 nk add
  function GetInetOffline: Boolean;
  function GetInetDefault: Boolean;                       //22.11.10 nk add
  function GetInetTime: TDateTime;                        //V5//27.10.16 nk add
  function GetTcpIp: Boolean;
  function GetIpAddress: string;
  function GetMACAddress: string;                         //24.04.15 nk old=GetMACAdress
  function GetInternetIp: string;                         //25.11.10 nk add
  function GetIpAddresses(HostName: string = ''): string; //25.11.10 nk add
  function GetNetDevices(Devices: TStringList): Integer;  //18.09.09 nk add
  function GetDNSServers(Servers: TStringList): Integer;  //18.09.09 nk add
  function GetDomainUsers(Users: TStringList): Integer;   //19.09.09 nk add
  function GetProperHostName(HostName: string): string;   //26.11.09 nk add
  function GetHostFromIp(IpAddr: string; HostOnly: Boolean = False): string;  //19.11.09 nk add HostOnly
  function GetIpFromHost(HostName: string): string;       //22.04.15 nk old=Host
  function GetCompDomain(Server: WideString): string;
  function GetCompAccount: string;                        //24.11.10 nk add
  function GetUserFullName(Server, User: WideString): string;
  function CutLocaleHeader(Url: string): string;     //29.07.08 nk add
  function CheckIpAddr(IpAddr: string): Boolean;     //17.11.09 nk add
  function CheckMailAddr(MailAddr: string): Boolean; //30.01.08 nk add
  function CheckInternetOnline: Boolean;             //53//05.09.21 nk add
  function DownloadFile(SourceFile, DestFile: string; UseLocal: Boolean = False): Boolean; //31.03.10 nk add UseLocal
  function DownloadFileEx(SourceFile, DestFile, SourceName, SourceSite: string; SourceSize: Integer = 0; AIcon: TIcon = nil): Boolean; //18.12.11 nk add
  function GetZoneAttributes(const URL: string): TZoneAttributes;
  function GetInetProtocol(WebBrowser: TWebBrowser): string; //29.07.08 nk add
  function GetBrowserHandle(WebBrowser: TWebBrowser; ClassName: string): HWND;
  function GetFavoritesPath(Handle: THandle): PChar;
  function OpenWebSite(WebSite: string): Boolean;                   //17.04.07 nk mov from UOffice
  function OpenMailClient(Address, Subject, Body: string): Boolean; //17.04.07 nk mov from UOffice
  function BrowserClearPage(Browser: TWebBrowser): Boolean; //01.08.08 nk add
  function GetNetResources(ResourceType, DisplayType: Cardinal; List: TStrings): Boolean; //18.09.09 nk add ff
  function CreateNetResourceList(ResourceType: Cardinal; NetResource: PNetResource; out Entries: DWORD; out List: PNetResourceArray): Boolean; //18.09.09 nk add
  function SelectHost(Header: string; var Host: string; NewStyle: Boolean = True): Boolean; //25.11.09 nk add
  procedure SetInetOffline(Offline: Boolean);
  procedure GetZoneIcon(IconPath: string; var Icon: TIcon);
  procedure BrowserDeleteCache;                                   //27.02.16 nk add
  procedure BrowserClearCache(Browser: TWebBrowser);              //01.08.08 nk add
  procedure BrowserZoom(Browser: TWebBrowser; Zoom: Integer);     //31.07.08 nk add
  procedure BrowserBorder(Browser: TWebBrowser; Border: Boolean); //01.08.08 nk add
  procedure BrowserMessage(Browser: TWebBrowser; Mess: Integer);  //31.07.08 nk add
  procedure BrowserCommand(Browser: TWebBrowser; Command, Value: Integer);
  procedure OpenNetwork;
  procedure OpenInetOptions;
  procedure OpenDownload(const URL: string);
  procedure OpenBrowser(const URL: string);
  procedure SendMail(Subject, Body, Address: string; Attachs: array of string); //22.11.09 nk add

  //external DLL functions
  function NetServerGetInfo(
    servername: PWideChar;
    level: DWORD;
    var bufptr: Pointer): NET_API_STATUS;
    stdcall; external API_NETAPI;

  function NetUserGetInfo(
    servername: LPCWSTR;
    username: LPCWSTR;
    level: DWORD;
    var bufptr: Pointer): NET_API_STATUS;
    stdcall; external API_NETAPI;

  function NetApiBufferFree(
    bufptr: Pointer): NET_API_STATUS;
    stdcall; external API_NETAPI;

  function NetUserEnum(ServerName: PWideChar;  //19.09.09 nk add
    Level,
    Filter: DWORD;
    var Buffer: Pointer;
    PrefMaxLen: DWORD;
    var EntriesRead,
    TotalEntries,
    ResumeHandle: DWORD): Longword;
    stdcall; external API_NETAPI;

  function OrganizeFavorite(
    hwnd: THandle;
    path: PChar): Boolean;
    stdcall; external API_SHDOCVW Name INET_ORG_FAVORITES;

  function GetNetworkParams(pFixedInfo: PFixedInfo; pOutBufLen: PULONG): DWORD; stdcall; //18.09.09 nk add

implementation

var //18.12.11 nk add ff
  InetDialog: TForm;
  InetProgress: TProgressBar;

function GetNetworkParams; external API_IPHLP Name INET_GET_NETPARAMS; //18.09.09 nk add

function CheckInternetOnline: Boolean;
var //53//05.09.21 nk add (base idea from Mitec)
  hs, hu: HInternet;
begin
  hs := InternetOpen(INET_START_PAGE, INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);
  try
    hu := InternetOpenURL(hs, INET_DEFAULP_PAGE, nil, 0, 0, 0);
    Result := hu <> nil;
    InternetCloseHandle(hu);
  finally
    InternetCloseHandle(hs);
  end;
end;

function GetInetConnection(var ConType: DWORD; WAN: Boolean = False): string;
begin //30.11.11 nk opt - return type of Network connection or empty if not connected
  Result  := cEMPTY;
  ConType := INET_OFFLINE;

  if InternetGetConnectedState(@ConType, 0) then begin //05.03.08 nk opt ff
    Result := InetCon[INET_ONLINE];   //online
    if (ConType and INET_MODEM) = INET_MODEM then Result := InetCon[INET_MODEM]; //modem
    if (ConType and INET_LAN)   = INET_LAN   then Result := InetCon[INET_LAN];   //LAN

    if WAN then begin //30.11.11 nk opt ff - check if Internet is reachable
      if (StrCount(GetInternetIp, cDOT) = 3) then begin
        ConType := INET_WAN;
        Result  := InetCon[INET_WAN]; //Internet=WAN
      end;
    end;
  end else begin
    ConType := INET_OFFLINE;
    Result  := InetCon[INET_OFFLINE]; //offline
  end;
end;

function GetInetVers(NoReg: Boolean = False): string;
var //18.12.11 nk add - return the version of the Internet Explorer
  reg: TRegistry;
begin
  if NoReg then begin //18.12.11 nk add NoReg
    Result := GetProgVers(vtLong, INET_IEXPLORE);
    Exit;
  end;

  Result := cEMPTY;
  reg := TRegistry.Create(KEY_READ);

  with reg do begin
    RootKey := HKEY_LOCAL_MACHINE;
    if OpenKey(INET_REG_KEY, False) then begin
      if ValueExists(INET_KEY_VERSION) then
        Result := ReadString(INET_KEY_VERSION)
      else
        Result := GetProgVers(vtLong, INET_IEXPLORE); //18.12.11 nk add
     CloseKey;
    end;
    Free;
  end;
end;

function GetInetStartPage: string;
var //20.09.09 nk opt ff
  reg: TRegistry;
begin
  Result := cEMPTY;
  reg := TRegistry.Create(KEY_READ);

  with reg do begin
    RootKey := HKEY_CURRENT_USER;
    if OpenKey(INET_START_PATH, False) then begin
      if ValueExists(INET_START_PAGE) then
        Result := ReadString(INET_START_PAGE);
      CloseKey;
    end;
    Free;
  end;
end;

procedure GetZoneIcon(IconPath: string; var Icon: TIcon);
var
  fname: string;
  image: string;
  hlib: hInst;
begin
  fname := Copy(IconPath, 1, Pos(cCARET, IconPath) - 1);
  image := Copy(IconPath, Pos(cCARET, IconPath), Length(IconPath));
  hlib  := LoadLibrary(PChar(fname));

  try
    if hlib <> NERR_SUCCESS then
      Icon.Handle := LoadImage(hlib, PChar(image), IMAGE_ICON, SMALL_ICON_DIM, SMALL_ICON_DIM, 0);
  finally
    FreeLibrary(hlib);
  end;
end;

function GetTcpIp: Boolean;
var //check if WinSock and TCP/IP services are available
  data: TWSAData;
begin
  Result := True;

  case WSAStartup(INET_WSA, data) of
    WSAEINVAL, WSASYSNOTREADY, WSAVERNOTSUPPORTED: Result := False;
  else
    WSACleanup;
  end;
end;

function GetMACAddress: string;
var //return the MAC address of the Network adapter
  i: Integer;     //Better use GetEtherInfo to get MAC-Address usin WMI
  aret: AnsiChar;
  sysid: string;
  ncb: PNCB;
  pla: PlanaEnum;
  adp: PAdapterStatus;
begin
  Result := cEMPTY;
  sysid  := cEMPTY;

  GetMem(ncb, SizeOf(TNCB));
  FillChar(ncb^, SizeOf(TNCB), 0);

  GetMem(pla, SizeOf(TLanaEnum));
  FillChar(pla^, SizeOf(TLanaEnum), 0);

  GetMem(adp, SizeOf(TAdapterStatus));
  FillChar(adp^, SizeOf(TAdapterStatus), 0);

  pla.Length      := AnsiChar(0);
  ncb.ncb_command := AnsiChar(NCBENUM);
  ncb.ncb_buffer  := Pointer(pla);
  ncb.ncb_length  := SizeOf(pla);
//aret            := Netbios(ncb);    //28.01.12 nk del

  i := 0;
  repeat
    FillChar(ncb^, SizeOf(TNCB), 0);
    ncb.ncb_command  := AnsiChar(NCBRESET);
    ncb.ncb_lana_num := pla.lana[I];
  //aret             := Netbios(ncb); //28.01.12 nk del

    FillChar(ncb^, SizeOf(TNCB), 0);
    ncb.ncb_command  := AnsiChar(NCBASTAT);
    ncb.ncb_lana_num := pla.lana[i];
    ncb.ncb_callname := '*               '; //must be 16
    ncb.ncb_buffer   := Pointer(adp);
    ncb.ncb_length   := SizeOf(TAdapterStatus);
    aret             := Netbios(ncb);

    if (aret = AnsiChar(0)) or (aret = AnsiChar(6)) then begin
      sysid := IntToHex(Ord(adp.adapter_address[0]), 2) + INET_MAC_DEL +
               IntToHex(Ord(adp.adapter_address[1]), 2) + INET_MAC_DEL +
               IntToHex(Ord(adp.adapter_address[2]), 2) + INET_MAC_DEL +
               IntToHex(Ord(adp.adapter_address[3]), 2) + INET_MAC_DEL +
               IntToHex(Ord(adp.adapter_address[4]), 2) + INET_MAC_DEL +
               IntToHex(Ord(adp.adapter_address[5]), 2);
    end;
    Inc(i);
  until (i >= Ord(pla.Length)) or (sysid <> INET_MAC_ADDR);

  FreeMem(ncb);
  FreeMem(adp);
  FreeMem(pla);

  Result := sysid;
end;

function GetIpAddress: string;
var //get the IP address of your computer like '162.12.1.1'
  buff: array [0..MAXBYTE] of AnsiChar; //xe//
  host: PHostEnt;
  data: TWSAData;
begin //22.04.15 nk opt for XE7
  Result := INET_LOCALHOST; //26.11.09 nk old=cEMPTY
  if WSAStartup(INET_WSA, data) <> NERR_SUCCESS then Exit;

  GetHostName(buff, SizeOf(buff));
  host := GetHostByName(buff);

  if host = nil then
    Result := INET_LOCALHOST
  else
    Result := string(AnsiStrings.StrPas(Inet_Ntoa(PInAddr(host^.h_addr_list^)^))); //xe7//

  WSACleanup;
end;

function GetIpAddresses(HostName: string = ''): string;
var //25.11.10 nk add - return all IP addresses of HostName (empty=local machine)
  i: Integer;
  hname: AnsiString;
  host: PHostEnt;
  pptr: PaPInAddr;
  data: TWSAData;
begin
  Result := cEMPTY;
  data.wVersion := 0;  //need a socket for ioctl
  if WSAStartup(INET_WSA, data) <> NERR_SUCCESS then Exit;

  try
    if HostName = cEMPTY then begin
      SetLength(hname, MAX_PATH);
      GetHostName(PAnsiChar(hname), MAX_PATH);
    end else begin
      hname := AnsiString(HostName);
    end;

    host := GetHostByName(PAnsiChar(hname));

    if host <> nil then begin
      pptr := PaPInAddr(host^.h_addr_list);
      i := 0;
      while pptr^[i] <> nil do begin
        Result := Result + (string(AnsiString(inet_ntoa(pptr^[i]^)))) + CRLF;
        Inc(i);
      end;
    end;
  finally
    WSACleanup;
  end;
end;

function GetIpFromHost(HostName: string): string;
var //26.04.15 nk add improved version for XE7 w/o Sockets
  i: Integer; //Host name = '\\VENUS' is also valid
  hname: AnsiString;
  host: PHostEnt;
  pptr: PaPInAddr;
  data: TWSAData;
begin
  Result := cEMPTY;
  if WSAStartup(INET_WSA, data) <> NERR_SUCCESS then Exit;

  try
    HostName := StringReplace(HostName, INET_HOST_DEL, cEMPTY, [rfReplaceAll]);
    hname    := AnsiString(HostName);
    host     := GetHostByName(PAnsiChar(hname));

    if host <> nil then begin
      pptr := PaPInAddr(host^.h_addr_list);
      i := 0;
      while pptr^[i] <> nil do begin
        Result :=string(AnsiString( inet_ntoa(pptr^[i]^)));
        Inc(i);
      end;
    end;
  finally
    WSACleanup;
  end;
end;

{ //22.04.15 nk old version using
function GetIpFromHost(Host: string): string;
var //get the IP address of a valid Host name: 'VENUS' => '194.122.78.100'
//xe//Host and IP-address are ANSI not Unicode
  client: TTcpClient; //Host name = '\\VENUS' is also valid
begin                 //06.01.10 nk add improved version /
  Host   := StringReplace(Host, INET_HOST_DEL, cEMPTY, [rfReplaceAll]);
  client := TTcpClient.Create(Application);

  try
    Result := string(client.LookupHostAddr(AnsiString(Host))); //xe//always ANSI ok
  finally
    client.Free;
  end;
end; }

function GetProperHostName(HostName: string): string;
begin  //25.11.10 nk old=Host / 26.11.09 nk add
  Result := StringReplace(HostName, INET_HOST_DEL, cEMPTY, [rfReplaceAll]);
  Result := StrSplit(Result, cDOT, 0);  //cut host name - ignore domain name
  Result := INET_HOST_START + Result;   //host name like '\\VENUS'
end;

function GetHostFromIp(IpAddr: string; HostOnly: Boolean = False): string;
var //25.11.09 nk opt - get the Host name of a valid IP address like 'ns1.ip-plus.net' or 'VENUS.seanus'
//xe//Host and IP-address are ANSI not Unicode
  addr: Integer; //return host name w/o domain if HostOnly=True like '\\VENUS'
  host: PHostEnt;
begin
  Result := cEMPTY;
  addr   := Inet_Addr(PAnsiChar(AnsiString(IpAddr))); //xe//

  if addr <> u_long(INADDR_NONE) then begin
    host := GetHostByAddr(@addr, SizeOf(Integer), PF_INET);
    if host = nil then
      Result := INET_INVALID_ADDR
    else
      Result := string(host^.h_name); //xe//
  end;

  if HostOnly then begin  //26.11.09 nk add ff
    if Result <> INET_INVALID_ADDR then
      Result := GetProperHostName(Result)
    else
      Result := cEMPTY;
  end;
end;

function GetInternetIp: string;
var //53//29.11.20 nk opt - get the WAN IP address behind the gateway/router/proxy
  client: TIdHTTP; //that is the IP address seen by an externel web server
begin
  Result := cEMPTY;
  client := TIdHTTP.Create;

  try
    client.HandleRedirects := True;
    client.ConnectTimeout  := 5000;  //timeout = 5s
    Result := client.Get(INET_GETMYIP_PAGE);
  except
    on E: Exception do
      Result := StringReplace(E.Message, #$D, cSPLIT, [rfReplaceAll]); //53//29.11.20 nk opt - cut CRLF
  end;

  client.Free;
end;

function GetCompDomain(Server: WideString): string;
var //Server='VENUS' Output='SEANUS'
  err: NET_API_STATUS; //must be called with Administrator privileges
  buff: Pointer;
begin
  Result := cEMPTY;

  try
    err := NetServerGetInfo(PWideChar(Server), 503, buff);
    if err = NERR_SUCCESS then
      Result := PSERVER_INFO_503 (buff)^.sv503_domain;
  finally
    NetApiBufferFree(buff);
  end;
end;

function GetCompAccount: string;
var //24.11.10 nk add - return the computer account or description
  reg: TRegistry;
begin
  Result := cEMPTY;
  reg := TRegistry.Create(KEY_READ);

  with reg do begin
    RootKey := HKEY_LOCAL_MACHINE;
    if OpenKey(INET_LANMAN_PATH, False) then begin
      if ValueExists(INET_KEY_ACCOUNT) then
        Result := ReadString(INET_KEY_ACCOUNT);
     CloseKey;
    end;
    Free;
  end;
end;

function GetUserFullName(Server, User: WideString): string;
var //Server='VENUS' User='benny' Output='Bernhard Joss'
  err: NET_API_STATUS; //Server='' = local computer
  buff: Pointer;       //add '\\VENUS' on NT system
begin
  Result := cEMPTY;

  try
    err := NetUserGetInfo(PWideChar(Server), PWideChar(User), 2, buff);
    if err = NERR_SUCCESS then
      Result := PUSER_INFO_2 (buff)^.usri2_full_name;
  finally
    NetApiBufferFree(buff);
  end;
end;

function GetDomainUsers(Users: TStringList): Integer;
var //24.11.10 nk opt
  i: Integer;
  stst: LongWord;
  hndl: DWORD;
  eread: DWORD;
  etot: DWORD;
  uinfo: PUSER_INFO_1;
  pbuff: Pointer;
begin
  hndl := CLEAR;
  Users.Clear;

  repeat
    stst  := NetUserEnum(nil, 1, CLEAR, pbuff, CLEAR, eread, etot, hndl);
    uinfo := pbuff;

    if eread > 0 then begin  //24.11.10 nk opt
      for i := 0 to eread - 1 do begin
        Users.Append(WideCharToString(uinfo^.usri1_name) + cSEMI + WideCharToString(uinfo^.usri1_comment));
        Inc(uinfo);
      end;
    end;

    NetApiBufferFree(pbuff);
  until (stst <> ERROR_MORE_DATA);

  Result := Users.Count;
end;

function CreateNetResourceList(ResourceType: Cardinal; NetResource: PNetResource; out Entries: DWORD; out List: PNetResourceArray): Boolean;
var //19.02.14 nk opt fro XE3
  hndl: System.THandle; //xe3//
  size: DWORD;
  res: DWORD;
begin
  Result  := False;
  List    := nil;
  Entries := CLEAR;

  if WNetOpenEnum(RESOURCE_GLOBALNET, ResourceType, CLEAR, NetResource, hndl) = NO_ERROR then begin
    try
      size := $4000;  //16kB
      GetMem(List, size);
      try
        repeat
          Entries := DWORD(-1);
          FillChar(List^, size, CLEAR);
          Res := WNetEnumResource(hndl, Entries, List, size);
          if res = ERROR_MORE_DATA then
            ReAllocMem(List, size);
        until res <> ERROR_MORE_DATA;

        Result := (res = NO_ERROR);

        if not Result then begin
          FreeMem(List);
          List := nil;
          Entries := CLEAR;
        end;
      except
        FreeMem(List);
      end;
    finally
      WNetCloseEnum(hndl);
    end;
  end;
end;

function GetNetResources(ResourceType, DisplayType: DWORD; List: TStrings): Boolean;
//18.09.09 nk add
  procedure ScanLevel(NetResource: PNetResource);
  var
    i: Integer;
    entries: DWORD;
    nlist: PNetResourceArray;
  begin
    if CreateNetResourceList(ResourceType, NetResource, entries, nlist) then try
      for i := 0 to Integer(entries) - 1 do begin
        if (DisplayType = RESOURCEDISPLAYTYPE_GENERIC) or (nlist[i].dwDisplayType = DisplayType) then
          List.AddObject(nlist[i].lpRemoteName, Pointer(nlist[i].dwDisplayType));
        if (nlist[i].dwUsage and RESOURCEUSAGE_CONTAINER) <> NERR_SUCCESS then
          ScanLevel(@nlist[i]);
      end;
    finally
      FreeMem(nlist);
    end;
  end;

begin
  List.Clear;
  ScanLevel(nil);
  Result := (List.Count > 0);
end;

function GetInetOffline: Boolean;
// get the actual Internet Explorer work state
// True=Offline, False=Online
var
  state: DWORD;
  size: Cardinal;
begin
  Result := False;
  state  := NERR_SUCCESS;
  size   := SizeOf(DWORD);

  if InternetQueryOption(nil, INTERNET_OPTION_CONNECTED_STATE, @state, size) then
    if (state and INTERNET_STATE_DISCONNECTED_BY_USER) <> NERR_SUCCESS then
      Result := True;
end;

function GetInetDefault: Boolean;
var //25.11.10 nk opt - return True if IE is the default browser
  reg: TRegistry;
begin
  Result := False;

  try
    reg := TRegistry.Create(KEY_READ);  //25.11.10 nk old=KEY_READ

    with reg do begin
      try
        RootKey := HKEY_CLASSES_ROOT;
        if OpenKey(INET_HTML_BROWSER, False) then begin
          if Pos(INET_IEXPLORE, ReadString(cEMPTY)) > 0 then
            Result := True;
        end;
      finally
        CloseKey;
        Free;
      end;
    end;
  except
    Result := False;
  end
end;

function GetInetTime: TDateTime;
var //08.03.17 nk add - get Internet Time from NTP time servers
  i: Integer;            //return UTC date and time -> no time zone nor daylight corrections are made
  netdelay: Int64;       //network delay time
  timestamp: TDateTime;  //response from time server
  netserver: TIdSNTP;    //Display date and time using DateTimeToStr(DateTime) or synch clock with USystem.SetSystemTime(DateTime)
const //V5//08.03.17 nk mov ff to public
//TIME_PORT  = 123;     //NTP time server port (UDP)
//INET_DELAY = 1000;    //receive timeout = 1sec
//TEST_DATE  = 42669.0; //27.10.2016 00:00:00.000

  //list of international NTP time servers
  TimeServers: array[1..11] of string = (
    'pool.ntp.org',
    'time.ien.it',
    'utcnist.colorado.edu',
    'ptbtime1.ptb.de',
    'time-nw.nist.gov',
    'ntp2.cmc.ec.gc.ca',
    'time-a.timefreq.bldrdoc.gov',
    'ptbtime2.ptb.de',
    'time-b.timefreq.bldrdoc.gov',
    'ntps1-0.cs.tu-berlin.de',
    'time-c.timefreq.bldrdoc.gov');

begin
  Result    := 0;
  netdelay  := 0;
  timestamp := 0;
  netserver := TIdSNTP.Create;

  for i := Low(TimeServers) to High(TimeServers) do begin
    try
      netserver.Disconnect;
      netserver.Host := TimeServers[i];
      netserver.Port := TIME_PORT;
      netserver.ReceiveTimeout := INET_DELAY;
      netdelay := GetTimer;
      netserver.Connect;
      timestamp := netserver.DateTime;
      netdelay  := (GetTimer - netdelay) div USEC_MSEC; //ms
    except
      Continue;
    end;

    if (timestamp > TEST_DATE) and (netdelay < INET_DELAY) then begin
      Result := timestamp;
      netserver.Free;
      Exit;
    end;
  end;
end;

function GetFavoritesPath(Handle: THandle): PChar;
var
  pidl: PItemIDList;
  alloc: IMalloc;
  path: array[0..MAX_PATH] of Char;
begin
  Result := cEMPTY;

  if Succeeded(ShGetSpecialFolderLocation(Handle, CSIDL_FAVORITES, pidl)) then begin
    if ShGetPathfromIDList(pidl, path) then
      Result := path;

    if Succeeded(SHGetMalloc(alloc)) then
      alloc.Free(pidl);
  end;
end;

procedure SetInetOffline(Offline: Boolean);
// Users can choose to work offline by selecting Work Offline on the File
// menu in Internet Explorer 4.0 and later. When Work Offline is selected,
// the system enters a global offline state independent of any current
// network connection, and content is read exclusively from the cache.
var
  page: string;
  info: INTERNET_CONNECTED_INFO;
begin
  if Offline then begin
    info.dwConnectedState := INTERNET_STATE_DISCONNECTED_BY_USER;
    info.dwFlags          := ISO_FORCE_DISCONNECTED;
    InternetSetOption(nil, INTERNET_OPTION_CONNECTED_STATE, @info, SizeOf(info));
  end else begin
    page := GetInetStartPage;
    InternetGoOnline(PChar(page), Application.Handle, 0);
  end;
end;

function GetZoneAttributes(const URL: string): TZoneAttributes;
var //defined in Urlmon.pas
  zone: Cardinal;
  attr: TZoneAttributes;
  ZoneManager: IInternetZoneManager;
  SecManager: IInternetSecurityManager;
begin
  ZeroMemory(@attr, SizeOf(TZoneAttributes));

  if CoInternetCreateSecuritymanager(nil, SecManager, 0) = S_OK then begin
    if CoInternetCreateZoneManager(nil, ZoneManager, 0) = S_OK then begin
      SecManager.MapUrlToZone(PWideChar(WideString(URL)), zone, 0);
      ZoneManager.GetZoneAttributes(zone, Result);
    end;
  end;
end;

function CheckMailAddr(MailAddr: string): Boolean;
var //xe//
  i: Integer;
  mlen: Integer;
  mail: string;
begin
  Result := False;
  mail   := AnsiLowerCase(MailAddr);
  mlen   := Length(mail);

  if mlen < 6 then Exit;
  if StrCount(mail, cAT) <> 1 then Exit;
  if StrCount(mail, cDOT) < 1 then Exit;

  for i := 1 to mlen do
    if CharInSet(mail[i], INET_INVALID_CHARS) then Exit;  //xe//

  i := Pos(cDOT, mail);
  if (i = 0) or (i = 1) or (i = mlen) then Exit;

  i := Pos(cAT, mail);
  if (i = 0) or (i = 1) or (i = mlen) then Exit;

  Result := True;
end;

function CheckIpAddr(IpAddr: string): Boolean;
var //xe//25.11.09 nk add - validate IpAddr in the format 'xxx.xxx.xxx.xxx'
  i, j, p: Integer;   //where xxx is in the range 0..255 / True=IpAddr valid
  w: string;
begin
  Result := False;

  if Trim(IpAddr) = cEMPTY then Exit;
  if (Length(IpAddr) > MAX_IPADDR_LEN) or (IpAddr[1] = cDOT) then Exit;

  i := 1;
  j := 0;
  p := 0;
  w := cEMPTY;

  repeat
    if CharInSet(IpAddr[i], ALL_FLOATS) and (j < 4) then begin //xe//
      if IpAddr[i] = cDOT then begin
        Inc(p);
        j := 0;
        try
          StrToInt(IpAddr[i + 1]);
        except
          Exit;
        end;
        w := cEMPTY;
      end else begin
        w := w + IpAddr[i];
        if (StrToInt(w) > MAXBYTE) or (Length(w) > 3) then Exit;
        Inc(j);
      end;
    end else begin
      Exit;
    end;
    Inc(i);
  until i > Length(IpAddr);

  if p < 3 then Exit;
  Result := True;
end;

function CutLocaleHeader(Url: string): string;
begin //cut 'file://' header from url and return locale file name and path
  if Pos(INET_LOCALE_HEADER, Url) = 1 then
    Result := RightStr(Url, Length(Url) - Length(INET_LOCALE_HEADER))
  else
    Result := Trim(Url);
end;

function DownloadFile(SourceFile, DestFile: string; UseLocal: Boolean = False): Boolean;
var //27.02.16 nk opt - Download a file from an URL Location, like:
  buff: TStringList; // SourceFile = 'http://www.seanus.com/services/update.zip';
begin                // and save it to the given designation file, like:
//Result := False;   // DestFile = 'C:\temp\update.zip';
  buff := TStringList.Create; //31.03.10 nk opt / add UseLocal

  try                      //18.12.11 nk opt ff
    try
      if not UseLocal then //31.03.10 nk opt
        DeleteFile(DestFile);

      BrowserDeleteCache;  //27.02.16 nk add/opt ff

      //needs Internet Explorer!
      InetReturn := UrlDownloadToFile(nil, PChar(SourceFile), PChar(DestFile), 0, nil);

      if InetReturn = NERR_SUCCESS then begin
        buff.LoadFromFile(DestFile); //convert unix (binary) line feeds
        buff.SaveToFile(DestFile);   //to Windows (ASCII) CRLF
      end;                           //existing file will be overwritten!
    except
      InetReturn := INET_ERR;
    end;
  finally
    buff.Free;
    Result := FileExists(DestFile);
  end;
end;

function DownloadFileEx(SourceFile, DestFile, SourceName, SourceSite: string; SourceSize: Integer = 0; AIcon: TIcon = nil): Boolean;
var //04.01.17 nk opt - Improved version of DownloadFile (show progress / do not need Internet Explorer)
  doprog: Boolean;       //SourceSize in kB = file size [Byte] / 1024
  retok: Boolean;        //26.07.12 nk add
  drate, kilos: Integer; //26.07.12 nk add ff
  stim: Int64;
  bsize: DWORD;
  dtim: Single;
  fname: string;
  hses, hurl: HInternet;
  img: TImage;
  fout: file;
  buff: array[1..K1] of Byte;
begin
  Result    := False;
  InetAbort := False;    //05.05.13 nk add
  retok     := False;    //26.07.12 nk add
  kilos     := 0;        //26.07.12 nk add ff
  drate     := 0;
  doprog    := (SourceSize > 0);
  fname     := ExtractFileName(Application.ExeName);
  hses      := InternetOpen(PChar(fname), INTERNET_OPEN_TYPE_PRECONFIG, nil, nil, 0);

  try
    if Assigned(hses) then begin
      hurl := InternetOpenUrl(hses, PChar(SourceFile), nil, 0, INTERNET_FLAG_RELOAD, 0);

      if doprog then begin
        fname        := INET_TEXT_DOWNLOAD + SourceName + ' from ' + CRLF + SourceSite;
        InetDialog   := CreateMessageDialog(fname, mtInformation, []);
        InetProgress := TProgressBar.Create(InetDialog);

        with InetDialog do begin
          FormStyle      := fsStayOnTop;
          BorderStyle    := bsDialog;
          BorderIcons    := [];
          Position       := poDesigned;
          DefaultMonitor := dmActiveForm;
          Height         := 120;
          Width          := 250; //11.03.16 nk add
          Color          := clInfo;
          Caption        := cSPACE + Application.Title + cSPLIT + INET_TRANSFER; //20.12.11 nk opt
          Left           := Left + 50;

          if AIcon <> nil then begin //20.12.11 nk add ff
            img := TImage(InetDialog.FindComponent('Image'));
            if img <> nil then img.Picture.Icon := AIcon;
          end;

          with InetProgress do begin
            if SourceSize > 0 then begin
              Name        := 'InetProgress';
              Parent      := InetDialog;
              BorderWidth := 1;           //04.01.17 nk add - show frame
              Smooth      := True;
              Max         := SourceSize;
              Step        := 1;
              Left        := 8;
              Top         := InetDialog.ClientHeight - 26; //10.03.16 nk old=-32
              Width       := InetDialog.ClientWidth  - 16;
            end else begin
              Visible := False;
            end;
          end;

          Show; //NOT ShowModal
        end;
      end;

      //26.07.12 nk add ff - use thread-safe methode to check Internet connection is not frozen
      BaseThread := TBaseThread.Create;
      BaseThread.SetLoopTime(THREAD_LOOP_TIME);
      BaseThread.SetLoopTask(THREAD_INET_ALIVE);
      BaseThread.SetAliveCount(THREAD_ALIVE_CLEAR);
      BaseThread.SetAliveInet(hurl); //handle to close if connection is frozen
      BaseThread.Start; //21.01.13 nk old=Resume (deprecated)

      DeleteFile(DestFile);
      BrowserDeleteCache; //27.02.16 nk add/opt ff
    //DeleteUrlCacheEntry(PChar(DestFile));
    //Delay(WAIT_DELAY);

      try
        FileMode := fmOpenReadWrite;
        AssignFile(fout, DestFile);
        Rewrite(fout, 1);
        stim := GetTimer; //[us]

        repeat //26.07.12 nk opt ff
          if not InternetReadFile(hurl, @buff, SizeOf(buff), bsize) then Break;
          dtim := (GetTimer - stim) / USEC_SEC; //[s]
          BlockWrite(fout, buff, bsize);
          if doprog then InetProgress.StepIt;
          Inc(kilos);
          drate := Round((drate + kilos / dtim) / 2.0); //kB/s
          InetDialog.Caption := Format(INET_FORM_DOWNLOAD, [kilos, SourceSize, drate]); //11.03.16 nk old=kByte(s)
          BaseThread.SetAliveCount(THREAD_ALIVE_CLEAR); //Internet connection still alive or frozen?
          Application.ProcessMessages;
          if InetAbort then Break;                      //04.05.13 nk add - abort download by user
        until bsize = NERR_SUCCESS;

        retok := (BaseThread.GetAliveCount < THREAD_ALIVE_LOOPS);
        CloseFile(fout);
      finally
        InternetCloseHandle(hurl);
      end;
    end;
  finally
    BaseThread.Terminate; //26.07.12 nk add
    InternetCloseHandle(hses);
  end;

  if InetDialog <> nil
    then InetDialog.Close;

  //if source file doesn't exist an error page 404 is downloaded -> show the HTML page in the browser
  if FileExists(DestFile) then begin
    if FindInFile(DestFile, INET_HTML_PROTOCOL, [fmLim3]) > 0 then begin
      fname := ChangeFileExt(DestFile, HTM_END);
      RenameFile(DestFile, fname);
      OpenWebSite(fname);
    end else begin
      Result := retok and not InetAbort; //04.05.13 nk opt / 26.07.12 nk old=True
    end;
  end;
end;

procedure BrowserCommand(Browser: TWebBrowser; Command, Value: Integer);
var //Command = INET_CONTEXTMENU_.. constant
  vin: OleVariant;
  vout: OleVariant;
  cmd: IOleCommandTarget;
  pid: PGUID;
begin
  New(pid);
  pid^ := CGID_WebBrowser;

  try
    if Browser.Document = nil then Exit;  //02.08.08 nk opt
    Browser.Document.QueryInterface(IOleCommandTarget, cmd);
    if cmd <> nil then begin
      try
        cmd.Exec(pid, Command, Value, vin, vout);
      finally
        cmd._Release;
      end;
    end;
  except
    InetReturn := INET_ERR;
  end;

  Dispose(pid);
end;

procedure BrowserMessage(Browser: TWebBrowser; Mess: Integer);
begin //Mess = INET_FILE_.. constant
  try
    if Browser.Document = nil then Exit;  //02.08.08 nk opt
    SendMessage(GetBrowserHandle(Browser, INET_SHELL_OPEN), WM_COMMAND, Mess, 0);
  except
    InetReturn := INET_ERR;
  end;
end;

procedure BrowserZoom(Browser: TWebBrowser; Zoom: Integer);
var //set absolute browser zoom [%] (if >= 50) or relative (if < 50)
  izoom: Integer;
  rzoom: Single;
  szoom: string;
begin
  try
    if Browser.Document = nil then Exit;  //02.08.08 nk opt
    if Zoom < INET_ZOOM_MIN then begin    //relative zoom by +/-step
      szoom := Browser.OleObject.Document.Body.Style.Zoom;
      rzoom := StrToFloatDef(szoom, 1.0); //default zoom = 100%
      izoom := Round(rzoom * INET_ZOOM_NORM);
      Zoom  := izoom + Zoom;  //%
    end;
    Zoom := Max(Min(Zoom, INET_ZOOM_MAX), INET_ZOOM_MIN);
    Browser.OleObject.Document.Body.Style.Zoom := Zoom / PROCENT;
  except
    //ignore
  end;
end;

procedure BrowserBorder(Browser: TWebBrowser; Border: Boolean);
var //Border True = show 3D border around the browser document (default)
  style: string;
begin
  try
    if Browser.Document = nil then Exit;  //02.08.08 nk opt
    if Border then
      style := INET_BORDER_ON
    else
      style := INET_BORDER_OFF;
    Browser.OleObject.Document.Body.Style.BorderStyle := style;
  except
    //ignore
  end;
end;

function BrowserClearPage(Browser: TWebBrowser): Boolean;
var //clear the currently loaded web site from browser
  init: IPersistStreamInit; //But do NOT clear the Document object!!
begin
  Result := False;
  try
    if Browser.Document = nil then Exit;  //02.08.08 nk opt
    if Browser.Document.QueryInterface(IPersistStreamInit, init) = NERR_SUCCESS then
      Result := (init.InitNew = NERR_SUCCESS);
  except
    Result := False;
  end;
end;

procedure BrowserClearCache(Browser: TWebBrowser);
var //clear all web sites from web browser cache
  page: Integer;
begin
  page := CLEAR;
  try
    while BrowserClearPage(Browser) do begin
      Inc(page);
      if page > INET_CACHE_PAGES then Break;
      Browser.GoBack; //get last page from cache
    end;
  except
    //ignore
  end;
end;

procedure BrowserDeleteCache;
var //27.02.16 nk add
  lpEntryInfo: PInternetCacheEntryInfo;
  hCacheDir: LongWord;
  dwEntrySize: LongWord;
begin
  dwEntrySize := 0;
  FindFirstUrlCacheEntry(nil, TInternetCacheEntryInfo(nil^), dwEntrySize);
  GetMem(lpEntryInfo, dwEntrySize);
  if dwEntrySize > 0 then lpEntryInfo^.dwStructSize := dwEntrySize;
  hCacheDir := FindFirstUrlCacheEntry(nil, lpEntryInfo^, dwEntrySize);

  if hCacheDir <> 0 then begin
    repeat
      DeleteUrlCacheEntry(lpEntryInfo^.lpszSourceUrlName);
      FreeMem(lpEntryInfo, dwEntrySize);
      dwEntrySize := 0;
      FindNextUrlCacheEntry(hCacheDir, TInternetCacheEntryInfo(nil^), dwEntrySize);
      GetMem(lpEntryInfo, dwEntrySize);
      if dwEntrySize > 0 then lpEntryInfo^.dwStructSize := dwEntrySize;
    until not FindNextUrlCacheEntry(hCacheDir, lpEntryInfo^, dwEntrySize);
  end;

  FreeMem(lpEntryInfo, dwEntrySize);
  FindCloseUrlCache(hCacheDir);
end;

function GetInetProtocol(WebBrowser: TWebBrowser): string;
var
  proto: string;
begin
  try
    proto := WebBrowser.OleObject.Document.Location.Protocol;
    proto := StringReplace(proto, cCOLON, cEMPTY, [rfReplaceAll]);
    proto := UpperCase(Trim(proto));
  except
    proto := INET_NONE_PROTOCOL;
  end;

  if (proto = cEMPTY) or (proto = INET_NONE_PROTOCOL) then //02.08.08 nk opt
    Result := INET_HTML_PROTOCOL
  else
    Result := proto;
end;

function GetBrowserHandle(WebBrowser: TWebBrowser; ClassName: string): HWND;
var
  hwndChild, hwndTmp: HWND;
  oleCtrl: TOleControl;
  szClass: array[0..MAXBYTE] of Char;
begin
  oleCtrl := WebBrowser;
  hwndTmp := oleCtrl.Handle;

  while True do begin
    hwndChild := GetWindow(hwndTmp, GW_CHILD);
    GetClassName(hwndChild, szClass, SizeOf(szClass));
    if (string(szClass) = ClassName) then begin
      Result := hwndChild;
      Exit;
    end;
    hwndTmp := hwndChild;
  end;

  Result := NERR_SUCCESS;
end;

function GetDNSServers(Servers: TStringList): Integer;
var //xe//18.09.09 nk add - get list of all DNS servers
  pInfo: PFixedInfo;
  pAddr: PIPAddrString;
  olen: Cardinal;
begin
  Result := CLEAR;
  olen   := SizeOf(TFixedInfo);
  GetMem(pInfo, SizeOf(TFixedInfo));
  Servers.Clear;

  try
    if GetNetworkParams(pInfo, @olen) = ERROR_BUFFER_OVERFLOW then begin
      ReallocMem(pInfo, olen);
      if GetNetworkParams(pInfo, @olen) <> NO_ERROR then Exit;
    end;
    //no network available => no DNS servers defined
    if pInfo^.DnsServerList.IpAddress._String[0] = cNUL then Exit;

    Servers.Append(string(pInfo^.DnsServerList.IpAddress._String)); //xe//add first server
    pAddr := pInfo^.DnsServerList.Next;                             //add rest of servers

    while Assigned(pAddr) do begin
      Servers.Append(string(pAddr^.IpAddress._String)); //xe//
      pAddr := pAddr^.Next;
    end;
  finally
    FreeMem(pInfo);
  end;

  Result := Servers.Count;
end;

function GetNetDevices(Devices: TStringList): Integer;
var //26.04.15 nk opt - get list of connected network devices
  i, lexit, res: Cardinal;
  buff, ecnt: Cardinal;
  hnum: System.THandle; //19.02.14 nk opt fro XE3
  pnet: PNETRESOURCE;
begin
  Result := CLEAR;
  lexit  := CLEAR;
  buff   := K16;
  ecnt   := BIT_MASK;
  Devices.Clear;

  res := WNetOpenEnum(RESOURCE_CONNECTED, RESOURCETYPE_ANY, CLEAR, nil, hnum);
  if res <> NO_ERROR then Exit;

  repeat
    Inc(lexit);
    pnet := PNETRESOURCE(GlobalAlloc(GPTR, buff));
    res  := WNetEnumResource(hnum, ecnt, pnet, buff);

    if res = NO_ERROR then begin
      for i := 0 to ecnt - 1 do begin
        if pnet^.lpLocalName <> nil then
          Devices.Append(pnet^.lpLocalName + cTAB + pnet^.lpRemoteName);
        Inc(pnet);
      end;
    end else if res <> ERROR_NO_MORE_ITEMS then begin
      {$IFNDEF WIN64}GlobalFree(HGLOBAL(pnet));{$ENDIF} //26.04.15 nk add - 64-Bit version crashes here !?!
      Break;
    end;
    {$IFNDEF WIN64}GlobalFree(HGLOBAL(pnet));{$ENDIF}   //26.04.15 nk add - 64-Bit version crashes here !?!
  until (res = ERROR_NO_MORE_ITEMS) or (lexit > MAX_EXIT_LOOPS);

  WNetCloseEnum(hnum);
  Result := Devices.Count;
end;

function SelectHost(Header: string; var Host: string; NewStyle: Boolean = True): Boolean;
const //bNewStyle: If True, this code will try to use the new style of Windows 2000/XP
  BIF_USENEWUI = 28;
var
  title: string;
  hostname: array[0..MAX_PATH] of Char;
  info: TBrowseInfo;
  wlist: Pointer;
  ilist: PItemIDList;
  mall: IMalloc;
begin
  Result := False;
  if Failed(SHGetSpecialFolderLocation(Application.Handle, CSIDL_NETWORK, ilist)) then Exit;

  try
    FillChar(info, SizeOf(info), CLEAR);
    info.hwndOwner      := Application.Handle;
    info.pidlRoot       := ilist;
    info.pszDisplayName := hostname;
    title := Header;
    info.lpszTitle      := PChar(Pointer(title));

    if NewStyle then
      info.ulFlags := BIF_BROWSEFORCOMPUTER or BIF_USENEWUI
    else
      info.ulFlags := BIF_BROWSEFORCOMPUTER;

    wlist := DisableTaskWindows(0);

    try
      Result := SHBrowseForFolder(info) <> nil;
    finally
      EnableTaskWindows(wlist);
    end;

    if Result then Host := hostname;
  finally
    if Succeeded(SHGetMalloc(mall)) then
      mall.Free(ilist);
  end;
end;

procedure OpenNetwork;
begin //open network
  ShellExecute(GetActiveWindow, SHELL_EXEC, API_RUNDLL,
    API_SHELL + INET_API_NCPACPL, nil, SW_NORMAL);
end;

procedure OpenInetOptions;
begin //open internet optionen
  ShellExecute(Application.Handle, SHELL_EXEC, API_RUNDLL,
    API_SHELL + INET_API_INETCPL, nil, SW_NORMAL);
end;

procedure OpenDownload(const URL: string);
begin //open internet download - user can select destination folder, shows file transfer
  ShellExecute(Application.Handle, SHELL_EXEC, PChar(URL), nil, nil, SW_SHOW);
end;

procedure OpenBrowser(const URL: string);
var //25.04.12 nk opt - open internet browser and navigate to the given URL
  params: array[0..MAX_PATH] of Char; //25.04.12 nk old=MAXBYTE
begin
  StrPCopy(params, cQUOTE + URL + cQUOTE);
  ShellExecute(Application.Handle, SHELL_EXEC, INET_BROWSER_OPEN, params, nil, SW_SHOW);
end;

function OpenWebSite(WebSite: string): Boolean;
var //25.04.12 nk opt - return True if successfull
  url: array[0..MAX_PATH] of Char; //25.04.12 nk old=MAXBYTE
begin
  StrPCopy(url, WebSite);
  Result := (ShellExecute(Application.Handle, SHELL_EXEC, url, nil, nil, SW_SHOWNORMAL) > SHELL_ERROR);
  Application.ProcessMessages;
end;

function OpenMailClient(Address, Subject, Body: string): Boolean;
var //return True if successfull
  param: string;
begin //29.11.11 nk add ff - replace reserved characters by it's %-constants
  Subject := StringReplace(Subject, cAMPER, INET_AMPER, [rfReplaceAll]);
  Subject := StringReplace(Subject, cEQUAL, INET_EQUAL, [rfReplaceAll]);
  Subject := StringReplace(Subject, cQUEST, INET_QUEST, [rfReplaceAll]);
  Body    := StringReplace(Body,    cAMPER, INET_AMPER, [rfReplaceAll]);
  Body    := StringReplace(Body,    cEQUAL, INET_EQUAL, [rfReplaceAll]);
  Body    := StringReplace(Body,    cQUEST, INET_QUEST, [rfReplaceAll]);

  param  := INET_PROTOCOL_MAIL + Address + INET_MAIL_SUBJECT + Subject + INET_MAIL_BODY + Body;
  Result := (ShellExecute(Application.Handle, SHELL_EXEC, PChar(param), nil, nil, SW_SHOWNORMAL) > SHELL_ERROR);
  Application.ProcessMessages;
end;

procedure SendMail(Subject, Body, Address: string; Attachs: array of string);
var //22.11.09 nk add
  i: Integer;
  mmsg, mses: Variant;
begin
  mses := CreateOleObject(INET_MAPI_SESSION);
  try
    mmsg := CreateOleObject(INET_MAPI_MESSAGE);
    try
      mses.DownLoadMail := False;
      mses.NewSession   := False;
      mses.LogonUI      := True;
      mses.SignOn;

      mmsg.SessionID    := mses.SessionID;
      mmsg.Compose;
      mmsg.RecipIndex   := 0;
      mmsg.RecipAddress := Address;
      mmsg.MsgSubject   := Subject;
      mmsg.MsgNoteText  := Body;

      for i := Low(Attachs) to High(Attachs) do begin
        mmsg.AttachmentIndex := i;
        mmsg.AttachmentPathName := Attachs[i];
      end;

      mmsg.Send(True);
      mses.SignOff;
    finally
      VarClear(mses);
    end;
  finally
    VarClear(mmsg);
  end;
end;

initialization
  Set8087CW($133F); //30.07.08 nk add - prevent floating point error
  InetAbort      := False;         //04.05.13 nk add
  InetReturn     := NERR_SUCCESS;  //26.01.08 nk add
  ConnectionType := CLEAR;

end.
