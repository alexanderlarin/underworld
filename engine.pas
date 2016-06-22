unit Engine;

interface
	uses
		canvas,
		outputcolor,
		effects,
		conditions,
		types;
		
	procedure Playing(locations: TLocations; var status: TStatus);
	function Fall(locations: TLocations; var status: TStatus): Boolean;
	function ChangeLocation(locations: TLocations; var location: TLocation; transition: TTransition; lineTransition: Integer): Boolean;
	function ChangeEvent(var currentPosition: TPosition; toEvent: String): Boolean;
	function ChooseTransition(hero: THero; antiHero: THero; transitions: TTransitions; var transition: TTransition): Boolean;
	function ChooseCommand(commands: TCommands; var cmd: String; var command: TCommand): Boolean;
	procedure PrintEvent(event: TEvent; line: Integer; fullLine: Boolean);
	procedure PrintEvent(event: TEvent; var line: Integer);
	procedure PrintCommands(commands: TCommands);
	procedure PrintStatsHero(hero: THero);
	procedure PrintCurrentStatsHero(hero: THero);
	procedure PrintLocation(locationName: TColorString);
	procedure PrintStatsChangingHero(var hero: THero);
	procedure PrintCommand(command: TCommand; var line: Integer);
	procedure PrintTransition(transition: TTransition; var line: Integer);
	
