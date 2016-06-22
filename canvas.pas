unit Canvas;

interface
	uses
		outputcolor,
		{$IFDEF WINDOWS}
		windows;
		{$ENDIF}
	const
		ConsoleWidth = 79;
		ConsoleHeight = 24;
		StatsHeight = 10;
		CommandsHeight = 7;
		PosTransitionBeginY = 12;
		PosStatsX = 51;
		PosStatX = 72;
		PosStatBeginY = 1;		
		PosEventTextBeginY = 2;
		PosCommandsBeginY = 18;
	
	procedure GotoXY(x, y: Integer);
	procedure GetXY(var x: Integer; var y: Integer);
	procedure LineChar(x, y: Integer; Length: Integer; ch: Char);
	
	procedure CanvasClear();
	procedure CanvasResetPos();
	procedure CanvasSetReadPos();
	
	procedure CanvasAddLayout();
	procedure CanvasAddStats();
	procedure CanvasAddEvent();
	procedure CanvasAddChooseCommand();
	procedure CanvasAddCommands();
	procedure CanvasAddLocation();
	
	procedure TestStats();
	procedure TestLocation();
	procedure TestTransLocation();
	procedure TestEvent();
	procedure TestCommand();
	
	procedure CanvasFlush();
	procedure CanvasForseFlush();
	
