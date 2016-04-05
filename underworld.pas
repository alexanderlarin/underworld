program Underworld;

uses
	{$IFDEF UNIX}
	cwstring,
	{$ENDIF}
	{$IFDEF WINDOWS}
	windows,
	{$ENDIF}
	math;
	
procedure Initialize();
begin
	WriteLn('[+]Initizlization');
end;

procedure Finalize();
begin
	WriteLn('[+]Finalization');
end;

function Fall(): Boolean;
begin
	WriteLn('[-]Falling');
	Fall := True;
end;

var
	isFalling: Boolean;
	depth: Integer;
	
begin
	{$IFDEF WINDOWS}
	SetConsoleOutputCP(CP_UTF8);
	{$ENDIF}
	WriteLn('Привет, Дно.');
	
	Initialize();
	repeat
		isFalling := Fall();
		Inc(depth);
	until (not isFalling or (depth = 10));
	Finalize();
end.