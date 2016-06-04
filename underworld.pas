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
	crt,
	effects,
	storyparser,
	types,
	coloredtext;

procedure Initialize(var hero: THero; var locations: TLocations);
begin
	{$IFDEF WINDOWS}
	SetConsoleCP(CP_UTF8);
	SetConsoleOutputCP(CP_UTF8);
	{$ENDIF}
	MsgColor('[+] Initizlization', ColorDebug, 1);
	LoadStory('Story', locations);
	
	MsgColor('[+] Hero', ColorDebug, 1);
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
	
	MsgColor('[+] Events', ColorDebug, 1);
end;

procedure Finalize(hero: THero);
begin
	if (hero.depth > 5) then
	begin
		MsgColor('[+] You''re really unlucky man. Your depth is ', ColorFinish);
		MsgColor(hero.depth, ColorFinish, 1);
	end;
		
	MsgColor('[+] Finalization', ColorDebug);
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
				MsgColor('Переход на локацию "', ColorTransLocation);
				MsgColor(location.name.text, ColorLocation);
				MsgColor('" ', ColorTransLocation);
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
				MsgColor('к событию "', ColorTransLocation);
				MsgColor(event.name.text, ColorEventName);
				MsgColor('" ', ColorTransLocation, 1);
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
	MsgColor('=======ХАРАКТЕРИСТИКИ ПЕРСОНАЖА=======',ColorDefault,1);
	MsgColor('Здоровье: ', ColorAttribute);
	MsgColor(hero.Health, ColorNumber);
	MsgColor('%', ColorNumber, 1);
	MsgColor('Бодрость: ', ColorAttribute);
	MsgColor(hero.Energy, ColorNumber);
	MsgColor('%', ColorNumber, 1);
	MsgColor('Содержание алкоголя: ', ColorAttribute);
	MsgColor(hero.Alchohol, ColorNumber);
	MsgColor('%', ColorNumber, 2);

	MsgColor('Сила: ',ColorAttribute);
	MsgColor(hero.Strength, ColorNumber, 1);
	MsgColor('Ловкость: ', ColorAttribute);
	MsgColor(hero.Agility, ColorNumber, 1);
	MsgColor('Интеллект: ',ColorAttribute);
	MsgColor(hero.Intelligence, ColorNumber, 1);
	MsgColor('Удача: ',ColorAttribute);
	MsgColor(hero.Fortune, ColorNumber, 1);
	MsgColor('======================================', ColorDefault, 1);
	MsgColor(event.text.text, event.text.color, 1);
	for I := 0 to Length(event.commands) - 1 do
	begin
		MsgColor(event.commands[I].cmd, ColorNumber);
		MsgColor(': ', ColorDefault);
		MsgColor(event.commands[I].name.text, event.commands[I].name.color, 1);
	end;
	MsgColor('Введите команду: ', ColorDefault);
	ReadLn(cmd);
	for I := 0 to Length(event.commands) - 1 do
		if event.commands[I].cmd = cmd then
		begin
			MsgColor(event.commands[I].text.text, event.commands[I].text.color, 1);
			
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
	{$IFDEF WINDOWS}
	SetConsoleOutputCP(1251);
	{$ENDIF}
	MsgColor('Привет, Дно.', 'Yellow', 1);
	
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