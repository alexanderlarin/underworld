program Underworld;

uses
	{$IFDEF UNIX}
	cwstring,
	{$ENDIF}
	{$IFDEF WINDOWS}
	windows,
	{$ENDIF}
	math;
 
begin
	{$IFDEF WINDOWS}
	SetConsoleOutputCP(CP_UTF8);
	{$ENDIF}
	WriteLn('Привет, Дно.');
end.