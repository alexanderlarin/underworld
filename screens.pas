unit Screens;

interface
	uses
		canvas,
		outputcolor;
		
	procedure ShowMenu();
	procedure ShowCredits();
	procedure WriteCenter(text: String; color: String; var line: Integer);
	procedure WriteCredit(title: String; name: String; var line: Integer);
	procedure WriteCredit(title: String; names: array of String; var line: Integer);
	
implementation
	procedure ShowMenu();
	begin
		CanvasClear();
		GotoXY(4, 2);
		ColorWrite(' _   _  _   _ ______  _____ ______  _    _  _____ ______  _     ______ ', ColorDefault, 1, 1, 80);
		GotoXY(4, 3);
		ColorWrite('| | | || \ | ||  _  \|  ___|| ___ \| |  | ||  _  || ___ \| |    |  _  \', ColorDefault, 1, 1, 80);
		GotoXY(4, 4);
		ColorWrite('| | | ||  \| || | | || |__  | |_/ /| |  | || | | || |_/ /| |    | | | |', ColorDefault, 1, 1, 80);
		GotoXY(4, 5);
		ColorWrite('| | | || . ` || | | ||  __| |    / | |/\| || | | ||    / | |    | | | |', ColorDefault, 1, 1, 80);
		GotoXY(4, 6);
		ColorWrite('| |_| || |\  || |/ / | |___ | |\ \ \  /\  /\ \_/ /| |\ \ | |____| |/ / ', ColorDefault, 1, 1, 80);
		GotoXY(4, 7);
		ColorWrite(' \___/ \_| \_/|___/  \____/ \_| \_| \/  \/  \___/ \_| \_|\_____/|___/  ', ColorDefault, 1, 1, 80);		
		GotoXY(70, 8);
		ColorWrite('v.1.0', ColorLocation);
	
		
		GotoXY(23, 14);
		ColorWrite('Нажмите Enter, чтобы начать игру', 'White', 1);
		GotoXY(0, ConsoleHeight);
		
		ReadLn; 
		
	end;
	
	procedure WriteCenter(text: String; color: String; var line: Integer);
	begin
		GotoXY((ConsoleWidth div 2) - (Length(UTF8Decode(text)) div 2), line);
		ColorWrite(text, color);
		line := line + 1;
	end;
	
	procedure WriteCredit(title: String; name: String; var line: Integer);
	begin
		WriteCenter(title, ColorEventText, line);
		WriteCenter(name, ColorTransitionText, line);
		line := line + 1;
	end;
	
	procedure WriteCredit(title: String; name1: String; name2: String; var line: Integer);
	begin
		WriteCenter(title, ColorEventText, line);
		WriteCenter(name1, ColorTransitionText, line);
		WriteCenter(name2, ColorTransitionText, line);
		line := line + 1;
	end;
	
	procedure WriteCredit(title: String; names: array of String; var line: Integer);
	var
		I: Integer;
	begin
		WriteCenter(title, ColorEventText, line);
		for I := 0 to Length(names) - 1 do
			WriteCenter(names[I], ColorTransitionText, line);
		line := line + 1;
	end;
	
	procedure ShowCredits();
	var 
		line: Integer;
		people: array of string;
	begin
		CanvasClear();
		line := 2;

		WriteCredit('Автор идеи', 'Александр Ларин', line);
		WriteCredit('Ведущий разработчик', 'Александр Ларин', line);		
		WriteCredit('Сценарий', 'Владислав Белоусов', 'Сергей Белоусов', line);
		
		SetLength(people, 8);
		people[0] := 'Александр Акатов';
		people[1] := 'Александр Анчишкин';
		people[2] := 'Владислав Белоусов';
		people[3] := 'Сергей Белоусов';
		people[4] := 'Никита Васильков';
		people[5] := 'Илья Кретинин';
		people[6] := 'Артём Сидякин';
		people[7] := 'Анастасия Швецова';
		
		WriteCredit('Программисты', people, line);
	
		GotoXY(0, ConsoleHeight);
		ColorWrite('Enter >> ', ColorTransitionText);
		Readln;
		line := 1;
		CanvasClear();
		WriteCredit('Цветной текст', 'Александр Акатов', line);
		WriteCredit('Антогонист', 'Никита Васильков', line);
		WriteCredit('Эффекты над персонажами', 'Илья Кретинин', line);
		WriteCredit('Система переходов между событиями', 'Анастасия Швецова', line);
		WriteCredit('Система локаций', 'Артём Сидякин', 'Александр Анчишкин', line);
		WriteCredit('Самые кривые костыли сделали:', 'Артём Сидякин', 'Александр Анчишкин', line);		
		WriteCredit('', 'IBAS © 2016', line);
		GotoXY(0, ConsoleHeight);
		ColorWrite('Нажмите Enter для выхода...', ColorTransitionText);
		ReadLn;
	end;
end.