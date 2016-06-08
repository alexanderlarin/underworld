unit OutputColor;

interface
	uses
		{$IFDEF WINDOWS}
		windows;
		{$ENDIF}
	
	const
		ColorDefault = 'LightGray';
		ColorDebug = 'White';
		ColorFinish = 'Cyan';
		ColorEventName = 'Green';
		ColorEventText = 'Cyan';
		ColorCommandName = 'White';
		ColorCommandText = 'LightGreen';
		ColorAttribute = 'Yellow';
		ColorNumber = 'LightCyan';
		ColorTransLocation = 'White';
		ColorLocation = 'LightMagenta';
	
	procedure TextColor(color: Integer);
	procedure ColorWrite(normalText: String);	
	procedure ColorWrite(normalText: String; chosenColor: String);
	procedure ColorWrite(normalText: String; chosenColor: String; newLine: Integer);
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
	
	procedure ColorWrite(normalText: String; chosenColor: String; newLine: Integer);
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