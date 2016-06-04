unit Effects;

interface
	uses
		types;
	function Affect(var hero: THero; effect: TEffect): Boolean;
	function Affect(var hero: THero; effects: TEffects): Boolean;
	
	function Damage(var hero: THero; effect: TEffect): Boolean;
	function Heal(var hero: THero; effect: TEffect): Boolean;
	function Boost(var hero: THero; effect: TEffect): Boolean;
	function Decrease(var hero: THero; effect: TEffect): Boolean;
	function TakeToDrink(var hero: THero; effect: TEffect): Boolean;
	function Sober(var hero: THero; effect: TEffect): Boolean;
	
	function PumpUp(var hero: THero; effect: TEffect): Boolean;
	function PumpDown(var hero: THero; effect: TEffect): Boolean;
	function ReduceIntelligence(var hero: THero; effect: TEffect): Boolean;
	function IncreaseIntelligence(var hero: THero; effect: TEffect): Boolean;
	function Cheatter(var hero: THero; effect: TEffect): Boolean;
	function Cheatless(var hero: THero; effect: TEffect): Boolean;
	function Luckly(var hero: THero; effect: TEffect): Boolean;
	function Luckless(var hero: THero; effect: TEffect): Boolean;
	
	function UpRIG(var hero: THero; effect: TEffect): Boolean;
	function DownRIG(var hero: THero; effect: TEffect): Boolean;
	function UpRIU(var hero: THero; effect: TEffect): Boolean;
	function DownRIU(var hero: THero; effect: TEffect): Boolean;
	

