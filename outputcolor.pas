unit OutputColor;

interface
	uses
	{$IFDEF WINDOWS}
		windows;
	{$ELSE}
		setlocale,
		ncrt;
	{$ENDIF}
	
	const
		ColorDefault = 'LightGray';
		ColorDebug = 'White';
		ColorError = 'LightRed';
		ColorFinish = 'Cyan';
		ColorEventName = 'Green';
		ColorEventText = 'Cyan';
		ColorCommandName = 'White';
		ColorCommandText = 'LightGreen';
		ColorTransitionText = 'White';
		ColorConditionText = 'White';
		ColorAttribute = 'Yellow';
		ColorNumber = 'LightCyan';
		ColorTransLocation = 'White';
		ColorLocation = 'LightMagenta';
		ColorPositiveChanging = 'LightGreen';
		ColorNegativeChanging = 'LightRed';
		ColorLocationChanging = 'LightGreen';
	
	procedure TextColor(color: Integer);
	procedure SetBackColor(backColor: Integer);
	procedure ColorWrite(normalText: String);	
	procedure ColorWrite(normalText: String; chosenColor: String);
	function ColorWrite(normalText: String; chosenColor: String; newLine: Integer): Integer;
	function ColorWrite(normalText: String; chosenColor: String; newLine: Integer; lineSize: Integer): Integer;
	function ColorWrite(normalText: String; chosenColor: String; backColor: Integer; newLine: Integer; lineSize: Integer): Integer;
	procedure ColorWrite(normalText: Integer; chosenColor: String);
	procedure ColorWrite(normalText: Integer; chosenColor: String; newLine: Integer);
	procedure ColorWrite(normalText: Real; chosenColor: String);
	procedure ColorWrite(normalText: Real; chosenColor: String; newLine: Integer);
	
