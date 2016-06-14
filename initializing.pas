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
		storyparser,
		types;
	procedure InitEncoding();
	procedure InitSettings();
	procedure InitLocations(var locations: TLocations; var location: TLocation; var event: TEvent);
	procedure InitHeroes(var hero: THero; var antiHero: THero);
implementation
	procedure InitEncoding();
	begin
		{$IFDEF WINDOWS}
		SetConsoleOutputCP(CP_UTF8);
		{$ENDIF}
		ColorWrite('Привет, Дно.', 'Yellow', 1);
		ColorWrite('[+] Encoding', ColorDebug, 1);
	end;
	
	procedure InitSettings();
	begin
		ColorWrite('[+] Settings', ColorDebug, 1);
	end;
	
	procedure InitLocations(var locations: TLocations; var location: TLocation; var event: TEvent);
	var
		I: Integer;
	begin
		for I := 1 to ParamCount do
		begin
			if ((ParamStr(I) = 'story') or (ParamStr(I) = '-story') or (ParamStr(I) = '/story')) then
			begin
				if (ParamStr(I + 1) <> '') then
				begin
					LoadStory(ParamStr(I + 1), locations, location, event);
					Exit();
				end
			end;
		end;
		LoadStory('default.spt', locations, location, event);
	end;
	
	procedure InitHeroes(var hero: THero; var antiHero: THero);
	begin		
		hero.health := 9;
		hero.energy := 7;
		hero.alchohol := 1;
		
		hero.strength := 6;
		hero.intelligence := 6;
		hero.fortune := 0;
		
		hero.love := 0;
		hero.happy := 5;
		hero.reputationInGroup := 5;
		hero.reputationInUnderworld := 3;
		
		antiHero.health := 10;
		antiHero.energy := 9;
		antiHero.alchohol := 3;
		
		antiHero.strength := 3;
		antiHero.intelligence := 5;
		antiHero.fortune := 5;
		
		antiHero.love := 4;
		antiHero.happy := 7;
		antiHero.reputationInGroup := 8;
		antiHero.reputationInUnderworld := 5;
				
		ColorWrite('[+] Heroes', ColorDebug, 1);
	end;
end.