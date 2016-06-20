program Underworld;

uses
	effects,
	engine,
	initializing,
	finalizing,
	outputcolor,
	types;	

procedure Initialize(var hero: THero;  var antiHero: THero; var locations: TLocations; var location: TLocation; var event: TEvent);
begin
	//ColorWrite('[+] Initizlization', ColorDebug, 1);
	InitEncoding();
	InitCanvas();
	InitSettings();
	InitLocations(locations, location, event);
	InitHeroes(hero, antiHero);
	
	PrintLocation(location.name);
	PrintCurrentStatsHero(hero);
	PrintEvent(event, 0, true);
	PrintCommands(event.commands);
end;

procedure Finalize(var hero: THero;  var antiHero: THero; var locations: TLocations; var location: TLocation; var event: TEvent);
begin	
	DisposeAll(hero, antiHero, locations, location, event);
end;

var
	hero: THero;
	antiHero: THero;
	locations: TLocations;
	location: TLocation;
	event: TEvent;
	
begin
	Initialize(hero, antiHero, locations, location, event);
	Playing(hero, antiHero, locations, location, event);
	Finalize(hero, antiHero, locations, location, event);
end.