implementation
	function Damage(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.Health := hero.Health - effect.value;
		if hero.Health < 0 then
			hero.Health := 0;
		if hero.Health = 0 then
			Exit(False);
		Exit(True);
	end;
	
	function Heal(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.Health := hero.Health + effect.value;
		if hero.Health > 100 then
			hero.Health := 100;
		if hero.Health = 100 then
			Exit(True);
		Exit(False);
	end;

	function Boost(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.Energy := hero.Energy + effect.value;
		if hero.Energy > 100 then
			hero.Energy := 100;
		if hero.Energy = 100 then
			Exit(True);
		Exit(False);
	end;
	
	function Decrease(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.Energy := hero.Energy - effect.value;
		if hero.Energy < 0 then
			hero.Energy := 0;
		if hero.Energy = 0 then
			Exit(False);
		Exit(True);
	end;
	
	function TakeToDrink(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.Alchohol := hero.Alchohol + effect.value;
		if hero.Alchohol > 100 then
			hero.Alchohol := 100;
		if hero.Alchohol = 100 then
			Exit(False);
		Exit(True);
	end;
	
	function Sober(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.Alchohol := hero.Alchohol - effect.value;
		if hero.Alchohol < 0 then
			hero.Alchohol := 0;
		if hero.Alchohol = 0 then 
			Exit(True);
		Exit(False);
	end;
	
	function PumpUp(var hero: THero; effect: TEffect): Boolean; 
	begin
		hero.Strength := hero.Strength + effect.value;
		if hero.Strength > 100 then
			hero.Strength := 100;
		if hero.Strength = 100 then
			Exit(True);
		Exit(False);
	end;
	
	function PumpDown(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.Strength := hero.Strength - effect.value;
		if hero.Strength < 0 then
			hero.Strength := 0;
		if hero.Strength = 0 then
			Exit(False);
		Exit(True);
	end;
	
	function ReduceIntelligence(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.Intelligence := hero.Strength - effect.value;
		if hero.Intelligence < 0 then
			hero.Intelligence := 0;
		if hero.Intelligence = 0 then
			Exit(False);
		Exit(True);
	end;
	
	function IncreaseIntelligence(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.Intelligence := hero.Strength + effect.value;
		if hero.Intelligence > 100 then
			hero.Intelligence := 100;
		if hero.Intelligence = 100 then
			Exit(True);
		Exit(False);
	end;
	
	function Cheatter(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.Agility := hero.Agility + effect.value;
		if hero.Agility > 100 then
			hero.Agility := 100;
		if hero.Agility = 100 then
			Exit(True);
		Exit(False);
	end;
	
	function Cheatless(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.Agility := hero.Agility - effect.value;
		if hero.Agility < 0 then
			hero.Agility := 0;
		if hero.Agility = 0 then
			Exit(False);
		Exit(True);
	end;
	
	function Luckly(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.Fortune := hero.Fortune + effect.value;
		if hero.Fortune > 100 then
			hero.Fortune := 100;
		if hero.Fortune = 100 then
			Exit(True);
		Exit(False);
	end;
	
	function Luckless(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.Fortune := hero.Fortune - effect.value;
		if hero.Fortune < 0 then
			hero.Fortune := 0;
		if hero.Fortune = 0 then
			Exit(False);
		Exit(True);
	end;
	
	function UpRIG(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.ReputationInGroup := hero.ReputationInGroup + effect.value;
		if hero.ReputationInGroup > 100 then
			hero.ReputationInGroup := 100;
		if hero.ReputationInGroup = 100 then
			Exit(True);
		Exit(False);
	end;
	
	function DownRIG(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.ReputationInGroup := hero.ReputationInGroup - effect.value;
		if hero.ReputationInGroup < 0 then
			hero.ReputationInGroup := 0;
		if hero.ReputationInGroup = 0 then
			Exit(False);
		Exit(True);
	end;
	
	function UpRIU(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.ReputationInUnderworld := hero.ReputationInUnderworld + effect.value;
		if hero.ReputationInUnderworld > 100 then
			hero.ReputationInUnderworld := 100;
		if hero.ReputationInUnderworld = 100 then
			Exit(True);
		Exit(False);
	end;
	
	function DownRIU(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.ReputationInUnderworld := hero.ReputationInUnderworld - effect.value;
		if hero.ReputationInUnderworld < 0 then
			hero.ReputationInUnderworld := 0;
		if hero.ReputationInUnderworld = 0 then
			Exit(False);
		Exit(True);
	end;
	
	function Affect(var hero: THero; effect: TEffect): Boolean;
	begin
		if effect.name = 'damage' then
			if not Damage(hero, effect) then
				Exit(False);
		if effect.name = 'heal' then
			if not Heal(hero, effect) then
				Exit(False);
		if effect.name = 'boost' then
			if not Boost(hero, effect) then
				Exit(False);
		if effect.name = 'decrease' then
			if not Decrease(hero, effect) then
				Exit(False);
		if effect.name = 'take_to_drink' then
			if not TakeToDrink(hero, effect) then
				Exit(False);
		if effect.name = 'sober' then
			if not Sober(hero, effect) then
				Exit(False);
		if effect.name = 'pump_up' then
			if not PumpUp(hero, effect) then
				Exit(False);
		if effect.name = 'pump_down' then
			if not PumpDown(hero, effect) then
				Exit(False);
		if effect.name = 'reduce_intelligence' then
			if not ReduceIntelligence(hero, effect) then
				Exit(False);
		if effect.name = 'inrease_intelligence' then
			if not IncreaseIntelligence(hero, effect) then
				Exit(False);
		if effect.name = 'cheatter' then
			if not Cheatter(hero, effect) then
				Exit(False);
		if effect.name = 'cheatless' then
			if not Cheatless(hero, effect) then
				Exit(False);
		if effect.name = 'luckly' then
			if not Luckly(hero, effect) then
				Exit(False);
		if effect.name = 'luckless' then
			if not Luckless(hero, effect) then
				Exit(False);
		if effect.name = 'up_reputation_in_group' then
			if not UpRIG(hero, effect) then
				Exit(False);
		if effect.name = 'down_reputation_in_group' then
			if not DownRIG(hero, effect) then
				Exit(False);
		if effect.name = 'up_reputation_in_university' then
			if not UpRIU(hero, effect) then
				Exit(False);
		if effect.name = 'down_reputation_in_university' then
			if not DownRIU(hero, effect) then
				Exit(False);
		Exit(True);
	end;

	function Affect(var hero: THero; effects: TEffects): Boolean;
	var
		I: Integer;
	begin
		// TODO: console output
		for I := 0 to Length(effects) - 1 do
			if not Affect(hero, effects[I]) then
				Exit(False);
		Exit(True);
	end;
end.