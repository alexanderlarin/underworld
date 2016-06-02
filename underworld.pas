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
	types;

procedure Initialize(var hero: THero; var events: TEvents);
begin
	WriteLn('[+] Initizlization');
	LoadStory('./story.spt', events);
	
	WriteLn('[+] Hero');
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
	
	WriteLn('[+] Events');
end;

procedure Finalize(hero: THero);
begin
	if (hero.depth > 5) then
		WriteLn('[+] You''re really unlucky man. Your depth is ', hero.depth);
	WriteLn('[+] Finalization');
end;

function Fall(var hero: THero; var event: TEvent; events: TEvents): Boolean;
var
	I, J: Integer;
	cmd: String;
begin
	WriteLn('=======ХАРАКТЕРИСТИКИ ПЕРСОНАЖА=======');
	WriteLn('Здоровье: ', hero.Health, '%');
	WriteLn('Бодрость: ', hero.Energy, '%');
	WriteLn('Содержание алкоголя: ', hero.Alchohol, '%');
	WriteLn();
	WriteLn('Сила: ', hero.Strength);
	WriteLn('Ловкость: ', hero.Agility);
	WriteLn('Интеллект: ', hero.Intelligence);
	WriteLn('Удача: ', hero.Fortune);
	WriteLn('======================================');
	WriteLn(event.text);
	for I := 0 to Length(event.commands) - 1 do
		WriteLn(event.commands[I].cmd, ': ', event.commands[I].name);
	Write('Введите команду: ');
	ReadLn(cmd);
	for I := 0 to Length(event.commands) - 1 do
		if event.commands[I].cmd = cmd then
		begin
			WriteLn(event.commands[I].text);
			//Affect(hero, event.commands[I].effects);
			for J := 0 to Length(events) - 1 do
				if events[J].name = event.commands[I].transitions[0].toEvent then
				begin
					event := events[J];
					Exit(True);
				end;
		end;
	Exit(False);
end;

var
	isFalling: Boolean;
	hero: THero;
	events: TEvents;
	event: TEvent;
	
begin
	{$IFDEF WINDOWS}
	SetConsoleOutputCP(CP_UTF8);
	{$ENDIF}
	WriteLn('Привет, Дно.');
	
	Initialize(hero, events);
	event := events[0];
	//event := InitEvent;
	repeat
		isFalling := Fall(hero, event, events);
	until (not isFalling);
	Finalize(hero);
end.