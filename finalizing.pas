unit Finalizing;

interface
	uses
		outputcolor,
		types;
	
	function DisposeAll(var locations: TLocations; status: TStatus): Boolean;
	function DisposeResources(var locations: TLocations; status: TStatus): Boolean;
	function DisposeLocations(var locations: TLocations): Boolean;
	function DisposeLocation(var location: TLocation): Boolean;
	function DisposeEvents(var events: TEvents): Boolean;
	function DisposeEvent(var event: TEvent): Boolean;
	function DisposeCommands(var commands: TCommands): Boolean;
	function DisposeCommand(var command: TCommand): Boolean;
	function DisposeTransitions(var transitions: TTransitions): Boolean;
	function DisposeTransition(var transition: TTransition): Boolean;
	function DisposeEffects(var effects: TEffects): Boolean;
	function DisposeEffect(var effect: TEffect): Boolean;
	function DisposeConditions(var conditions: TConditions): Boolean;
	function DisposeCondition(var condition: TCondition): Boolean;
	function DisposeTexts(var texts: TMultiLineColorText): Boolean;
	function DisposeHero(var hero: THero): Boolean;
	
implementation
	function DisposeAll(var locations: TLocations; status: TStatus): Boolean;
	begin
		if DisposeResources(locations, status) then
		begin
			//ColorWrite('[+] Finalization', ColorDebug);
		end
		else
		begin
			//ColorWrite('[!] Finalization Error', ColorError);
		end;
		Exit(True);
	end;
	
	function DisposeResources(var locations: TLocations; status: TStatus): Boolean;
	begin
		if not DisposeHero(status.hero) then
		begin
			Exit(False);
		end;
		
		if not DisposeHero(status.antiHero) then
		begin
			Exit(False);
		end;
		
		if not DisposeLocations(locations) then
		begin
			Exit(False);
		end;
		SetLength(locations, 0);
		
		if not DisposeLocation(status.currentPosition.location) then
		begin
			Exit(False);
		end;
		
		if not DisposeEvent(status.currentPosition.event) then
		begin
			Exit(False);
		end;
		
		Exit(True);
	end;

	function DisposeLocations(var locations: TLocations): Boolean;
	var
		I: Integer;
	begin
		for I := 0 to Length(locations) - 1 do
		begin
			if not DisposeLocation(locations[I]) then
			begin
				Exit(False);
			end;
		end;
		Exit(True);
	end;
	
	function DisposeLocation(var location: TLocation): Boolean;
	begin
		if not DisposeEvents(location.events) then
		begin
			Exit(False);
		end;
		
		SetLength(location.events, 0);
		Exit(True);
	end;
	
	function DisposeEvents(var events: TEvents): Boolean;
	var
		I: Integer;
	begin
		for I := 0 to Length(events) - 1 do
		begin
			if not DisposeEvent(events[I]) then
			begin
				Exit(False);
			end;
		end;
		Exit(True);
	end;
	
	function DisposeEvent(var event: TEvent): Boolean;
	begin
		if not DisposeTexts(event.texts) then
		begin
			Exit(False);
		end;
		SetLength(event.texts, 0);
		
		if not DisposeCommands(event.commands) then
		begin
			Exit(False);
		end;
		
		SetLength(event.commands, 0);
		Exit(True);
	end;
	
	function DisposeCommands(var commands: TCommands): Boolean;
	var
		I: Integer;
	begin
		for I := 0 to Length(commands) - 1 do
		begin
			if not DisposeCommand(commands[I]) then
			begin
				Exit(False);
			end;
		end;
		Exit(True);
	end;
	
	function DisposeCommand(var command: TCommand): Boolean;
	begin
		if not DisposeTexts(command.texts) then
		begin
			Exit(False);
		end;
		SetLength(command.texts, 0);
		
		if not DisposeTransitions(command.transitions) then
		begin
			Exit(False);
		end;
		
		SetLength(command.transitions, 0);
		Exit(True);
	end;
	
	function DisposeTransitions(var transitions: TTransitions): Boolean;
	var
		I: Integer;
	begin
		for I := 0 to Length(transitions) - 1 do
		begin
			if not DisposeTransition(transitions[I]) then
			begin
				Exit(False);
			end;
		end;
		Exit(True);
	end;
	
	function DisposeTransition(var transition: TTransition): Boolean;
	begin
		if not DisposeTexts(transition.texts) then
		begin
			Exit(False);
		end;
		SetLength(transition.texts, 0);
		
		if not DisposeEffects(transition.effects) then
		begin
			Exit(False);
		end;
		SetLength(transition.effects, 0);
		
		if not DisposeConditions(transition.conditions) then
		begin
			Exit(False);
		end;
		
		SetLength(transition.conditions, 0);
		Exit(True);
	end;
	
	function DisposeEffects(var effects: TEffects): Boolean;
	var
		I: Integer;
	begin
		for I := 0 to Length(effects) - 1 do
		begin
			if not DisposeEffect(effects[I]) then
			begin
				Exit(False);
			end;
		end;
		Exit(True);
	end;
	
	function DisposeEffect(var effect: TEffect): Boolean;
	begin
		Exit(True);
	end;
	
	function DisposeConditions(var conditions: TConditions): Boolean;
	var
		I: Integer;
	begin
		for I := 0 to Length(conditions) - 1 do
		begin
			if not DisposeCondition(conditions[I]) then
			begin
				Exit(False);
			end;
		end;
		Exit(True);
	end;
	
	function DisposeCondition(var condition: TCondition): Boolean;
	begin
		if not DisposeTexts(condition.texts) then
		begin
			Exit(False);
		end;
		SetLength(condition.texts, 0);
		Exit(True);
	end;
	
	function DisposeTexts(var texts: TMultiLineColorText): Boolean;
	begin
		SetLength(texts, 0);
		Exit(True);
	end;
	
	function DisposeHero(var hero: THero): Boolean;
	begin
		Exit(True);
	end;
end.