implementation
	procedure GotoXY(x, y: Integer);
	var
		pos: TCoord;
	begin
		pos.x := x;
		pos.y := y;
		SetConsoleCursorPosition(GetStdHandle(STD_OUTPUT_HANDLE), pos);
	end;
	
	procedure GetXY(var x: Integer; var y: Integer);
	var
		csbi: CONSOLE_SCREEN_BUFFER_INFO;
	begin
		GetConsoleScreenBufferInfo(GetStdHandle(STD_OUTPUT_HANDLE), csbi);
		x := csbi.dwCursorPosition.x;
		y := csbi.dwCursorPosition.y;
	end;
	
	procedure LineChar(x, y: Integer; length: Integer; ch: Char);
	var
		pos: TCoord;
		lUnused: LongWord;
	begin
		pos.x := x;
		pos.y := y;
		FillConsoleOutputAttribute(GetStdHandle(STD_OUTPUT_HANDLE), 0, length, pos, lUnused);
		FillConsoleOutputCharacter(GetStdHandle(STD_OUTPUT_HANDLE), ch, length, pos, lUnused);
	end;
	
	procedure CanvasClear();
	begin
		LineChar(0, 0, 2000, ' ');
		GotoXY(0, 0);
	end;
	
	procedure CanvasResetPos();
	begin
		GotoXY(0, 0);
	end;
	
	procedure CanvasSetReadPos();
	begin
		GotoXY(17, ConsoleHeight);
	end;
	
	procedure CanvasAddLayout();
	var
		I: Integer;
	begin
		GotoXY(PosStatsX, 0);
		ColorWrite('==ХАРАКТЕРИСТИКИ ПЕРСОНАЖА==',ColorDefault,1);
		
		for I := 0 to StatsHeight do
		begin
			GotoXY(PosStatsX - 1, I);
			ColorWrite('|',ColorDefault);
		end;
		
		for I := 0 to ConsoleWidth do
		begin
			GotoXY(I, 11);
			ColorWrite('=',ColorDefault);
			GotoXY(I, 17);
			ColorWrite('=',ColorDefault);
		end;
		
		for I := PosCommandsBeginY to ConsoleHeight do
		begin		
			GotoXY(PosStatsX - 1, I);
			ColorWrite('|',ColorDefault);
		end;
	end;
	procedure CanvasAddStats();
	begin
		
		GotoXY(51, 1);
		ColorWrite('Здоровье................', ColorAttribute);
		
		GotoXY(51, 2);
		ColorWrite('Бодрость................', ColorAttribute);
		
		GotoXY(51, 3);
		ColorWrite('Содержание алкоголя.....', ColorAttribute);
		
		GotoXY(51, 4);
		ColorWrite('Накуренность............', ColorAttribute);
		
		GotoXY(51, 5);
		ColorWrite('Сила....................',ColorAttribute);
		
		GotoXY(51, 6);
		ColorWrite('Интеллект...............',ColorAttribute);
		
		GotoXY(51, 7);
		ColorWrite('Удача...................',ColorAttribute);
		
		GotoXY(51, 8);
		ColorWrite('Счастье.................',ColorAttribute);
		
		GotoXY(51, 9);
		ColorWrite('Репутация в группе......',ColorAttribute);
		
		GotoXY(51, 10);
		ColorWrite('Репутация в универе.....',ColorAttribute);
		
		
	end;
	
	procedure CanvasAddEvent();
	begin
	
	end;
	
	procedure CanvasAddChooseCommand();
	begin
		GotoXY(0, ConsoleHeight);
		ColorWrite('Введите команду: ', ColorDefault);
	end;
	
	procedure CanvasAddCommands();
	begin
	
	end;
	
	procedure CanvasAddLocation();
	begin
		GotoXY(62, 19);
		ColorWrite('Локация', ColorTransLocation);
	end;
	
	procedure TestStats();
	var
		I: Integer;
	const
	    a: array [1..10] of Integer = (7, 3, 0, 0, 6, 5, 0, 5, 5, 6);
	begin
		for I := 1 to StatsHeight do
		begin
			GotoXY(PosStatX - 2, I);
			ColorWrite(a[I], ColorNumber);
			ColorWrite('0%', ColorNumber);
		end;
		GotoXY(PosStatX + 1, 2);
		ColorWrite('-10%', 'LightRed');
		GotoXY(PosStatX + 1, 6);
		ColorWrite('-20%', 'LightRed');
		GotoXY(PosStatX + 1, 8);
		ColorWrite('+10%', 'LightGreen');
	end;
	
	procedure TestLocation();
	begin
		GotoXY(62, 21);
		ColorWrite('Улица', ColorLocation);
	end;
	
	procedure TestTransLocation();
	begin
		GotoXY(1, PosTransitionBeginY);
		ColorWrite('--> ', ColorCommandText);
		ColorWrite('Переход на локацию "', ColorTransLocation);
		ColorWrite('Улица', ColorLocation);
		ColorWrite('" ', ColorTransLocation);
		ColorWrite('к событию "', ColorTransLocation);
		ColorWrite('Встреча с гопниками', ColorEventName);
		ColorWrite('" ', ColorTransLocation, 1);
	end;
	
	procedure TestEvent();
	begin
		GotoXY(0, 0);
		ColorWrite('Слышишь в свой адрес:', ColorEventText, 1);
		ColorWrite('Слышь пацанчик, а есть чёнить? А? А если найду?', ColorEventText, 1);
		ColorWrite('Опа-на! Чики-брики и в дамки!', ColorEventText, 1);
		ColorWrite('Чем меньше у человека зубов, тем лучше он', ColorEventText, 1);
		ColorWrite('фильтрует базар!', ColorEventText);
	end;
	
	procedure TestCommand();
	begin
		GotoXY(0, PosCommandsBeginY);
		ColorWrite('1', ColorNumber);
		ColorWrite(': ', ColorDefault);
		ColorWrite('Притвориться местным авторитетом', ColorCommandName, 1);
		ColorWrite('2', ColorNumber);
		ColorWrite(': ', ColorDefault);
		ColorWrite('Притвориться гопником', ColorCommandName, 1);
		ColorWrite('3', ColorNumber);
		ColorWrite(': ', ColorDefault);
		ColorWrite('Дать отпор гопникам', ColorCommandName, 1);
	end;
	
	procedure CanvasFlush();
	var
		I: Integer;
	begin
		for I := 0 to StatsHeight do
			LineChar(0, I, 50, ' ');
		
		for I := PosCommandsBeginY to ConsoleHeight - 1 do
			LineChar(0, I, 50, ' ');
			
		for I := PosStatBeginY to StatsHeight do			
			LineChar(PosStatX + 3, I, 5, ' ');
		
		LineChar(17, ConsoleHeight, 4, ' ');
				
		for I := 0 to 3 do
			LineChar(0, PosTransitionBeginY + I, ConsoleWidth, ' ');
	end;
	
	procedure CanvasForseFlush(); // Erase full screen except event's text
	var
		I: Integer;
		pos: TCoord;
	begin
		GetXY(pos.x, pos.y);
		
		LineChar(0, ConsoleHeight, 50, ' ');
			
		for I := PosStatBeginY to StatsHeight do			
			LineChar(PosStatX + 3, I, 5, ' ');
		
		LineChar(17, ConsoleHeight, 4, ' ');
				
		for I := 0 to 3 do
			LineChar(0, PosTransitionBeginY + I, ConsoleWidth, ' ');
			
		GotoXY(PosStatsX, 0);
		LineChar(PosStatsX, 0, 29, ' ');
		
		for I := 0 to StatsHeight do
		begin
			GotoXY(PosStatsX - 1, I);
			ColorWrite(' ',ColorDefault);
		end;
		
		for I := 0 to ConsoleWidth do
		begin
			GotoXY(I, 11);
			ColorWrite(' ',ColorDefault);
			GotoXY(I, 17);
			ColorWrite(' ',ColorDefault);
		end;
		
		for I := PosCommandsBeginY to ConsoleHeight do
		begin		
			GotoXY(PosStatsX - 1, I);
			ColorWrite(' ',ColorDefault);
		end;
		
		LineChar(52, 19, 20, ' ');
		LineChar(52, 21, 20, ' ');
		
		for I := 1 to 10 do
			LineChar(51, I, 28, ' ');
			
		GotoXY(pos.x, pos.y);
	end;
	
	
end.