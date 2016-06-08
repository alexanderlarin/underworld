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
	outputcolor;

procedure Initialize(var hero: THero; var locations: TLocations);
begin
	{$IFDEF WINDOWS}
	SetConsoleOutputCP(CP_UTF8);
	{$ENDIF}
	ColorWrite('Привет, Дно.', 'Yellow', 1);
	
	ColorWrite('[+] Initizlization', ColorDebug, 1);
	LoadStory('Story', locations);
	
	ColorWrite('[+] Hero', ColorDebug, 1);
	hero.depth := 0;
	hero.Health := 75;
	hero.Energy := 15;
	hero.Alchohol := 23;
	
	hero.Strength := 26;
	hero.Intelligence := 10;
	hero.Agility := 45;
	hero.Fortune := 0;
	
	hero.ReputationInGroup := 78;
	hero.ReputationInUnderworld := 5;
	
	ColorWrite('[+] Events', ColorDebug, 1);
end;

procedure Finalize(hero: THero);
begin
	if (hero.depth > 5) then
	begin
		ColorWrite('[+] You''re really unlucky man. Your depth is ', ColorFinish);
		ColorWrite(hero.depth, ColorFinish, 1);
	end;
		
	ColorWrite('[+] Finalization', ColorDebug);
end;

function ChangeLocation(locations: TLocations; var location: TLocation; toLocation: String): Boolean;
var
	I: Integer;
begin
	if toLocation <> '' then
	begin
		for I := 0 to (Length(locations) - 1) do
		begin
			if locations[I].name.text = toLocation then
			begin	
				location := locations[I];
				ColorWrite('Переход на локацию "', ColorTransLocation);
				ColorWrite(location.name.text, ColorLocation);
				ColorWrite('" ', ColorTransLocation);
				Exit(True);
			end;	
		end;	
	end;
	Exit(False);
end;

function ChangeEvent(events: TEvents; var event: TEvent; toEvent: String): Boolean;
var
	I: Integer;
begin
	if toEvent <> '' then
	begin
		for I := 0 to (Length(events) - 1) do
		begin
			if events[I].name.text = toEvent then
			begin	
				event := events[I];
				ColorWrite('к событию "', ColorTransLocation);
				ColorWrite(event.name.text, ColorEventName);
				ColorWrite('" ', ColorTransLocation, 1);
				Exit(True);
			end;	
		end;	
	end;
	Exit(False);
end;

function Fall(var hero: THero; var event: TEvent; events: TEvents; var location: String): Boolean;
var
	I, J, K, L: Integer;
	isTransition: Boolean;
	transition: TTransition;
	condition: TCondition;
	cmd: String;
begin
	isTransition := false;
	ColorWrite('=======ХАРАКТЕРИСТИКИ ПЕРСОНАЖА=======',ColorDefault,1);
	ColorWrite('Здоровье: ', ColorAttribute);
	ColorWrite(hero.Health, ColorNumber);
	ColorWrite('%', ColorNumber, 1);
	ColorWrite('Бодрость: ', ColorAttribute);
	ColorWrite(hero.Energy, ColorNumber);
	ColorWrite('%', ColorNumber, 1);
	ColorWrite('Содержание алкоголя: ', ColorAttribute);
	ColorWrite(hero.Alchohol, ColorNumber);
	ColorWrite('%', ColorNumber, 2);

	ColorWrite('Сила: ',ColorAttribute);
	ColorWrite(hero.Strength, ColorNumber, 1);
	ColorWrite('Ловкость: ', ColorAttribute);
	ColorWrite(hero.Agility, ColorNumber, 1);
	ColorWrite('Интеллект: ',ColorAttribute);
	ColorWrite(hero.Intelligence, ColorNumber, 1);
	ColorWrite('Удача: ',ColorAttribute);
	ColorWrite(hero.Fortune, ColorNumber, 1);
	ColorWrite('======================================', ColorDefault, 1);
	ColorWrite(event.text.text, event.text.color, 1);
	for I := 0 to Length(event.commands) - 1 do
	begin
		ColorWrite(event.commands[I].cmd, ColorNumber);
		ColorWrite(': ', ColorDefault);
		ColorWrite(event.commands[I].name.text, event.commands[I].name.color, 1);
	end;
	ColorWrite('Введите команду: ', ColorDefault);
	ReadLn(cmd);
	for I := 0 to Length(event.commands) - 1 do
		if event.commands[I].cmd = cmd then
		begin
			ColorWrite(event.commands[I].text.text, event.commands[I].text.color, 1);
			
			for J := 0 to Length(event.commands[I].transitions) - 1 do
			begin
				isTransition := true;
				transition := event.commands[I].transitions[J];
				for K := 0 to Length(transition.conditions) - 1 do
				begin		
					condition := transition.conditions[K];
					if (condition.name = '=') then
						if not (GetAttrHero(hero, condition.attribute) = condition.Value) then
						begin
							isTransition := false;
							break;
						end;
						
					if (condition.name = '>') then
						if not (GetAttrHero(hero, condition.attribute) > condition.Value) then
						begin
							isTransition := false;
							break;
						end;
					
					if (condition.name = '<') then
						if not (GetAttrHero(hero, condition.attribute) < condition.Value) then
						begin
							isTransition := false;
							break;
						end;
				end;
				if (isTransition) then
				begin
					Affect(hero, transition.effects);
					if (transition.toLocation <> '') then
					begin
						location := transition.toLocation;
						event.name.text := transition.toEvent;
						Exit(False);
					end
					else
					begin
						for L := 0 to Length(events) - 1 do
							if events[L].name.text = transition.toEvent then
							begin					
								event := events[L];
								Exit(true);
							end;
					end;
				end;
			end;	
		end;
	Exit(True);
end;

var
	isFalling: Boolean;
	isLocating: Boolean;
	location: TLocation;
	locations: TLocations;
	hero: THero;
	event: TEvent;
	toLocation: String;
	
begin
	Initialize(hero, locations);
	location := locations[0];
	event := location.events[0];
	repeat		
		repeat
			isFalling := Fall(hero, event, location.events, location.name.text);
		until (not isFalling);
		isLocating := ChangeLocation(locations, location, location.name.text);
		isLocating := ChangeEvent(location.events, event, event.name.text);
	until (not isLocating);
	Finalize(hero);
end.