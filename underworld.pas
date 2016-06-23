program Underworld;

uses
	effects,
	echo,
	engine,
	initializing,
	finalizing,
	outputcolor,
	screens,
	types;	

procedure Initialize(var locations: TLocations; var status: TStatus);
begin
	//ColorWrite('[+] Initizlization', ColorDebug, 1);
	isCredits := false;
	InitEncoding();
	
	ShowMenu();
	
	InitCanvas();
	InitSettings();
	InitLocations(locations, status.currentPosition);
	InitHeroes(status.hero, status.antiHero);
	
	
	
	PrintLocation(status.currentPosition.location.name);
	PrintCurrentStatsHero(status.hero);
	PrintEvent(status.currentPosition.event, 0, false);
	PrintCommands(status.currentPosition.event.commands);
end;

procedure Finalize(var locations: TLocations; var status: TStatus);
begin	
	if isCredits then
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
end.