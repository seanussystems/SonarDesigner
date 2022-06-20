// INI-File Handling
// Date 24.02.14

// 12.04.11 nk opt improved error handling usin try..except instead of try..finally
// 15.04.11 nk upt migrate to XE/Unicode - use TRzRegIniFile (UTF-8) instead if TIniFile (ANSI)
// 01.03.12 nk opt replace WriteLn with WriteALine to write ANSI or UTF-8 encoded INI-file
// 01.03.12 nk opt replace ReadLn with ReadALine to read ANSI or UTF-8 encoded INI-files
// 02.03.12 nk add new global variable IniEncoder to set ANSI or UTF-8 file encoding

/// TRzRegIniFile component to use the TMemIniFile class instead of TIniFile.
/// This was done because the TMemIniFile provides support for reading and
/// writing an Unicode encoded text file.
/// As a result of the change above, a new FileEncoding property has been added
/// to the TRzRegIniFile component. This property is only used in RAD Studio 2009
/// or higher, which provides Unicode support and file encodings. The default is
/// feDefault. The other options are feUTF8 and feUnicode.

/// TIniFile class uses the Windows API which imposes a limit of 64kB file size
/// and max. 8kB per section! Use the double slash '//' for comments.

unit UInifile;

interface

uses //01.03.12 add UFile / 15.04.11 nk add RzCommon
  Windows, Messages, SysUtils, Forms, Classes, Variants, IniFiles, RzCommon,
  UGlobal, UFile;

const
  INI_KEY_LEFT   = 'Left';
  INI_KEY_TOP    = 'Top';
  INI_KEY_WIDTH  = 'Width';
  INI_KEY_HEIGHT = 'Height';
  INI_KEY_STATE  = 'State';

var
  IniFile: string;
  IniEncoder: string;              //03.02.12 nk add
  IniEncoding: TRzIniFileEncoding; //15.04.11 nk add

  function IniValueExists(IniSection, IniKey: string): Boolean; //12.04.11 nk add
  function GetIniValue(IniSection, IniKey, IniDefault: string): string;
  function SetIniValue(IniSection, IniKey, IniValue: string): Boolean;
  function DelIniValue(IniSection, IniKey: string): Boolean;    //17.11.09 nk add
  function DelIniSection(IniSection: string): Boolean;          //11.04.11 nk add
  procedure SetIniParameter(Sender: TObject);
  procedure GetIniParameter(Sender: TObject);
  procedure CleanupIniFile;  //07.12.09 nk add

implementation

function IniValueExists(IniSection, IniKey: string): Boolean;
var //15.04.11 nk opt xe
  ini: TRzRegIniFile;
begin
  ini := TRzRegIniFile.Create(Application);
  ini.PathType     := ptIniFile;   //15.04.11 nk add ff
  ini.Path         := IniFile;
  ini.FileEncoding := IniEncoding;

  try
    if IniKey = cEMPTY then
      Result := ini.SectionExists(IniSection)        //True=section exists
    else
      Result := ini.ValueExists(IniSection, IniKey); //True=Value exists
  except
    Result := False;
  end;

  ini.Free;
end;

function GetIniValue(IniSection, IniKey, IniDefault: string): string;
var //15.04.11 nk opt xe
  ini: TRzRegIniFile;
begin
  Result := cEMPTY;
  ini    := TRzRegIniFile.Create(Application);
  ini.PathType     := ptIniFile;   //15.04.11 nk add ff
  ini.Path         := IniFile;
  ini.FileEncoding := IniEncoding;

  try
    Result := ini.ReadString(IniSection, IniKey, IniDefault);
  except
    Result := cEMPTY;
  end;

  ini.Free;
  if Result = cEMPTY then Result := IniDefault;
end;

function SetIniValue(IniSection, IniKey, IniValue: string): Boolean;
var //15.04.11 nk opt xe
  ini: TRzRegIniFile;
begin
  Result := True;
  ini    := TRzRegIniFile.Create(Application);
  ini.PathType     := ptIniFile;   //15.04.11 nk add ff
  ini.Path         := IniFile;
  ini.FileEncoding := IniEncoding;

  try
    ini.WriteString(IniSection, IniKey, IniValue);
  except
    Result := False;
  end;

  ini.Free;
end;

function DelIniValue(IniSection, IniKey: string): Boolean;
var //15.04.11 nk opt xe
  ini: TRzRegIniFile;
begin
  Result := True;
  ini    := TRzRegIniFile.Create(Application);
  ini.PathType     := ptIniFile;   //15.04.11 nk add ff
  ini.Path         := IniFile;
  ini.FileEncoding := IniEncoding;

  try
    ini.DeleteKey(IniSection, IniKey);
  except
    Result := False;
  end;

  ini.Free;
end;

function DelIniSection(IniSection: string): Boolean;
var //15.04.11 nk opt xe
  ini: TRzRegIniFile;