implementation	
	procedure MyWriteLn(s : String);
	begin
	{$IFDEF WINDOWS}
		WriteLn(s);
	{$ELSE}
		Write(s);
		GotoXY(1, WhereY()+1);
	{$ENDIF}
	end;
	
	procedure MyWriteLn();
	begin
	{$IFDEF WINDOWS}
		WriteLn();
	{$ELSE}
		GotoXY(1, WhereY()+1);
	{$ENDIF}
	end;

	procedure TextColor(color: Integer);
	begin
		{$IFDEF WINDOWS}
		SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), color);
		{$ELSE}
		ncrt.TextColor(color);
		{$ENDIF}
	end;
	
	procedure SetBackColor(backColor: Integer);
	begin
		{$IFDEF WINDOWS}
		SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), BACKGROUND_RED or BACKGROUND_GREEN or BACKGROUND_INTENSITY);
		{$ELSE}
		
		{$ENDIF}
	end;
	
	procedure ColorWrite(normalText: String);	
	begin
		TextColor(7);
		MyWriteLn(normalText);
	end;
	
	procedure ColorWrite(normalText: String; chosenColor: String);
	begin
		case chosenColor of 
			'Black': TextColor(0);
			'Blue': TextColor(1);
			'Green': TextColor(2);
			'Cyan': TextColor(3);
			'Red': TextColor(4);
			'Magenta': TextColor(5);
			'Brown': TextColor(6);
			'LightGray': TextColor(7);
			'DarkGray': TextColor(8);
			'LightBlue': TextColor(9);
			'LightGreen': TextColor(10);
			'LightCyan': TextColor(11);
			'LightRed': TextColor(12);
			'LightMagenta': TextColor(13);
			'Yellow': TextColor(14);
			'White': TextColor(15);
			'Blink': TextColor(128);
			else 
				TextColor(15);
		end;
		Write(normalText);
		TextColor(15);
	end;
	
	function PrintLargeText(normalText: String; lineSize: Integer): Integer;
	var
		I: Integer;
	begin
		if Length(UTF8Decode(normalText)) <= lineSize then
		begin
			Write(normalText);
			Exit(1);
		end
		else
		begin
			I := lineSize;
			while UTF8Decode(normalText)[I] <> ' ' do
				I := I - 1;

			MyWriteln(String(UTF8Encode(Copy(UTF8Decode(normalText), 0, I))));
			Exit(PrintLargeText(UTF8Encode(Copy(UTF8Decode(normalText), I + 1, Length(UTF8Decode(normalText)) - I)), lineSize) + 1);
			
		end;
	end;
	
	function ColorWrite(normalText: String; chosenColor: String; newLine: Integer): Integer;
	var newLineCounter: Integer;
	begin
		case chosenColor of 
			'Black': TextColor(0);
			'Blue': TextColor(1);
			'Green': TextColor(2);
			'Cyan': TextColor(3);
			'Red': TextColor(4);
			'Magenta': TextColor(5);
			'Brown': TextColor(6);
			'LightGray': TextColor(7);
			'DarkGray': TextColor(8);
			'LightBlue': TextColor(9);
			'LightGreen': TextColor(10);
			'LightCyan': TextColor(11);
			'LightRed': TextColor(12);
			'LightMagenta': TextColor(13);
			'Yellow': TextColor(14);
			'White': TextColor(15);
			'Blink': TextColor(128);
			else 
				TextColor(15);
		end;
				
		ColorWrite := PrintLargeText(normalText, 50);
		TextColor(15);
		for newLineCounter := 1 to newLine do 
		begin
			MyWriteLn();
		end;
	end;
	
	function ColorWrite(normalText: String; chosenColor: String; newLine: Integer; lineSize: Integer): Integer;
	var newLineCounter: Integer;
	begin
		case chosenColor of 
			'Black': TextColor(0);
			'Blue': TextColor(1);
			'Green': TextColor(2);
			'Cyan': TextColor(3);
			'Red': TextColor(4);
			'Magenta': TextColor(5);
			'Brown': TextColor(6);
			'LightGray': TextColor(7);
			'DarkGray': TextColor(8);
			'LightBlue': TextColor(9);
			'LightGreen': TextColor(10);
			'LightCyan': TextColor(11);
			'LightRed': TextColor(12);
			'LightMagenta': TextColor(13);
			'Yellow': TextColor(14);
			'White': TextColor(15);
			'Blink': TextColor(128);
			else 
				TextColor(15);
		end;
				
		ColorWrite := PrintLargeText(normalText, lineSize);
		TextColor(15);
		for newLineCounter := 1 to newLine do 
		begin
			MyWriteLn();
		end;
	end;
	
	function ColorWrite(normalText: String; chosenColor: String; backColor: Integer; newLine: Integer; lineSize: Integer): Integer;
	var newLineCounter: Integer;
	begin
		case chosenColor of 
			'Black': TextColor(0);
			'Blue': TextColor(1);
			'Green': TextColor(2);
			'Cyan': TextColor(3);
			'Red': TextColor(4);
			'Magenta': TextColor(5);
			'Brown': TextColor(6);
			'LightGray': TextColor(7);
			'DarkGray': TextColor(8);
			'LightBlue': TextColor(9);
			'LightGreen': TextColor(10);
			'LightCyan': TextColor(11);
			'LightRed': TextColor(12);
			'LightMagenta': TextColor(13);
			'Yellow': TextColor(14);
			'White': TextColor(15);
			'Blink': TextColor(128);
			else 
				TextColor(15);
		end;
		
		SetBackColor(backColor);
		ColorWrite := PrintLargeText(normalText, lineSize);
		TextColor(15);
		for newLineCounter := 1 to newLine do 
		begin
			MyWriteLn();
		end;
	end;
	
	procedure ColorWrite(normalText: Integer; chosenColor: String);
	begin
		case chosenColor of 
			'Black': TextColor(0);
			'Blue': TextColor(1);
			'Green': TextColor(2);
			'Cyan': TextColor(3);
			'Red': TextColor(4);
			'Magenta': TextColor(5);
			'Brown': TextColor(6);
			'LightGray': TextColor(7);
			'DarkGray': TextColor(8);
			'LightBlue': TextColor(9);
			'LightGreen': TextColor(10);
			'LightCyan': TextColor(11);
			'LightRed': TextColor(12);
			'LightMagenta': TextColor(13);
			'Yellow': TextColor(14);
			'White': TextColor(15);
			'Blink': TextColor(128);
			else 
				TextColor(15);
		end;
		Write(normalText);
		TextColor(15);
	end;
	
	procedure ColorWrite(normalText: Integer; chosenColor: String; newLine: Integer);
	var newLineCounter: Integer;
	begin
		case chosenColor of 
			'Black': TextColor(0);
			'Blue': TextColor(1);
			'Green': TextColor(2);
			'Cyan': TextColor(3);
			'Red': TextColor(4);
			'Magenta': TextColor(5);
			'Brown': TextColor(6);
			'LightGray': TextColor(7);
			'DarkGray': TextColor(8);
			'LightBlue': TextColor(9);
			'LightGreen': TextColor(10);
			'LightCyan': TextColor(11);
			'LightRed': TextColor(12);
			'LightMagenta': TextColor(13);
			'Yellow': TextColor(14);
			'White': TextColor(15);
			'Blink': TextColor(128);
			else 
				TextColor(15);
		end;
		Write(normalText);
		TextColor(15);
		for newLineCounter := 1 to newLine do 
		begin
			MyWriteLn();
		end;
	end;
	
	procedure ColorWrite(normalText: Real; chosenColor: String);
	begin
		case chosenColor of 
			'Black': TextColor(0);
			'Blue': TextColor(1);
			'Green': TextColor(2);
			'Cyan': TextColor(3);
			'Red': TextColor(4);
			'Magenta': TextColor(5);
			'Brown': TextColor(6);
			'LightGray': TextColor(7);
			'DarkGray': TextColor(8);
			'LightBlue': TextColor(9);
			'LightGreen': TextColor(10);
			'LightCyan': TextColor(11);
			'LightRed': TextColor(12);
			'LightMagenta': TextColor(13);
			'Yellow': TextColor(14);
			'White': TextColor(15);
			'Blink': TextColor(128);
			else 
				TextColor(15);
		end;
		Write(normalText);
		TextColor(15);
	end;
	
	procedure ColorWrite(normalText: Real; chosenColor: String; newLine: Integer);
	var newLineCounter: Integer;
	begin
		case chosenColor of 
			'Black': TextColor(0);
			'Blue': TextColor(1);
			'Green': TextColor(2);
			'Cyan': TextColor(3);
			'Red': TextColor(4);
			'Magenta': TextColor(5);
			'Brown': TextColor(6);
			'LightGray': TextColor(7);
			'DarkGray': TextColor(8);
			'LightBlue': TextColor(9);
			'LightGreen': TextColor(10);
			'LightCyan': TextColor(11);
			'LightRed': TextColor(12);
			'LightMagenta': TextColor(13);
			'Yellow': TextColor(14);
			'White': TextColor(15);
			'Blink': TextColor(128);
			else 
				TextColor(15);
		end;
		Write(normalText);
		TextColor(15);
		for newLineCounter := 1 to newLine do 
		begin
			MyWriteLn();
		end;
	end;
end.