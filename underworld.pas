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

procedure Initialize(var hero: THero;  var antiHero: THero; var locations: TLocations; var location: TLocation; var event: TEvent);
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
	
	antiHero.health := 10;
	antiHero.energy := 9;
	antiHero.alchohol := 3;
	
	antiHero.strength := 3;
	antiHero.intelligence := 5;
	antiHero.fortune := 5;
	
	antiHero.love := 4;
	antiHero.happy := 7;
	antiHero.reputationInGroup := 8;
	antiHero.reputationInUnderworld := 5;
	
	
	ColorWrite('[+] Hero', ColorDebug, 1);
end;

procedure Finalize(hero: THero; antiHero: THero);
begin	
	ColorWrite('[+] Finalization', ColorDebug);
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
	Finalize(hero, antiHero);
end.