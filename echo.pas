unit Echo;

interface
	uses
		canvas,
		outputcolor,
		types;
		
	procedure PrintEvent(event: TEvent; line: Integer; fullLine: Boolean);
	procedure PrintEvent(event: TEvent; var line: Integer);
	procedure PrintConditionText(condition: TCondition; var line: Integer);
	procedure PrintCommand(command: TCommand; var line: Integer);
	procedure PrintCommands(commands: TCommands);
	procedure PrintStatsHero(hero: THero);
	procedure PrintCurrentStatsHero(hero: THero);
	procedure PrintLocation(locationName: TColorString);
	procedure PrintStatsChangingHero(var hero: THero);
	procedure PrintTransition(transition: TTransition; var line: Integer);
	procedure PrintTransLocation(transition: TTransition; lineTransition: Integer);

implementation
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
		LineChar(52, 21, 25, ' ');
		if (locationName.color = '') then
			locationName.color := ColorLocation;
		GotoXY(PosStatsX + ((ConsoleWidth - PosStatsX) div 2) - (Length(UTF8Decode(locationName.text)) div 2), 21);
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
			ColorWrite(commands[I].name.text, commands[I].name.color, 1, 46);
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
end.