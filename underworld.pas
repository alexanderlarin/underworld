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
	
	hero.depth := 0;
	hero.health := 75;
	hero.energy := 15;
	hero.alchohol := 23;
	
	hero.strength := 26;
	hero.intelligence := 10;
	hero.agility := 45;
	hero.fortune := 0;
	
	hero.reputationInGroup := 78;
	hero.reputationInUnderworld := 5;
	
	ColorWrite('[+] Hero', ColorDebug, 1);
end;

procedure Finalize(hero: THero);
begin
	if (hero.depth > 5) then
	begin
		ColorWrite('[+] You''re really unlucky man. Your depth is ', ColorFinish);
		ColorWrite(hero.depth, ColorFinish, 1);
	end;
		
	ColorWrite('[+] Finalization', ColorDebug);
	readln;
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