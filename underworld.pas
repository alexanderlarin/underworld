program Underworld;

uses
	effects,
	engine,
	initializing,
	finalizing,
	outputcolor,
	types;	

procedure Initialize(var locations: TLocations; var status: TStatus);
begin
	//ColorWrite('[+] Initizlization', ColorDebug, 1);
	InitEncoding();
	InitCanvas();
	InitSettings();
	InitLocations(locations, status.currentPosition);
	InitHeroes(status.hero, status.antiHero);
	
	PrintLocation(status.currentPosition.location.name);
	PrintCurrentStatsHero(status.hero);
	PrintEvent(status.currentPosition.event, 0, true);
	PrintCommands(status.currentPosition.event.commands);
end;

procedure Finalize(var locations: TLocations; var status: TStatus);
begin	
	DisposeAll(locations, status);
end;

var
	status: TStatus;	
	locations: TLocations;
	
begin
	Initialize(locations, status);
	Playing(locations, status);
	Finalize(locations, status);
end.