begin
  Result := True;
  ini    := TRzRegIniFile.Create(Application);
  ini.PathType     := ptIniFile;   //15.04.11 nk add ff
  ini.Path         := IniFile;
  ini.FileEncoding := IniEncoding;

  try
    if ini.SectionExists(IniSection) then
      ini.EraseSection(IniSection);
  except
    Result := False;
  end;

  ini.Free;
end;

procedure SetIniParameter(Sender: TObject);
begin //save form position and dimension to INI-file
  with Sender as TForm do begin
    if WindowState = wsMinimized then begin
      SetIniValue(Hint, INI_KEY_STATE,  ISOFF);
    end else begin
      SetIniValue(Hint, INI_KEY_STATE,  ISON);
      SetIniValue(Hint, INI_KEY_LEFT,   IntToStr(Left));
      SetIniValue(Hint, INI_KEY_TOP,    IntToStr(Top));
      SetIniValue(Hint, INI_KEY_WIDTH,  IntToStr(Width));
      SetIniValue(Hint, INI_KEY_HEIGHT, IntToStr(Height));
    end;
  end;
end;

procedure GetIniParameter(Sender: TObject);
begin //12.04.11 nk opt - load form position and dimension from INI-file
  with Sender as TForm do begin //11.03.11 nk opt ff use StrToIntDef
    Left   := StrToIntDef(GetIniValue(Hint, INI_KEY_LEFT,   IntToStr(Left)),   Left);
    Top    := StrToIntDef(GetIniValue(Hint, INI_KEY_TOP,    IntToStr(Top)),    Top);
    Width  := StrToIntDef(GetIniValue(Hint, INI_KEY_WIDTH,  IntToStr(Width)),  Width);
    Height := StrToIntDef(GetIniValue(Hint, INI_KEY_HEIGHT, IntToStr(Height)), Height);

    if GetIniValue(Hint, INI_KEY_STATE, ISON) = ISOFF then begin
      WindowState := wsMinimized;
    end else begin
      WindowState := wsNormal;
    end;
  end;
end;

procedure CleanupIniFile;
var //02.03.12 nk opt - remove empty or invalid lines and beautify structure
  first: Boolean; //INI-File ending must not necessarily be .ini (e.g. .swi)
  ext: string;    //NOTE: Set global IniEncoder to set ANSI or UTF-8 file encoding
  temp: string;
  line: string;
  dfile: TextFile;
  sfile: TextFile;
begin
  if not FileExists(IniFile) then Exit;

  try
    first := True;
    ext   := ExtractFileExt(IniFile);  //14.12.09 nk add - get ini file ending (with dot)
    temp  := cDOT + FormatDateTime(FORM_FILE_LONG, Now);
    temp  := StringReplace(IniFile, ext, temp, [rfIgnoreCase]); //old=INI_END

    RenameFile(IniFile, temp);

    FileMode := fmOpenRead or fmShareDenyNone; //set read only file access
    AssignFile(sfile, temp);

    try
      CloseFile(sfile);          //14.12.09 nk opt ff - make sometimes I/O error 103 !?!
    except
      IOResult;                  //ignore if file was already closed
    end;

    Reset(sfile);

    FileMode := fmOpenReadWrite; //set read/write file access
    AssignFile(dfile, IniFile);  //create new empty file

    try
      CloseFile(dfile);          //14.12.09 nk opt ff - make sometimes I/O error 103 !?!
    except
      IOResult;                  //ignore if file was already closed
    end;

    Rewrite(dfile);

    try
      repeat
        ReadALine(sfile, line, IniEncoder);        //02.03.12 nk add IniEncoder
        line := Trim(line);                        //cut white spaces

        if (Pos(cEQUAL, line)   = 0) and           //invalid key=value line
           (Pos(cLBRACK, line) <> 1) and           //not a [section] line
           (Pos(cSLASH, line)  <> 1) then          //not a comment
          line := cEMPTY;

        if Pos(cEQUAL, line) = 1 then
          line := cEMPTY;                          //no key defined

        if Pos(cLBRACK, line) = 1 then begin       //[section] line
          if not first then                        //02.03.12 nk add IniEncoder
            WriteALine(dfile, cEMPTY, IniEncoder); //insert an empty line before a section
          first := False;                          //except the first section
        end;

        if line <> cEMPTY then
          WriteALine(dfile, line, IniEncoder);     //02.03.12 nk add IniEncoder

      until EOF(sfile);
    finally
      CloseFile(dfile);
      CloseFile(sfile);
      DeleteFile(temp);
    end;
  except
    IOResult;  //clear file error
  end;
end;

initialization //02.03.12 nk opt - support for Unicode/UTF-8
  IniFile     := StringReplace(Application.ExeName, EXE_END, INI_END, [rfIgnoreCase]);
  IniEncoding := feUTF8;
  IniEncoder  := ENCODING_UTF8;

end.
