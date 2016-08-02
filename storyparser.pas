unit StoryParser;
	
interface
	uses
		SysUtils, Types, outputcolor;
	const
		TokenEnd = 'end'; 
		TokenText = 'text';
		TokenTexts = 'texts';
		TokenCmd = 'cmd';
		TokenToLocation = 'toLocation';
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
		TokenLocation = 'location';
		TokenLocations = 'locations';
		TokenStory = 'story';
		TokenStories = 'stories';
		
	function ReadToken(var text: TextFile; var token: String): Boolean;
	function ReadToken(var text: TextFile; var token: TColorString): Boolean;
	function ReadTexts(var text: TextFile; var texts: TMultiLineColorText; defaultColor: String): Boolean;
	function ReadLocation(var text: TextFile; var location: TLocation): Boolean;
	function ReadLocations(var text: TextFile; var locations: TLocations): Boolean;
	function ReadStory(var text: TextFile; var story: TStory): Boolean;
	function ReadStories(var text: TextFile; var stories: TStories): Boolean;
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
	function LoadStory(fileName: String; var locations: TLocations): Boolean;
	function LoadStories(fileName: String; var locations: TLocations; var currentPosition: TPosition): Boolean;

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
		SetLength(effects, effectsCount);
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
			if token = TokenText then
			begin
				condition.isMultiLine := false;
				ReadToken(text, condition.text);
				if (condition.text.color = '') then
					condition.text.color := ColorConditionText;
			end;
			if token = TokenTexts then
			begin
				condition.isMultiLine := true;
				ReadTexts(text, condition.texts, ColorConditionText);
			end;
			if token = TokenEnd then
			begin
				ReadToken(text, token);
				if token = TokenCondition then
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
		SetLength(conditions, conditionsCount);
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
		Exit(True);
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
			if token = TokenText then
			begin				
				transition.isMultiLine := false;
				ReadToken(text, transition.text);
				if (transition.text.color = '') then
					transition.text.color := ColorTransitionText;
			end;
			if token = TokenTexts then
			begin
				transition.isMultiLine := true;
				ReadTexts(text, transition.texts, ColorTransitionText);
			end;
			if token = TokenEffects then
				ReadEffects(text, transition.effects);
			if token = TokenToLocation then
			begin
				ReadToken(text, transition.toLocation);
			end;
			if token = TokenToEvent then
			begin
				ReadToken(text, transition.toEvent);
			end;
			if token = TokenEnd then
			begin
				ReadToken(text, token);
				if token = TokenTransition then
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
		SetLength(transitions, transitionsCount);
		for I:= 0 to transitionsCount - 1 do
		begin
			if (ReadToken(text, token)) then
				if (token = TokenTransition) then
					ReadTransition(text, transitions[I]);
		end;
		ReadToken(text, token);
		if token = TokenEnd then
			ReadToken(text, token);	
		Exit(True);
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
			begin
				command.isMultiLine := false;
				ReadToken(text, command.text);
				if command.text.color = '' then
					command.text.color := ColorCommandText;
			end;
			if token = TokenTexts then
			begin
				command.isMultiLine := true;
				ReadTexts(text, command.texts, ColorCommandText);
			end;
			if token = TokenConditions then
				ReadConditions(text, command.conditions);
			if token = TokenCmd then
				ReadToken(text, command.cmd);
			if token = TokenTransitions then
				ReadTransitions(text, command.transitions);
			if token = TokenEnd then
			begin
				ReadToken(text, token);
				if token = TokenCommand then
				begin
					Exit(True);
				end;
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
		SetLength(commands, commandsCount);
		
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
		Exit(True);
	end;
	
	function ReadEvent(var text: TextFile; var event: TEvent): Boolean;
	var
		token: String;		
	begin
		token := '';
		if not ReadToken(text, event.name) then
			Exit(False);
		if (event.name.color = '') then
			event.name.color := ColorEventName;
		//Write('Event: ');
		//ColorWrite(event.name.text, event.name.color, 1);
		while ReadToken(text, token) do	
		begin	
			if token = TokenText then
			begin
				event.isMultiLine := false;
				ReadToken(text, event.text);
				if (event.text.color = '') then
					event.text.color := ColorEventText;
			end;
			if token = TokenTexts then
			begin
				event.isMultiLine := true;
				ReadTexts(text, event.texts, ColorEventText);
			end;			
			if token = TokenCommands then
				ReadCommands(text, event.commands);
			if token = TokenEnd then
			begin
				ReadToken(text, token);
				if token = TokenEvent then
					Exit(True);
			end;		
		end;
		Exit(True);
	end;
	
	function ReadEvents(var text: TextFile; var events: TEvents): Boolean;
	var
		token: String;
		eventsCount, I: Integer;
	begin
		ReadToken(text, token);
		eventsCount := StrToInt(token);
		SetLength(events, eventsCount);
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
			//Writeln('events end');
			ReadToken(text, token);
		end;
		Exit(True);
	end;
	
	function ReadLocation(var text: TextFile; var location: TLocation): Boolean;
	var
		token: String;		
	begin
		token := '';
		if not ReadToken(text, location.name) then
			Exit(False);
		while ReadToken(text, token) do	
		begin	
			if token = TokenEvents then
				ReadEvents(text, location.events);
			if token = TokenEnd then
			begin
				ReadToken(text, token);
				if token = TokenLocation then
					Exit(True);
			end;		
		end;
	end;
	
	function ReadLocations(var text: TextFile; var locations: TLocations): Boolean;
	var
		token: String;
		locationsCount, I: Integer;
		preLength: Integer;
	begin
		ReadToken(text, token);
		locationsCount := StrToInt(token);
		preLength := Length(locations);
		SetLength(locations, locationsCount + Length(locations));
		for I := (preLength) to (locationsCount + preLength - 1) do
		begin
			ReadToken(text, token);

			if (token = TokenLocation) then
			begin
				ReadLocation(text, locations[I]);
			end;
		end;
		ReadToken(text, token);
		if token = TokenEnd then
		begin
			ReadToken(text, token);
		end;
		Exit(True);
	end;
	
	function ReadStory(var text: TextFile; var story: TStory): Boolean;
	begin
		ReadToken(text, story);
		Exit(true);
	end;
	
	function ReadStories(var text: TextFile; var stories: TStories): Boolean;
	var
		I: Integer;
		StoryCount: Integer;
		token: String;
	begin
		ReadToken(text, token);
		StoryCount := StrToInt(token);
		SetLength(stories, StoryCount);
		for I := 0 to StoryCount - 1 do
		begin
			ReadToken(text, token);
			if token = TokenStory then
				ReadStory(text, stories[I]);
		end;
		ReadToken(text, token);
		if token = TokenEnd then
		begin
			ReadToken(text, token);
			Exit(true);
		end;
	end;
	
	function ReadTexts(var text: TextFile; var texts: TMultiLineColorText; defaultColor: String): Boolean;
	var
		I: Integer;
		LinesCount: Integer;
		token: String;
	begin
		ReadToken(text, token);
		LinesCount := StrToInt(token);
		SetLength(texts, LinesCount);
		for I := 0 to LinesCount - 1 do
		begin
			ReadToken(text, token);
			
			if token = tokenText then
			begin
				ReadToken(text, texts[I]);
				if (texts[I].color = '') then
				begin
					texts[I].color := defaultColor;
				end;
			end;
		end;
		ReadToken(text, token);
		if (token = TokenEnd) then
		begin
			ReadToken(text, token);
		end;
		Exit(True);
	end;
	
	function ReadToken(var text: TextFile; var token: String): Boolean;
	var
		isStarted, isSpecial: Boolean;
		ch: Char;
	begin
		isSpecial := False;
		isStarted := False;
		token := '';
		ch := Chr(0);
		while not EOF(text) do
		begin
			Read(text, ch);
			if ch in ['A'..'Z', 'a'..'z', '0'..'9', ',', ''''] then
			begin
				if ch = '''' then
				begin
					isSpecial := True;
					if not isStarted then
					begin
						isStarted := True;
						continue;
					end
					else
					begin
						break;
					end;
				end
				else
					isStarted := True;
			end
			else
			begin
				if (not isSpecial) and isStarted then
				begin
					break;
				end;
			end;
			
			if isStarted then		
			begin
				token := token + ch;
			end;
		end;
		ReadToken := not EOF(text);
		if (token = '') and EOF(text) then
		begin
			Writeln('danger, ', Ord(ch));
			ReadLn();
		end;
	end;
	
	function ReadToken(var text: TextFile; var token: TColorString): Boolean;
	var
		isStarted, isSpecial, isColor: Boolean;
		ch: Char;
	begin
		isSpecial := False;
		isStarted := False;
		isColor := False;
		token.text := '';
		token.color := '';
		ch := Chr(0);
		while not EOF(text) do
		begin
			Read(text, ch);
			if ch in ['A'..'Z', 'a'..'z', '0'..'9', '''', '#'] then
			begin
				if ch = '''' then
				begin
					isSpecial := True;
					if not isStarted then
					begin
						isStarted := True;
						continue;
					end
					else
					begin
						break;
					end;
				end
				else
					isStarted := True;
				
				if ch = '#' then
				begin
					isColor := true;
					continue;
				end;
			end
			else
			begin
				if (not isSpecial) and isStarted then
				begin
					break;
				end;
			end;
			
			if isStarted then		
			begin
				if not isColor then
					token.text := token.text + ch
				else
					token.color := token.color + ch;
			end;
		end;
		ReadToken := not EOF(text);
	end;	
	
	function LoadStory(fileName: String; var locations: TLocations): Boolean;
	var
		text: TextFile;
		token: String;
		folderPath: String;
	begin
		folderPath := './story/';
		fileName := fileName + '.spt';
		Assign(text, folderPath + fileName);
		Reset(text);
		ReadToken(text, token);
		if token = TokenLocations then
			ReadLocations(text, locations);
		Close(text);
		//ColorWrite('[R+] ', ColorDebug);
		//ColorWrite(fileName, ColorDebug, 1);
		Exit(True);
	end;
	
	function LoadStories(fileName: String; var locations: TLocations; var currentPosition: TPosition): Boolean;
	var
		I: Integer;
		text: TextFile;
		token: String;
		folderPath: String;
		stories: TStories;
	begin
		folderPath := './story/';
		Assign(text, folderPath + fileName);
		Reset(text);
		ReadToken(text, token);
		if token = TokenStories then
			ReadStories(text, stories);
		Close(text);
		//ColorWrite('[+] Stories', ColorDebug, 1);
		
		for I := 0 to Length(stories) - 1 do
		begin
			LoadStory(stories[I], locations);
		end;
		
		currentPosition.location := locations[0];
		currentPosition.event := currentPosition.location.events[0];
		
		//ColorWrite('[+] Locations', ColorDebug, 1);
		Exit(True);
	end;
end.