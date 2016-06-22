unit OutputColor;

interface
	uses
		{$IFDEF WINDOWS}
		windows;
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
	procedure ColorWrite(normalText: String);	
	procedure ColorWrite(normalText: String; chosenColor: String);
	function ColorWrite(normalText: String; chosenColor: String; newLine: Integer): Integer;
	function ColorWrite(normalText: String; chosenColor: String; newLine: Integer; lineSize: Integer): Integer;
	procedure ColorWrite(normalText: Integer; chosenColor: String);
	procedure ColorWrite(normalText: Integer; chosenColor: String; newLine: Integer);
	procedure ColorWrite(normalText: Real; chosenColor: String);
	procedure ColorWrite(normalText: Real; chosenColor: String; newLine: Integer);
	
implementation	
	procedure TextColor(color: Integer);
	begin
		{$IFDEF WINDOWS}
		SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), color);
		{$ENDIF}
	end;
	
	procedure ColorWrite(normalText: String);	
	begin
		TextColor(7);
		WriteLn(normalText);
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
			'Blinck': TextColor(128);
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
			Write(UTF8Decode(normalText));
			Exit(1);
		end
		else
		begin
			I := lineSize;
			while UTF8Decode(normalText)[I] <> ' ' do
				I := I - 1;
				
			Writeln(Copy(UTF8Decode(normalText), 1, I));
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
			'Blinck': TextColor(128);
			else 
				TextColor(15);
		end;
				
		ColorWrite := PrintLargeText(normalText, 50);
		TextColor(15);
		for newLineCounter := 1 to newLine do 
		begin
			WriteLn();
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
			WriteLn();
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
			'Blinck': TextColor(128);
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
			'Blinck': TextColor(128);
			else 
				TextColor(15);
		end;
		Write(normalText);
		TextColor(15);
		for newLineCounter := 1 to newLine do 
		begin
			WriteLn();
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
			'Blinck': TextColor(128);
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
			'Blinck': TextColor(128);
			else 
				TextColor(15);
		end;
		Write(normalText);
		TextColor(15);
		for newLineCounter := 1 to newLine do 
		begin
			WriteLn();
		end;
	end;
end.