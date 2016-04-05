program Underworld;

uses
	{$IFDEF UNIX}
	cwstring,
	{$ENDIF}
	{$IFDEF WINDOWS}
	windows,
	{$ENDIF}
	math;
	
type
	THero = record
		depth: Integer;
	end;
	
procedure Initialize(var hero: THero);
begin
	WriteLn('[+] Initizlization');
	WriteLn('[+] Hero');
	hero.depth := 0;
end;

procedure Finalize(hero: THero);
begin
	if (hero.depth > 5) then
		WriteLn('[+] You''re really unlucky man. Your depth is ', hero.depth);
	WriteLn('[+] Finalization');
end;

function Fall(var hero: THero): Boolean;
begin
	WriteLn('[-]Falling in Depth = ', hero.depth);
	Inc(hero.depth);
	Fall := hero.depth < 10;
end;

var
	isFalling: Boolean;
	hero: THero;
	
begin
	{$IFDEF WINDOWS}
	SetConsoleOutputCP(CP_UTF8);
	{$ENDIF}
	WriteLn('Привет, Дно.');
	
	Initialize(hero);
	repeat
		isFalling := Fall(hero);
	until (not isFalling);
	Finalize(hero);
end.