unit StoryParser;
	
interface
	uses
		SysUtils, Types;
	function ReadToken(var text: TextFile; var token: String): Boolean;
	function LoadStory(filename: String; var events: TEvents): Boolean;

implementation
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
			
			if ch = '''' then
			begin
				isStarted:= True;
				while not EOF(text) do
				begin
					Read(text, ch);
					if (not (ch = '''')) then
						token := token + ch
					else
						break;
				end;
			end;
		end;
		WriteLn('Token: ', token);
		ReadToken := not EOF(text);
	end;
	
	function LoadStory(filename: String; var events: TEvents): Boolean;
	var
		text: TextFile;
		s: String;
		AmountOfEvents: Integer;
		AmountOfCommands: Integer;
		EventCount: Integer;
		CommandCount: Integer;
		
	begin
		Assign(text, filename);
		Reset(text);
		EventCount := 0;
		CommandCount := 0;
		while ReadToken(text, s) do
		begin
			if (s = 'events') then
			begin
				ReadToken(text, s);
				AmountOfEvents := StrToInt(s);
				SetLength(events, AmountOfEvents);
				continue;
			end;
			
			if (s = 'event') then
			begin
				ReadToken(text, s);
				events[EventCount].name := s;
				continue;
			end;
			
			if (s = 'text') then
			begin
				ReadToken(text, s);
				events[EventCount].text := s;
				continue;
			end;
			
			if (s = 'commands') then
			begin
				ReadToken(text, s);
				AmountOfCommands := StrToInt(s);
				SetLength(events[EventCount].commands, AmountOfCommands);
				continue;
			end;
			
			if (s = 'command') then
			begin
				ReadToken(text, s);
				events[EventCount].commands[CommandCount].name := s;
				continue;
			end;
			
			if (s = 'text') then
			begin
				ReadToken(text, s);
				events[EventCount].commands[CommandCount].text := s;
				continue;
			end;
			
			if (s = 'cmd') then
			begin
				ReadToken(text, s);
				events[EventCount].commands[CommandCount].cmd := s;
				continue;
			end;
			
			if (s = 'toEvent') then
			begin
				ReadToken(text, s);
				events[EventCount].commands[CommandCount].toEvent := s;
				continue;
			end;
			
			if (s = 'end') then
			begin
				ReadToken(text, s);
				if (s = 'command') then
					CommandCount := CommandCount + 1;
				if (s = 'commands') then
					CommandCount := 0;
				if (s = 'event') then
					EventCount := EventCount + 1;
				if (s = 'events') then
					break;
			end;	
		end;
		Close(text);
	end;
end.