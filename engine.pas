unit Engine;

interface
	uses
		canvas,
		outputcolor,
		echo,
		effects,
		conditions,
		types;
		
	function Play(locations: TLocations; var status: TStatus): Boolean;
	function Fall(locations: TLocations; var status: TStatus; var isPlaying: Boolean): Boolean;
	
	function ChangeLocation(locations: TLocations; var location: TLocation; transition: TTransition; lineTransition: Integer): Boolean;
	function ChangeEvent(var currentPosition: TPosition; toEvent: String): Boolean;
	function ChooseTransition(hero: THero; antiHero: THero; transitions: TTransitions; var transition: TTransition): Boolean;
	function ChooseCommand(commands: TCommands; var cmd: String; var command: TCommand): Boolean;
	
implementation
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
	
	function Fall(locations: TLocations; var status: TStatus; var isPlaying: Boolean): Boolean;
	var
		isFalling: Boolean;
		command: TCommand;
		transition: TTransition;
		cmd: String;
		line: Integer;	
		lineTransition: Integer;
		I: Integer;
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
			if cmd = 'restart' then
			begin
				isPlaying := true;
				Exit(False);
			end;
		end;
		CanvasFlush();
		PrintCommand(command, line);
		ChooseTransition(status.hero, status.antiHero, command.transitions, transition);
		if transition.name = 'Over' then
		begin
			CanvasForseFlush();
			//CanvasClear();
			for I := 0 to Length(command.conditions) - 1 do
			begin
				if CheckCondition(status.hero, status.antiHero, command.conditions[I]) then
					PrintConditionText(command.conditions[I], line);
			end;
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
		if transition.name = 'GoodOver' then
			status.isCredits := true;
		PrintTransition(transition, line);
		Affect(status.hero, status.antiHero, transition.effects);
		ChangeLocation(locations, status.currentPosition.location, transition, lineTransition);	
		isFalling := ChangeEvent(status.currentPosition, transition.toEvent);		
		PrintStatsChangingHero(status.hero);
		PrintEvent(status.currentPosition.event, line);
		PrintCommands(status.currentPosition.event.commands);
		Exit(isFalling);
	end;
	
	function Play(locations: TLocations; var status: TStatus): Boolean;
	var
		isFalling: Boolean;
		isPlaying: Boolean;
	begin		
		isPlaying := false;
		repeat
			isFalling := Fall(locations, status, isPlaying);
		until (not isFalling);
		Exit(isPlaying);
	end;
end.