implementation
	procedure PrintStatsHero(hero: THero); // Procedure is depricated.
	begin
		ColorWrite('=======ХАРАКТЕРИСТИКИ ПЕРСОНАЖА=======',ColorDefault,1);
		ColorWrite('Здоровье: ', ColorAttribute);
		ColorWrite(hero.health.value, ColorNumber);
		ColorWrite('0%', ColorNumber, 1);
		ColorWrite('Бодрость: ', ColorAttribute);
		ColorWrite(hero.energy.value, ColorNumber);
		ColorWrite('0%', ColorNumber, 1);
		ColorWrite('Содержание алкоголя: ', ColorAttribute);
		ColorWrite(hero.alchohol.value, ColorNumber);
		ColorWrite('0%', ColorNumber, 1);
		ColorWrite('Накуренность: ', ColorAttribute);
		ColorWrite(hero.vape.value, ColorNumber);
		ColorWrite('0%', ColorNumber, 1);
		ColorWrite('Сила: ',ColorAttribute);
		ColorWrite(hero.strength.value, ColorNumber);
		ColorWrite('0%', ColorNumber, 1);
		ColorWrite('Интеллект: ',ColorAttribute);
		ColorWrite(hero.intelligence.value, ColorNumber);
		ColorWrite('0%', ColorNumber, 1);
		ColorWrite('Удача: ',ColorAttribute);
		ColorWrite(hero.fortune.value, ColorNumber);
		ColorWrite('0%', ColorNumber, 1);
		ColorWrite('Счастье: ',ColorAttribute);
		ColorWrite(hero.happy.value, ColorNumber);
		ColorWrite('0%', ColorNumber, 1);
		ColorWrite('Репутация в группе: ',ColorAttribute);
		ColorWrite(hero.reputationInGroup.value, ColorNumber);
		ColorWrite('0%', ColorNumber, 1);
		ColorWrite('Репутация в универе: ',ColorAttribute);
		ColorWrite(hero.reputationInUnderworld.value, ColorNumber);
		ColorWrite('0%', ColorNumber, 1);
		ColorWrite('======================================', ColorDefault, 1);
	end;
	
	procedure PrintStat(value: Integer; number: Integer);
	begin
		GotoXY(PosStatX - 1, number);
		ColorWrite('.', ColorAttribute);
		if value = 10 then
			GotoXY(PosStatX - 1, number)
		else
			GotoXY(PosStatX, number);
		ColorWrite(value, ColorNumber);
		ColorWrite('0%', ColorNumber);
	end;
	
	procedure PrintStatChanging(var stat: TStat; number: Integer);
	begin
		if (stat.changed = 0) then
			Exit();
		PrintStat(stat.value, number);
		GotoXY(PosStatX + 3, number);
		if stat.changed > 0 then
		begin
			ColorWrite('+', ColorPositiveChanging);
			ColorWrite(stat.changed, ColorPositiveChanging);
			ColorWrite('0%', ColorPositiveChanging);
		end
		else
		begin
			ColorWrite(stat.changed, ColorNegativeChanging);
			ColorWrite('0%', ColorNegativeChanging);
		end;
		stat.changed := 0;
	end;
	
	procedure PrintCurrentStatsHero(hero: THero);
	begin
		PrintStat(hero.health.value, 1);
		PrintStat(hero.energy.value, 2);
		PrintStat(hero.alchohol.value, 3);
		PrintStat(hero.vape.value, 4);
		PrintStat(hero.strength.value, 5);
		PrintStat(hero.intelligence.value, 6);
		PrintStat(hero.fortune.value, 7);
		PrintStat(hero.happy.value, 8);
		PrintStat(hero.reputationInGroup.value, 9);
		PrintStat(hero.reputationInUnderworld.value, 10);
		
		CanvasResetPos();
	end;
	
	procedure PrintStatsChangingHero(var hero: THero);
	begin
		PrintStatChanging(hero.health, 1);
		PrintStatChanging(hero.energy, 2);
		PrintStatChanging(hero.alchohol, 3);
		PrintStatChanging(hero.vape, 4);
		PrintStatChanging(hero.strength, 5);
		PrintStatChanging(hero.intelligence, 6);
		PrintStatChanging(hero.fortune, 7);
		PrintStatChanging(hero.happy, 8);
		PrintStatChanging(hero.reputationInGroup, 9);
		PrintStatChanging(hero.reputationInUnderworld, 10);
		
		CanvasResetPos();
	end;
	
	procedure PrintLocation(locationName: TColorString);
	begin
		GotoXY(62, 21);
		LineChar(62, 21, 20, ' ');
		if (locationName.color = '') then
			locationName.color := ColorLocation;
		ColorWrite(locationName.text, locationName.color);
		GotoXY(0, 0);
	end;
	
	procedure PrintEvent(event: TEvent; line: Integer; fullLine: Boolean);
	var I: Integer;
	begin		
		GotoXY(0, line);
		if event.isMultiLine then
		begin
			for I := 0 to Length(event.texts) - 1 do
			begin
				if fullLine then
				begin
					ColorWrite(event.texts[I].text, event.texts[I].color);
					ColorWrite('', ColorDefault, 1);
				end
				else
				begin
					ColorWrite(event.texts[I].text, event.texts[I].color, 1);
				end;
			end;
		end
		else
		begin
			if fullLine then
				ColorWrite(event.text.text, event.text.color)
			else
				ColorWrite(event.text.text, event.text.color, 1);
 		end;		
	end;
	
	procedure PrintEvent(event: TEvent; var line: Integer);
	var I: Integer;
	begin
		GotoXY(0, line);
		if event.isMultiLine then
		begin
			for I := 0 to Length(event.texts) - 1 do
			begin
				line := line + ColorWrite(event.texts[I].text, event.texts[I].color, 1);
			end;			
		end
		else
		begin
			line := line + ColorWrite(event.text.text, event.text.color, 1);			
 		end;		
	end;
	
	procedure PrintCommands(commands: TCommands);
	var
		I: Integer;
	begin
		GotoXY(0, PosCommandsBeginY);
		for I := 0 to Length(commands) - 1 do
		begin
			ColorWrite(commands[I].cmd, ColorNumber);
			ColorWrite(': ', ColorDefault);
			ColorWrite(commands[I].name.text, commands[I].name.color, 1);
		end;
	end;
	
	function ChooseCommand(commands: TCommands; var cmd: String; var command: TCommand): Boolean;
	var 
		I: Integer;
	begin
		GotoXY(0, ConsoleHeight);
		if Length(commands) = 0 then
		begin
			readln;
			cmd := 'game_over';
			Exit(False);
		end;

		ColorWrite('Введите команду: ', ColorDefault);
		ReadLn(cmd);
		if cmd = '' then
			Exit(True);
		LineChar(17, ConsoleHeight, 4, ' ');
		for I := 0 to Length(commands) - 1 do
		begin
			if commands[I].cmd = cmd then
			begin
				command := commands[I];

				Exit(True);
			end;
		end;

		Exit(False);	
	end;
	
	procedure PrintCommand(command: TCommand; var line: Integer);
 	var
 		I: Integer;
 	begin
		GotoXY(0, line);
 		if command.isMultiLine then
 		begin
 			for I := 0 to Length(command.texts) - 1 do
 			begin
 				line := line + ColorWrite(command.texts[I].text, command.texts[I].color, 1);
 			end;
 		end
 		else
 		begin
			if command.text.text <> '' then
			begin
				line := line + ColorWrite(command.text.text, command.text.color, 1);				
			end;
 		end;
 	end;
 
	procedure PrintConditionText(condition: TCondition; var line: Integer);
	var
		I: Integer;
	begin
		if condition.isMultiLine then
 			for I := 0 to Length(condition.texts) - 1 do
			begin
 				ColorWrite(condition.texts[I].text, condition.texts[I].color);
				GotoXY(0, line + 1);
				line := line + 1;
			end
 		else
		begin
			ColorWrite(condition.text.text, condition.text.color);
			GotoXY(0, line + 1);
			line := line + 1;
		end;
	end;
	
	procedure PrintCommandConditions(hero, antiHero: THero; conditions: TConditions; var line: Integer);
	var
		I: Integer;
	begin
		for I := 0 to Length(conditions) - 1 do
		begin
			if CheckCondition(hero, antiHero, conditions[I]) then
				PrintConditionText(conditions[I], line);
		end;
	end;
	
	function ChooseTransition(hero: THero; antiHero: THero; transitions: TTransitions; var transition: TTransition): Boolean;
	var
		I: Integer;
	begin
		for I := 0 to Length(transitions) - 1 do
		begin			
			if (CheckConditions(hero, antiHero, transitions[I].conditions)) then
			begin
				transition := transitions[I];					
				Exit(True);
			end;
		end;
	end;
	
	procedure PrintTransition(transition: TTransition; var line: Integer);
	var
		I: Integer;
	begin
		GotoXY(0, line);
		if transition.isMultiLine then
		begin
			for I := 0 to Length(transition.texts) - 1 do
 			begin
 				line := line + ColorWrite(transition.texts[I].text, transition.texts[I].color, 1);				
 			end;
		end
 		else
 		begin
			if transition.text.text <> '' then
			begin
				line := line + ColorWrite(transition.text.text, transition.text.color, 1);
			end
 		end;
	end;
	
	function ChangeEvent(var currentPosition: TPosition; toEvent: String): Boolean;
	var
		I: Integer;
	begin
		if toEvent <> '' then
		begin
			for I := 0 to Length(currentPosition.location.events) - 1 do
			begin
				if currentPosition.location.events[I].name.text = toEvent then
				begin	
					currentPosition.event := currentPosition.location.events[I];
					Exit(True);
				end;	
			end;	
		end;
		Exit(False);
	end;
	
	procedure PrintTransLocation(transition: TTransition; lineTransition: Integer);
	begin
		GotoXY(0, PosTransitionBeginY + lineTransition);
		ColorWrite(' --> ', ColorLocationChanging);
		ColorWrite('Переход на локацию "', ColorTransLocation);
		ColorWrite(transition.toLocation, ColorLocation);
		ColorWrite('" ', ColorTransLocation);
		ColorWrite('к событию "', ColorTransLocation);
		ColorWrite(transition.toEvent, ColorEventName);
		ColorWrite('" ', ColorTransLocation, 1);
		lineTransition := lineTransition + 1;
	end;
	
	function ChangeLocation(locations: TLocations; var location: TLocation; transition: TTransition; lineTransition: Integer): Boolean;
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
					
					if transition.name <> 'Over' then
						PrintTransLocation(transition, lineTransition);
					PrintLocation(location.name);
					Exit(True);
				end;	
			end;	
		end;
		Exit(False);
	end;
	
	function Fall(locations: TLocations; var status: TStatus): Boolean;
	var
		isFalling: Boolean;
		command: TCommand;
		transition: TTransition;
		cmd: String;
		line: Integer;	
		lineTransition: Integer;
	begin	
		cmd := '';
		transition.toEvent := status.currentPosition.event.name.text;
		line := 0;
		lineTransition := 0;
		isFalling := ChooseCommand(status.currentPosition.event.commands, cmd, command);
		if not isFalling then
		begin
			if cmd = 'exit' then
				Exit(False);
			
		end;
		CanvasFlush();
		PrintCommand(command, line);
		ChooseTransition(status.hero, status.antiHero, command.transitions, transition);
		if transition.name = 'Over' then
		begin
			CanvasForseFlush();
			//CanvasClear();
			PrintCommandConditions(status.hero, status.antiHero, command.conditions, line);
			//ChooseTransition(status.hero, status.antiHero, command.transitions, transition);
			PrintTransition(transition, line);
			//Affect(status.hero, status.antiHero, transition.effects);		
			ChangeLocation(locations, status.currentPosition.location, transition, lineTransition);	
			isFalling := ChangeEvent(status.currentPosition, transition.toEvent);
			PrintEvent(status.currentPosition.event, line, True);				
			ColorWrite('Нажмите Enter для выхода ', ColorDefault);
			Read;
			ReadLn;
			Exit(False);
		end;
		PrintTransition(transition, line);
		Affect(status.hero, status.antiHero, transition.effects);
		ChangeLocation(locations, status.currentPosition.location, transition, lineTransition);	
		isFalling := ChangeEvent(status.currentPosition, transition.toEvent);		
		PrintStatsChangingHero(status.hero);
		PrintEvent(status.currentPosition.event, line);
		PrintCommands(status.currentPosition.event.commands);
		Exit(isFalling);
	end;
	
	procedure Playing(locations: TLocations; var status: TStatus);
	var
		isFalling: Boolean;
	begin		
		repeat
			isFalling := Fall(locations, status);
		until (not isFalling);
	end;
end.