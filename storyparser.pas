unit StoryParser;
	
interface
	uses
		SysUtils, Types;
	const
		TokenEnd = 'end'; 
		TokenText = 'text';
		TokenCmd = 'cmd';
		TokenToEvent = 'toEvent';
		TokenEffect = 'effect';
		TokenEffects = 'effects';
		TokenValue = 'value';
		TokenCommand = 'command';
		TokenCommands = 'commands';
		TokenEvent = 'event';
		TokenEvents = 'events';
	
	function ReadToken(var text: TextFile; var token: String): Boolean;
	function ReadEvent(var text: TextFile; var event: TEvent): Boolean;
	function ReadEvents(var text: TextFile; var events: TEvents): Boolean;
	function ReadCommand(var text: TextFile; var command: TCommand): Boolean;
	function ReadCommands(var text: TextFile; var commands: TCommands): Boolean;
	function ReadEffect(var text: TextFile; var effect: TEffect): Boolean;
	function ReadEffects(var text: TextFile; var effects: TEffects): Boolean;
	function LoadStory(filename: String; var events: TEvents): Boolean;

implementation
	function ReadEffect(var text: TextFile; var effect: TEffect): Boolean;
	var
		token: String;
	begin
		token := '';
		if not ReadToken(text, effect.name) then
			Exit(False);
		while ReadToken(text, token) do
		begin
			if token = TokenText then
				ReadToken(text, effect.text);
			if token = TokenValue then
			begin
				ReadToken(text, token);
				effect.value := StrToInt(token);
			end;
			if token = TokenEnd then
			begin
				ReadToken(text, token);
				if token = TokenEffect then
					Exit(True);
			end;
		end;
		Exit(False);
	end;
	
	function ReadEffects(var text: TextFile; var effects: TEffects): Boolean;
	var
		token: String;
		effectsCount, I: Integer;
	begin
		ReadToken(text, token);
		effectsCount := StrToInt(token);
		for I:= 0 to effectsCount - 1 do
		begin
			if ReadToken(text, token) then
			begin
				if (token = TokenEffect) then
					ReadEffect(text, effects[I]);
			end;
		end;
		ReadToken(text, token);
		if token = TokenEnd then
		begin
			ReadToken(text, token);
			if token = TokenEffect then
				Exit(True);			
		end;
		Exit(False);
	end;
	
	function ReadCommand(var text: TextFile; var command: TCommand): Boolean;
	var
		token: String;
	begin
		token := '';
		if not ReadToken(text, command.name) then
			Exit(False);
		while ReadToken(text, token) do
		begin
			if token = TokenText then
				ReadToken(text, command.text);
			if token = TokenCmd then
				ReadToken(text, command.cmd);
			if token = TokenToEvent then
				ReadToken(text, command.toEvent);
			if token = TokenEffects then
				ReadEffects(text, command.effects);
			if token = TokenEnd then
			begin
				ReadToken(text, token);
				if token = TokenCommand then
					Exit(True);
			end
		end;
		Exit(False);
	end;
	
	function ReadCommands(var text: TextFile; var commands: TCommands): Boolean;
	var
		token: String;
		commandsCount, I: Integer;
	begin
		ReadToken(text, token);
		commandsCount := StrToInt(token);
		for I:= 0 to commandsCount - 1 do
		begin
			if (ReadToken(text, token)) then
			begin
				if (token = TokenCommand) then
				begin
					ReadCommand(text, commands[I]);
				end;
			end;
		end;
		ReadToken(text, token);
		if token = TokenEnd then
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
			if token = TokenText then
				ReadToken(text, event.text);
			if token = TokenCommands then
			begin
				ReadCommands(text, event.commands);
			end;
			ReadToken(text, token);
			if token = TokenEnd then
				ReadToken(text, token);			
		end;
	end;
	
	function ReadEvents(var text: TextFile; var events: TEvents): Boolean;
	var
		token: String;
		eventsCount, I: Integer;
	begin
		ReadToken(text, token);
		eventsCount := StrToInt(token);
		for I := 0 to eventsCount - 1 do
		begin
			ReadToken(text, token);
			if (token = TokenEvent) then
			begin
				ReadEvent(text, events[I]);
			end;
		end;
		ReadToken(text, token);
		if token = TokenEnd then
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
		if token = TokenEvents then
			ReadEvents(text, events);
		Close(text);
	end;
end.