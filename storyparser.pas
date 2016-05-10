unit StoryParser;
	
interface
	uses
		SysUtils, Types;
	function ReadToken(var text: TextFile; var token: String): Boolean;
	function ReadEvent(var text: TextFile; var event: TEvent): Boolean;
	function ReadEvents(var text: TextFile; var events: TEvents): Boolean;
	function ReadCommand(var text: TextFile; var command: TCommand): Boolean;
	function ReadCommands(var text: TextFile; var commands: TCommands): Boolean;
	function LoadStory(filename: String; var events: TEvents): Boolean;

implementation
	function ReadCommand(var text: TextFile; var command: TCommand): Boolean;
	var
		token: String;
	begin
	begin
		token := '';
		if not ReadToken(text, command.name) then
			Exit(False);
		while ReadToken(text, token) do
		begin
			if token = 'text' then
				ReadToken(text, event.text);
			if token = 'cmd' then
				ReadToken(text, event.cmd);
			if token = 'toEvent' then
				ReadToken(text, event.toEvent);
			if token = 'end' then
			begin
				ReadToken(text, token);
				if token = 'command' then
					Exit(True);
			end
		end;
	end;
	
	function ReadCommands(var text: TextFile; var commands: TCommands): Boolean;
	begin
		ReadToken(text, StrToInt(CommandCount));
		for i:= 0 to CommandCount - 1 do
			ReadCommand(text, event.commands[CommandCount]);
	end;
	
	function ReadEvent(var text: TextFile; var event: TEvent): Boolean;
	var
		token: String;
		CommandCount: Integer;
	begin
		token := '';
		if ReadToken(text, event.name) then
		begin
			ReadToken(text, token);
			if token = 'text' then
				ReadToken(text, event.text);
			if token = 'commands' then
			begin
				ReadCommands(text, event.commands);
				
			end;
			if token = 'cmd' then
				ReadToken(text, event.t);
			if token = 'text' then
				ReadToken(text, event.text);
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
		end;
	end;
	
	function ReadToken(var text: TextFile; var token: String): Boolean;
	var
		isStarted, isSpecial: Boolean;
		ch: Char;
	begin
		isStarted := False;
		token := '';
		while not EOF(text) do
		begin
			Read(text, ch);
			if ch in ['A'..'Z', 'a'..'z', '0'..'9', ''''] then
			begin
				if ch = '''' then
				begin
					isSpecial := True;
					if not isStarted then
						isStarted := True
					else
						break;
				end
				else
					isStarted := True;
			end
			else
			begin
				if not isSpecial then
					break;
			end;
			
			if isStarted then
				token := token + ch;		
		end;
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