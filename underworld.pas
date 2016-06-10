program Underworld;

uses
	{$IFDEF UNIX}
	cwstring,
	{$ENDIF}
	{$IFDEF WINDOWS}
	windows,
	{$ENDIF}
	sysutils,
	math,
	effects,
	storyparser,
	types,
	outputcolor,
	engine;

procedure Initialize(var hero: THero; var locations: TLocations; var location: TLocation; var event: TEvent);
begin
	{$IFDEF WINDOWS}
	SetConsoleOutputCP(CP_UTF8);
	{$ENDIF}
	ColorWrite('Привет, Дно.', 'Yellow', 1);
	
	ColorWrite('[+] Initizlization', ColorDebug, 1);
	LoadStory('Story', locations);
	
	location := locations[0];
	event := location.events[0];
	
	ColorWrite('[+] Events', ColorDebug, 1);
	
	hero.health := 9;
	hero.energy := 7;
	hero.alchohol := 1;
	
	hero.strength := 6;
	hero.intelligence := 6;
	hero.fortune := 0;
	
	hero.love := 0;
	hero.happy := 5;
	hero.reputationInGroup := 5;
	hero.reputationInUnderworld := 3;
	
	ColorWrite('[+] Hero', ColorDebug, 1);
end;

procedure Finalize(hero: THero);
begin	
	ColorWrite('[+] Finalization', ColorDebug);
end;

var
	hero: THero;
	locations: TLocations;
	location: TLocation;
	event: TEvent;
	
begin
	Initialize(hero, locations, location, event);
	Playing(hero, locations, location, event);
	Finalize(hero);
end.