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
		token := '';
		if not ReadToken(text, command.name) then
			Exit(False);
		while ReadToken(text, token) do
		begin
			if token = 'text' then
				ReadToken(text, command.text);
			if token = 'cmd' then
				ReadToken(text, command.cmd);
			if token = 'toEvent' then
				ReadToken(text, command.toEvent);
			if token = 'end' then
			begin
				ReadToken(text, token);
				if token = 'command' then
					Exit(True);
			end
		end;
	end;
	
	function ReadCommands(var text: TextFile; var commands: TCommands): Boolean;
	var
		token: String;
		CommandsCount, i: Integer;
	begin
		ReadToken(text, token);
		CommandsCount := StrToInt(token);
		for i:= 0 to CommandsCount - 1 do
		begin
			if (ReadToken(text, token)) then
			begin
				if (token = 'command') then
				begin
					ReadCommand(text, commands[i]);
				end;
			end;
		end;
		ReadToken(text, token);
		if token = 'end' then
		begin
			ReadToken(text, token);			
		end;
	end;
	
	function ReadEvent(var text: TextFile; var event: TEvent): Boolean;
	var
		token: String;		
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
			ReadToken(text, token);
			if token = 'end' then
				ReadToken(text, token);			
		end;
	end;
	
	function ReadEvents(var text: TextFile; var events: TEvents): Boolean;
	var
		token: String;
		EventsCount, i: Integer;
	begin
		ReadToken(text, token);
		EventsCount := StrToInt(token);
		For i := 0 to EventsCount - 1 do
		begin
			ReadToken(text, token);
			if (token = 'event') then
			begin
				ReadEvent(text, events[i]);
			end;
		end;
		ReadToken(text, token);
		if token = 'end' then
		begin
			ReadToken(text, token);
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
		token: String;
		
	begin
		Assign(text, filename);
		Reset(text);
		ReadToken(text, token);
		if token = 'events' then
			ReadEvents(text, events);
		Close(text);
	end;
end.