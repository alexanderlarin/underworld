program Underworld;

uses
	{$IFDEF UNIX}
	cwstring,
	{$ENDIF}
	{$IFDEF WINDOWS}
	windows,
	{$ENDIF}
	math;
	
	
type
	THero = record
		depth: Integer;
		
		Health: Integer;
		Energy: Integer;
		Alchohol: Integer;
		
		Strength: Integer;
		Agility: Integer;
		Intelligence: Integer;
		Fortune: Integer;
	
		ReputationInGroup: Integer;
		ReputationInUnderworld: Integer;	
	end;
	
	TCommand = record
		name: String;
		text: String;
		cmd: String;
		toEvent: String;
	end;
	
	TCommands = array [0..1] of TCommand;
	
	TEvent = record
		name: String;
		text: String;
		commands: TCommands;
	end;
	
	TEvents = array of TEvent;

const	
	InitEvent : TEvent = (
		name: 'Контроша';
		text: 'Препод без предупреждения даёт контрошу';
		commands: (
		(name: 'Свалить'; text: 'Ты свалил(а) с контры'; cmd: '1'; toEvent: 'Разбудили одногруппники';), 
		(name: 'Писать'; text: 'Ты решил(а) написать контру'; cmd: '2'; toEvent: 'Вызвали к доске'));
	);	
	
function ReadToken(var text: TextFile; var token: String): Boolean;
var
	ch: Char;
	isStarted: Boolean;
begin
	isStarted := False;
	token := '';
	while not EOF(text) do
	begin
		Read(text, ch);
		if ch in ['A'..'Z', 'a'..'z', '0'..'9'] then
			isStarted := True
		else
			if isStarted then
				break;
		if isStarted then
			token := token + ch;
	end;
	ReadToken := not EOF(text);
end;

function LoadStory(filename: String): Boolean;
var
	text: TextFile;
	s: String;
begin
	Assign(text, filename);
	Reset(text);
	while ReadToken(text, s) do
		WriteLn('Token: ', s);
	Close(text);
end;
	


procedure Initialize(var hero: THero; var events: TEvents);
begin
	WriteLn('[+] Initizlization');
	LoadStory('./story.spt');
	
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
	SetLength(events, 3);
	events[0].name := 'Первая пара';
	events[0].text := 'Ты пришел(а) к первой паре';
	//SetLength(events[0].commands, 2);
	events[0].commands[0].name := 'Слушать';
	events[0].commands[0].text := 'Ты прослушал(а) пару';
	events[0].commands[0].cmd := '1';
	events[0].commands[0].toEvent := 'Вызвали к доске';
	events[0].commands[1].name := 'Спать';
	events[0].commands[1].text := 'Ты проспал(а) пару';
	events[0].commands[1].cmd := '2';
	events[0].commands[1].toEvent := 'Разбудили одногруппники';
	events[1].name := 'Вызвали к доске';
	events[1].text := 'Тебя вызывали к доске';
	//SetLength(events[1].commands, 2);
	events[1].commands[0].name := 'Тупануть';
	events[1].commands[0].text := 'Ты тупанул(а) у доски';
	events[1].commands[0].cmd := '1';
	events[1].commands[0].toEvent := 'Разбудили одногруппники';
	events[1].commands[1].name := 'Не пойти';
	events[1].commands[1].text := 'Ты не пошел(а) к доске';
	events[1].commands[1].cmd := '2';
	events[1].commands[1].toEvent := 'Вызвали к доске';
	events[2].name := 'Разбудили одногруппники';
	events[2].text := 'Тебя разбудили одногруппники';
	//SetLength(events[2].commands, 2);
	events[2].commands[0].name := 'Тупануть';
	events[2].commands[0].text := 'Ты тупанул(а)';
	events[2].commands[0].cmd := '1';
	events[2].commands[0].toEvent := 'Вызвали к доске';
	events[2].commands[1].name := 'Спать дальше';
	events[2].commands[1].text := 'Ты решил(а) спать дальше';
	events[2].commands[1].cmd := '2';
	events[2].commands[1].toEvent := 'Разбудили одногруппники';
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
			WriteLn(event.commands[I].text);
			for J := 0 to Length(events) - 1 do
				if events[J].name = event.commands[I].toEvent then
				begin
					event := events[J];
					exit();
				end;
		end;
	Fall := True;
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