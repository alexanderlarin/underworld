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
	procedure ColorWrite(normaltext: String);	
	procedure ColorWrite(normaltext: String; chosencolor: String);
	procedure ColorWrite(normaltext: String; chosencolor: String; newline: Integer);
	procedure ColorWrite(normaltext: Integer; chosencolor: String);
	procedure ColorWrite(normaltext: Integer; chosencolor: String; newline: Integer);
	procedure ColorWrite(normaltext: Real; chosencolor: String);
	procedure ColorWrite(normaltext: Real; chosencolor: String; newline: Integer);
	
implementation	
	procedure TextColor(color: Integer);
	begin
		SetConsoleTextAttribute(GetStdHandle(STD_OUTPUT_HANDLE), color);
	end;
	
	procedure ColorWrite(normaltext: String);	
	begin
		TextColor(7);
		WriteLn(normaltext);
	end;
	
	procedure ColorWrite(normaltext: String; chosencolor: String);
	begin
		case chosencolor of 
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
		Write(normaltext);
		TextColor(15);
	end;
	
	procedure ColorWrite(normaltext: String; chosencolor: String; newline: Integer);
	var newlinecounter: Integer;
	begin
		case chosencolor of 
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
		Write(normaltext);
		TextColor(15);
		for newlinecounter := 1 to newline do 
		begin
			WriteLn();
		end;
	end;
	
	procedure ColorWrite(normaltext: Integer; chosencolor: String);
	begin
		case chosencolor of 
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
		Write(normaltext);
		TextColor(15);
	end;
	
	procedure ColorWrite(normaltext: Integer; chosencolor: String; newline: Integer);
	var newlinecounter: Integer;
	begin
		case chosencolor of 
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
		Write(normaltext);
		TextColor(15);
		for newlinecounter := 1 to newline do 
		begin
			WriteLn();
		end;
	end;
	
	procedure ColorWrite(normaltext: Real; chosencolor: String);
	begin
		case chosencolor of 
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
		Write(normaltext);
		TextColor(15);
	end;
	
	procedure ColorWrite(normaltext: Real; chosencolor: String; newline: Integer);
	var newlinecounter: Integer;
	begin
		case chosencolor of 
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
		Write(normaltext);
		TextColor(15);
		for newlinecounter := 1 to newline do 
		begin
			WriteLn();
		end;
	end;
end.