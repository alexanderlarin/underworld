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
	setlocale,
	ncrt,
	{$ENDIF}
	types,
	endprogram;

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

var
	isPlaying: Boolean;
	status: TStatus;	
	locations: TLocations;
	
begin
	repeat
		isPlaying := false;
		Initialize(locations, status);	
		isPlaying := Play(locations, status);
		Finalize(locations, status);
	until not isPlaying;
	ExitProgram(0);
end.