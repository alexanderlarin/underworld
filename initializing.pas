unit Initializing;

interface
	uses
		{$IFDEF UNIX}
		cwstring,
		{$ENDIF}
		{$IFDEF WINDOWS}
		windows,
		{$ENDIF}
		outputcolor,
		canvas,
		storyparser,
		types;
	procedure InitEncoding();
	procedure InitCanvas();
	procedure InitSettings();
	procedure InitLocations(var locations: TLocations; var currentPosition: TPosition);
	procedure InitHeroes(var hero: THero; var antiHero: THero);
implementation
	procedure InitEncoding();
	begin
		{$IFDEF WINDOWS}		
		SetConsoleOutputCP(CP_UTF8);
		{$ENDIF}
		ColorWrite('Привет, Дно.', 'Yellow', 1);
		//ColorWrite('[+] Encoding', ColorDebug, 1);
	end;
	
	procedure InitCanvas();
	begin
		CanvasClear();
		CanvasAddLayout();
		CanvasAddStats();
		CanvasAddChooseCommand();
		CanvasAddLocation();
		
		//TestStats();
		//TestLocation();
		//TestTransLocation();
		//TestEvent();
		//TestCommand();
		
		//CanvasFlush();
		
		CanvasResetPos();
		//CanvasSetReadPos();
	end;
	
	procedure InitSettings();
	begin
		//ColorWrite('[+] Settings', ColorDebug, 1);
	end;
	
	procedure InitLocations(var locations: TLocations; var currentPosition: TPosition);
	var
		I: Integer;
	begin
		for I := 1 to ParamCount do
		begin
			if ((ParamStr(I) = 'story') or (ParamStr(I) = '-story') or (ParamStr(I) = '/story')) then
			begin
				if (ParamStr(I + 1) <> '') then
				begin
					LoadStories(ParamStr(I + 1), locations, currentPosition);
					Exit();
				end
			end;
		end;
		LoadStories('default.spt', locations, currentPosition);
	end;
	
	procedure InitHeroes(var hero: THero; var antiHero: THero);
	begin		
		hero.health.value := 9;
		hero.energy.value := 7;
		hero.alchohol.value := 0;
		hero.vape.value := 0;
		
		hero.strength.value := 5;
		hero.intelligence.value := 6;
		hero.fortune.value := 0;
		
		hero.love.value := 0;
		hero.happy.value := 5;
		hero.reputationInGroup.value := 5;
		hero.reputationInUnderworld.value := 3;
		
		antiHero.health.value := 10;	
		antiHero.strength.value := 6;
		antiHero.intelligence.value := 9;

		
		hero.health.changed := 0;
		hero.energy.changed := 0;
		hero.alchohol.changed := 0;
		hero.vape.changed := 0;
		
		hero.strength.changed := 0;
		hero.intelligence.changed := 0;
		hero.fortune.changed := 0;
		
		hero.love.changed := 0;
		hero.happy.changed := 0;
		hero.reputationInGroup.changed := 0;
		hero.reputationInUnderworld.changed := 0;
		
		antiHero.health.changed := 0;
		antiHero.strength.changed := 0;
		antiHero.intelligence.changed := 0;
		
		//ColorWrite('[+] Heroes', ColorDebug, 1);
	end;
end.