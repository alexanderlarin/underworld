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
		TokenTransition = 'transition';
		TokenTransitions = 'transitions';
		TokenCondition = 'condition';
		TokenConditions = 'conditions';
		TokenAttribute = 'attribute';
	
	function ReadToken(var text: TextFile; var token: String): Boolean;
	function ReadEvent(var text: TextFile; var event: TEvent): Boolean;
	function ReadEvents(var text: TextFile; var events: TEvents): Boolean;
	function ReadCommand(var text: TextFile; var command: TCommand): Boolean;
	function ReadCommands(var text: TextFile; var commands: TCommands): Boolean;
	function ReadTransition(var text: TextFile; var transition: TTransition): Boolean;
	function ReadTransitions(var text: TextFile; var transitions: TTransitions): Boolean;
	function ReadCondition(var text: TextFile; var condition: TCondition): Boolean;
	function ReadConditions(var text: TextFile; var conditions: TConditions): Boolean;
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
	
	function ReadCondition(var text: TextFile; var condition: TCondition): Boolean;
	var
		token: String;
	begin
		token := '';
		if not ReadToken(text, condition.name) then
			Exit(False);
		while ReadToken(text, token) do
		begin
			if token = TokenAttribute then
				ReadToken(text, condition.attribute);
			if token = TokenValue then
			begin
				ReadToken(text, token);
				condition.value := StrToInt(token);
			end;
				
			if token = TokenEnd then
			begin
				ReadToken(text, token);
				if token = TokenCommand then
					Exit(True);
			end
		end;
		Exit(False);
	end;
	
	function ReadConditions(var text: TextFile; var conditions: TConditions): Boolean;
	var
		token: String;
		conditionsCount, I: Integer;
	begin
		ReadToken(text, token);
		conditionsCount := StrToInt(token);
		for I:= 0 to conditionsCount - 1 do
		begin
			if (ReadToken(text, token)) then
			begin
				if (token = TokenCondition) then
				begin
					ReadCondition(text, conditions[I]);
				end;
			end;
		end;
		ReadToken(text, token);
		if token = TokenEnd then
		begin
			ReadToken(text, token);			
		end;
	end;
	
	function ReadTransition(var text: TextFile; var transition: TTransition): Boolean;
	var
		token: String;
	begin
		token := '';
		if not ReadToken(text, transition.name) then
			Exit(False);
		while ReadToken(text, token) do
		begin
			if token = TokenConditions then
				ReadConditions(text, transition.conditions);
			if token = TokenEffects then
				ReadEffects(text, transition.effects);
			if token = TokenToEvent then
				ReadToken(text, transition.toEvent);
			if token = TokenEnd then
			begin
				ReadToken(text, token);
				if token = TokenCommand then
					Exit(True);
			end
		end;
		Exit(False);
	end;
	
	function ReadTransitions(var text: TextFile; var transitions: TTransitions): Boolean;
	var
		token: String;
		transitionsCount, I: Integer;
	begin
		ReadToken(text, token);
		transitionsCount := StrToInt(token);
		for I:= 0 to transitionsCount - 1 do
		begin
			if (ReadToken(text, token)) then
			begin
				if (token = TokenTransition) then
				begin
					ReadTransition(text, transitions[I]);
				end;
			end;
		end;
		ReadToken(text, token);
		if token = TokenEnd then
		begin
			ReadToken(text, token);			
		end;
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
			if token = TokenTransitions then
				ReadTransitions(text, command.transitions);
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