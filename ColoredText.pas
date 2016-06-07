unit ColoredText;

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
	procedure MsgColor(NormalText: String);	
	procedure MsgColor(NormalText: String; ChosenColor: String);
	procedure MsgColor(NormalText: String; ChosenColor: String; NewLine: Integer);
	procedure MsgColor(NormalText: Integer; ChosenColor: String);
	procedure MsgColor(NormalText: Integer; ChosenColor: String; NewLine: Integer);
	procedure MsgColor(NormalText: Real; ChosenColor: String);
	procedure MsgColor(NormalText: Real; ChosenColor: String; NewLine: Integer);
	
implementation	
	procedure TextColor(color: Integer);
	begin
		SetConsoleTextAttribute(GetStdHandle( STD_OUTPUT_HANDLE), color);
	end;
	
	procedure MsgColor(NormalText: String);	
	begin
		TextColor(7);
		WriteLn(NormalText);
	end;
	
	procedure MsgColor(NormalText: String; ChosenColor: String);
	begin
		case ChosenColor of 
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
		Write(NormalText);
		TextColor(15);
	end;
	
	procedure MsgColor(NormalText: String; ChosenColor: String; NewLine: Integer);
	var NewLineCounter:integer;
	begin
		case ChosenColor of 
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
		Write(NormalText);
		TextColor(15);
		for NewLineCounter := 1 to NewLine do 
		begin
			WriteLn();
		end;
	end;
	
	procedure MsgColor(NormalText: Integer; ChosenColor: String);
	begin
		case ChosenColor of 
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
		Write(NormalText);
		TextColor(15);
	end;
	
	procedure MsgColor(NormalText: Integer; ChosenColor: String; NewLine: Integer);
	var NewLineCounter:integer;
	begin
		case ChosenColor of 
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
		Write(NormalText);
		TextColor(15);
		for NewLineCounter := 1 to NewLine do 
		begin
			WriteLn();
		end;
	end;
	
	procedure MsgColor(NormalText: Real; ChosenColor: String);
	begin
		case ChosenColor of 
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
		Write(NormalText);
		TextColor(15);
	end;
	
	procedure MsgColor(NormalText: Real; ChosenColor: String; NewLine: Integer);
	var NewLineCounter:integer;
	begin
		case ChosenColor of 
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
		Write(NormalText);
		TextColor(15);
		for NewLineCounter := 1 to NewLine do 
		begin
			WriteLn();
		end;
	end;
end.