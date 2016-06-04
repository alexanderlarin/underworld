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
	
	function UpReputationInGroup(var hero: THero; effect: TEffect): Boolean;
	function DownReputationInGroup(var hero: THero; effect: TEffect): Boolean;
	function UpReputationInUniversity(var hero: THero; effect: TEffect): Boolean;
	function DownReputationInUniversity(var hero: THero; effect: TEffect): Boolean;
	
	function GetAttrHero(hero: THero; attribute: String): Integer;

implementation
	function Damage(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.health := hero.health - effect.value;
		if hero.health < 0 then
			hero.health := 0;
		if hero.health = 0 then
			Exit(False);
		Exit(True);
	end;
	
	function Heal(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.health := hero.health + effect.value;
		if hero.health > 100 then
			hero.health := 100;
		if hero.health = 100 then
			Exit(True);
		Exit(False);
	end;

	function Boost(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.energy := hero.energy + effect.value;
		if hero.energy > 100 then
			hero.energy := 100;
		if hero.energy = 100 then
			Exit(True);
		Exit(False);
	end;
	
	function Decrease(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.energy := hero.energy - effect.value;
		if hero.energy < 0 then
			hero.energy := 0;
		if hero.energy = 0 then
			Exit(False);
		Exit(True);
	end;
	
	function TakeToDrink(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.alchohol := hero.alchohol + effect.value;
		if hero.alchohol > 100 then
			hero.alchohol := 100;
		if hero.alchohol = 100 then
			Exit(False);
		Exit(True);
	end;
	
	function Sober(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.alchohol := hero.alchohol - effect.value;
		if hero.alchohol < 0 then
			hero.alchohol := 0;
		if hero.alchohol = 0 then 
			Exit(True);
		Exit(False);
	end;
	
	function PumpUp(var hero: THero; effect: TEffect): Boolean; 
	begin
		hero.strength := hero.strength + effect.value;
		if hero.strength > 100 then
			hero.strength := 100;
		if hero.strength = 100 then
			Exit(True);
		Exit(False);
	end;
	
	function PumpDown(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.strength := hero.strength - effect.value;
		if hero.strength < 0 then
			hero.strength := 0;
		if hero.strength = 0 then
			Exit(False);
		Exit(True);
	end;
	
	function ReduceIntelligence(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.intelligence := hero.strength - effect.value;
		if hero.intelligence < 0 then
			hero.intelligence := 0;
		if hero.intelligence = 0 then
			Exit(False);
		Exit(True);
	end;
	
	function IncreaseIntelligence(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.intelligence := hero.strength + effect.value;
		if hero.intelligence > 100 then
			hero.intelligence := 100;
		if hero.intelligence = 100 then
			Exit(True);
		Exit(False);
	end;
	
	function Cheatter(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.agility := hero.agility + effect.value;
		if hero.agility > 100 then
			hero.agility := 100;
		if hero.agility = 100 then
			Exit(True);
		Exit(False);
	end;
	
	function Cheatless(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.agility := hero.agility - effect.value;
		if hero.agility < 0 then
			hero.agility := 0;
		if hero.agility = 0 then
			Exit(False);
		Exit(True);
	end;
	
	function Luckly(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.fortune := hero.fortune + effect.value;
		if hero.fortune > 100 then
			hero.fortune := 100;
		if hero.fortune = 100 then
			Exit(True);
		Exit(False);
	end;
	
	function Luckless(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.fortune := hero.fortune - effect.value;
		if hero.fortune < 0 then
			hero.fortune := 0;
		if hero.fortune = 0 then
			Exit(False);
		Exit(True);
	end;
	
	function UpReputationInGroup(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.reputationInGroup := hero.reputationInGroup + effect.value;
		if hero.reputationInGroup > 100 then
			hero.reputationInGroup := 100;
		if hero.reputationInGroup = 100 then
			Exit(True);
		Exit(False);
	end;
	
	function DownReputationInGroup(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.reputationInGroup := hero.reputationInGroup - effect.value;
		if hero.reputationInGroup < 0 then
			hero.reputationInGroup := 0;
		if hero.reputationInGroup = 0 then
			Exit(False);
		Exit(True);
	end;
	
	function UpReputationInUniversity(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.reputationInUnderworld := hero.reputationInUnderworld + effect.value;
		if hero.reputationInUnderworld > 100 then
			hero.reputationInUnderworld := 100;
		if hero.reputationInUnderworld = 100 then
			Exit(True);
		Exit(False);
	end;
	
	function DownReputationInUniversity(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.reputationInUnderworld := hero.reputationInUnderworld - effect.value;
		if hero.reputationInUnderworld < 0 then
			hero.reputationInUnderworld := 0;
		if hero.reputationInUnderworld = 0 then
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
		if effect.name = 'takeToDrink' then
			if not TakeToDrink(hero, effect) then
				Exit(False);
		if effect.name = 'sober' then
			if not Sober(hero, effect) then
				Exit(False);
		if effect.name = 'pumpUp' then
			if not PumpUp(hero, effect) then
				Exit(False);
		if effect.name = 'pumpDown' then
			if not PumpDown(hero, effect) then
				Exit(False);
		if effect.name = 'ReduceIntelligence' then
			if not ReduceIntelligence(hero, effect) then
				Exit(False);
		if effect.name = 'inreaseIntelligence' then
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
		if effect.name = 'upReputationInGroup' then
			if not UpReputationInGroup(hero, effect) then
				Exit(False);
		if effect.name = 'downReputationInGroup' then
			if not DownReputationInGroup(hero, effect) then
				Exit(False);
		if effect.name = 'upReputationInUniversity' then
			if not UpReputationInUniversity(hero, effect) then
				Exit(False);
		if effect.name = 'downReputationInUniversity' then
			if not DownReputationInUniversity(hero, effect) then
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
	
	function GetAttrHero(hero: THero; attribute: String): Integer;
	var
		value: Integer;
	begin
		value := hero.Health;
		case attribute of
		'depth': value := hero.depth;
		
		'Health': value := hero.Health;
		'Energy': value := hero.Energy;
		'Alchohol': value := hero.Alchohol;
		
		'Strength': value := hero.Strength;
		'Agility': value := hero.Agility;
		'Intelligence': value := hero.Intelligence;
		'Fortune': value := hero.Fortune;
		
		'ReputationInGroup': value := hero.ReputationInGroup;
		'ReputationInUnderWorld': value := hero.ReputationInUnderWorld;
		end;
		GetAttrHero := value;
	end;
end.