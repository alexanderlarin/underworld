unit Engine;

interface
	uses
		outputcolor,
		effects,
		types;
		
	procedure Playing(var hero: THero; locations: TLocations; location: TLocation; event: TEvent);
	function Fall(var hero: THero; locations: TLocations; var location: TLocation; var event: TEvent): Boolean;
	function ChangeLocation(locations: TLocations; var location: TLocation; transition: TTransition): Boolean;
	function ChangeEvent(events: TEvents; var event: TEvent; toEvent: String): Boolean;
	function ChooseTransition(hero: THero; transitions: TTransitions; var transition: TTransition): Boolean;
	function ChooseCommand(commands: TCommands; cmd: String; var command: TCommand): Boolean;
	procedure PrintEvent(event: TEvent);
	procedure PrintStatsHero(hero: THero);
	
	function CheckConditions(hero: THero; conditions: TConditions): Boolean;
	
implementation
	procedure PrintStatsHero(hero: THero);
	begin
		ColorWrite('=======ХАРАКТЕРИСТИКИ ПЕРСОНАЖА=======',ColorDefault,1);
		ColorWrite('Здоровье: ', ColorAttribute);
		ColorWrite(hero.health, ColorNumber);
		ColorWrite('%', ColorNumber, 1);
		ColorWrite('Бодрость: ', ColorAttribute);
		ColorWrite(hero.Energy, ColorNumber);
		ColorWrite('%', ColorNumber, 1);
		ColorWrite('Содержание алкоголя: ', ColorAttribute);
		ColorWrite(hero.Alchohol, ColorNumber);
		ColorWrite('%', ColorNumber, 2);

		ColorWrite('Сила: ',ColorAttribute);
		ColorWrite(hero.Strength, ColorNumber, 1);
		ColorWrite('Ловкость: ', ColorAttribute);
		ColorWrite(hero.Agility, ColorNumber, 1);
		ColorWrite('Интеллект: ',ColorAttribute);
		ColorWrite(hero.Intelligence, ColorNumber, 1);
		ColorWrite('Удача: ',ColorAttribute);
		ColorWrite(hero.Fortune, ColorNumber, 1);
		ColorWrite('======================================', ColorDefault, 1);
	end;
	
	procedure PrintEvent(event: TEvent);
	var I: Integer;
	begin
		ColorWrite(event.text.text, event.text.color, 1);
		for I := 0 to Length(event.commands) - 1 do
		begin
			ColorWrite(event.commands[I].cmd, ColorNumber);
			ColorWrite(': ', ColorDefault);
			ColorWrite(event.commands[I].name.text, event.commands[I].name.color, 1);
		end;
		ColorWrite('Введите команду: ', ColorDefault);
	end;
	
	function CheckConditions(hero: THero; conditions: TConditions): Boolean;
	var
		I: Integer;
		condition: TCondition;
	begin
		for I := 0 to Length(conditions) - 1 do
		begin		
			condition := conditions[I];
			if (condition.name = '=') then
				if not (GetAttrHero(hero, condition.attribute) = condition.Value) then
				begin
					Exit(False);
				end;
				
			if (condition.name = '>') then
				if not (GetAttrHero(hero, condition.attribute) > condition.Value) then
				begin
					Exit(False);
				end;
			
			if (condition.name = '<') then
				if not (GetAttrHero(hero, condition.attribute) < condition.Value) then
				begin
					Exit(False);
				end;
		end;
		Exit(true);
	end;
	
	function ChooseCommand(commands: TCommands; cmd: String; var command: TCommand): Boolean;
	var 
		I: Integer;
	begin
		ReadLn(cmd);
		for I := 0 to Length(commands) - 1 do
		begin
			if commands[I].cmd = cmd then
			begin
				ColorWrite(commands[I].text.text, commands[I].text.color, 1);
				command := commands[I];
				Exit(True);
			end;
		end;
		Exit(False);	
	end;
	
	function ChooseTransition(hero: THero; transitions: TTransitions; var transition: TTransition): Boolean;
	var
		I: Integer;
	begin
		for I := 0 to Length(transitions) - 1 do
		begin			
			if (CheckConditions(hero, transitions[I].conditions)) then
			begin
				transition := transitions[I];					
				Exit(True);
			end;
		end;
	end;
	
	function ChangeEvent(events: TEvents; var event: TEvent; toEvent: String): Boolean;
	var
		I: Integer;
	begin
		if toEvent <> '' then
		begin
			for I := 0 to Length(events) - 1 do
			begin
				if events[I].name.text = toEvent then
				begin	
					event := events[I];
					Exit(True);
				end;	
			end;	
		end;
		Exit(False);
	end;
	
	function ChangeLocation(locations: TLocations; var location: TLocation; transition: TTransition): Boolean;
	var
		I: Integer;
	begin
		if (transition.toLocation <> '') and (transition.toLocation <> location.name.text) then
		begin
			for I := 0 to (Length(locations) - 1) do
			begin
				if locations[I].name.text = transition.toLocation then
				begin	
					location := locations[I];
					ColorWrite('Переход на локацию "', ColorTransLocation);
					ColorWrite(transition.toLocation, ColorLocation);
					ColorWrite('" ', ColorTransLocation);
					ColorWrite('к событию "', ColorTransLocation);
					ColorWrite(transition.toEvent, ColorEventName);
					ColorWrite('" ', ColorTransLocation, 1);
					Exit(True);
				end;	
			end;	
		end;
		Exit(False);
	end;
	
	function Fall(var hero: THero; locations: TLocations; var location: TLocation; var event: TEvent): Boolean;
	var
		isFalling: Boolean;
		command: TCommand;
		transition: TTransition;
		cmd: String;
	begin
		PrintStatsHero(hero);
		PrintEvent(event);
		ChooseCommand(event.commands, cmd, command);
		ChooseTransition(hero, command.transitions, transition);
		Affect(hero, transition.effects);
		ChangeLocation(locations, location, transition);
		isFalling := ChangeEvent(location.events, event, transition.toEvent);		
		Exit(isFalling);
	end;
	
	procedure Playing(var hero: THero; locations: TLocations; location: TLocation; event: TEvent);
	var
		isFalling: Boolean;
	begin		
		repeat
			isFalling := Fall(hero, locations, location, event);
		until (not isFalling);
	end;
end.