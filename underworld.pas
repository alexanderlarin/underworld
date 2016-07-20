program Underworld;

{$IFDEF WINDOWS}
{$R underworld-rc.rc} 
{$ENDIF}

uses
	effects,
	echo,
	engine,
	initializing,
	finalizing,
	outputcolor,
	screens,
	{$IFDEF UNIX}
	unix,
	crt,
	{$ENDIF}
	types;

procedure Initialize(var locations: TLocations; var status: TStatus);
begin
	//ColorWrite('[+] Initizlization', ColorDebug, 1);
	status.isCredits := false;
	
	InitEncoding();
	InitSettings();
	
	ShowMenu();
	
	InitCanvas();
	
	InitLocations(locations, status.currentPosition);
	InitHeroes(status.hero, status.antiHero);
	
	
	
	PrintLocation(status.currentPosition.location.name);
	PrintCurrentStatsHero(status.hero);
	PrintEvent(status.currentPosition.event, 0, false);
	PrintCommands(status.currentPosition.event.commands);
end;

procedure Finalize(var locations: TLocations; var status: TStatus);
begin	
	if status.isCredits then
		ShowCredits();
	DisposeAll(locations, status);
end;

{$IFDEF UNIX}
function isatty(fd : Integer) : Integer; CDECL; external name 'isatty';
{$ENDIF}

var
	isPlaying: Boolean;
	status: TStatus;	
	locations: TLocations;
	
begin
	{$IFDEF UNIX and $IFNDEF DARWIN}
	//If program is not running in terminal, run it in xterm.
	//Allows to run executable directly from file manager.
	if isatty(1) = 0 then
	begin
		fpSystem(Concat('xterm -geometry 100x26 -e ', ParamStr(0)));
		Exit;
	end;
	{$ENDIF}
	repeat
		isPlaying := false;
		Initialize(locations, status);	
		isPlaying := Play(locations, status);
		Finalize(locations, status);
	until not isPlaying;
	{$IFDEF UNIX}
	//Restore terminal settings
	fpSystem('tput rs1');
	{$ENDIF}
end.