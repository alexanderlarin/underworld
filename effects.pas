unit Effects;

interface
	uses
		types,
		sysutils,
		outputcolor;		
	function Affect(var hero: THero; var antiHero: THero; effect: TEffect): Boolean;
	function Affect(var hero: THero; var antiHero: THero; effects: TEffects): Boolean;
	
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
	function Luckly(var hero: THero; effect: TEffect): Boolean;
	function Luckless(var hero: THero; effect: TEffect): Boolean;
	
	function InLove(var hero: THero; effect: TEffect): Boolean;
	function Lonely(var hero: THero; effect: TEffect): Boolean;
	function Happiness(var hero: THero; effect: TEffect): Boolean;
	function Misfortune(var hero: THero; effect: TEffect): Boolean;
	
	function Tuning(var hero: THero; effect: TEffect): Boolean;
	function TakeToVape(var hero: THero; effect: TEffect): Boolean;
	 
	function UpReputationInGroup(var hero: THero; effect: TEffect): Boolean;
	function DownReputationInGroup(var hero: THero; effect: TEffect): Boolean;
	function UpReputationInUniversity(var hero: THero; effect: TEffect): Boolean;
	function DownReputationInUniversity(var hero: THero; effect: TEffect): Boolean;

implementation
	function Damage(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.health.value := hero.health.value - effect.value;
		hero.health.changed := hero.health.changed - effect.value;
		if hero.health.value < 0 then
			hero.health.value := 0;
		if hero.health.value = 0 then
			Exit(False);
		Exit(True);
	end;	
		
	function DamageAnti(var antiHero: THero; effect: TEffect): Boolean;
	begin
		antiHero.health.value := antiHero.health.value - effect.value;
		antiHero.health.changed := antiHero.health.changed - effect.value;
		if antiHero.health.value < 0 then
			antiHero.health.value := 0;
		if antiHero.health.value = 0 then
			Exit(False);
		Exit(True);
	end;
	
	function Heal(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.health.value := hero.health.value + effect.value;
		hero.health.changed := effect.value;
		if hero.health.value > 10 then
			hero.health.value := 10;
		if hero.health.value = 10 then
			Exit(True);
		Exit(True);
	end;
	
	function HealAnti(var antiHero: THero; effect: TEffect): Boolean;
	begin
		antiHero.health.value := antiHero.health.value + effect.value;
		antiHero.health.changed := -effect.value;
		if antiHero.health.value > 10 then
			antiHero.health.value := 10;
		if antiHero.health.value = 10 then
			Exit(True);
		Exit(True);
	end;

	function Boost(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.energy.value := hero.energy.value + effect.value;
		hero.energy.changed := effect.value;
		if hero.energy.value > 10 then
			hero.energy.value := 10;
		if hero.energy.value = 10 then
			Exit(True);
		Exit(True);
	end;
	
	function BoostAnti(var antiHero: THero; effect: TEffect): Boolean;
	begin
		antiHero.energy.value := antiHero.energy.value + effect.value;
		antiHero.energy.changed := antiHero.energy.changed + effect.value;
		if antiHero.energy.value > 10 then
			antiHero.energy.value := 10;
		if antiHero.energy.value = 10 then
			Exit(True);
		Exit(True);
	end;
	
	function Decrease(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.energy.value := hero.energy.value - effect.value;
		hero.energy.changed := hero.energy.changed - effect.value;
		if hero.energy.value < 0 then
			hero.energy.value := 0;
		if hero.energy.value = 0 then
			Exit(False);
		Exit(True);
	end;
	
	function DecreaseAnti(var antiHero: THero; effect: TEffect): Boolean;
	begin
		antiHero.energy.value := antiHero.energy.value - effect.value;
		antiHero.energy.changed := antiHero.energy.changed - effect.value;
		if antiHero.energy.value < 0 then
			antiHero.energy.value := 0;
		if antiHero.energy.value = 0 then
			Exit(False);
		Exit(True);
	end;
	
	function TakeToDrink(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.alchohol.value := hero.alchohol.value + effect.value;
		hero.alchohol.changed := hero.alchohol.changed + effect.value;
		if hero.alchohol.value > 10 then
			hero.alchohol.value := 10;
		if hero.alchohol.value = 10 then
			Exit(True);
		Exit(True);
	end;
	
	function TakeToDrinkAnti(var antiHero: THero; effect: TEffect): Boolean;
	begin
		antiHero.alchohol.value := antiHero.alchohol.value + effect.value;
		antiHero.alchohol.changed := antiHero.alchohol.changed + effect.value;
		if antiHero.alchohol.value > 10 then
			antiHero.alchohol.value := 10;
		if antiHero.alchohol.value = 10 then
			Exit(True);
		Exit(True);
	end;
	
	function Sober(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.alchohol.value := hero.alchohol.value - effect.value;
		hero.alchohol.changed := hero.alchohol.changed - effect.value;
		if hero.alchohol.value < 0 then
			hero.alchohol.value := 0;
		if hero.alchohol.value = 0 then 
			Exit(True);
		Exit(True);
	end;
	
	function SoberAnti(var antiHero: THero; effect: TEffect): Boolean;
	begin
		antiHero.alchohol.value := antiHero.alchohol.value - effect.value;
		antiHero.alchohol.changed := antiHero.alchohol.changed - effect.value;
		if antiHero.alchohol.value < 0 then
			antiHero.alchohol.value := 0;
		if antiHero.alchohol.value = 0 then 
			Exit(True);
		Exit(True);
	end;
	
	function PumpUp(var hero: THero; effect: TEffect): Boolean; 
	begin
		hero.strength.value := hero.strength.value + effect.value;
		hero.strength.changed := hero.strength.changed + effect.value;
		if hero.strength.value > 10 then
			hero.strength.value := 10;
		if hero.strength.value = 10 then
			Exit(True);
		Exit(True);
	end;
	
	function PumpUpAnti(var antiHero: THero; effect: TEffect): Boolean; 
	begin
		antiHero.strength.value := antiHero.strength.value + effect.value;
		antiHero.strength.changed := antiHero.strength.changed + effect.value;
		if antiHero.strength.value > 10 then
			antiHero.strength.value := 10;
		if antiHero.strength.value = 10 then
			Exit(True);
		Exit(True);
	end;
	
	function PumpDown(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.strength.value := hero.strength.value - effect.value;
		hero.strength.changed := hero.strength.changed - effect.value;
		if hero.strength.value < 0 then
			hero.strength.value := 0;
		if hero.strength.value = 0 then
			Exit(True);
		Exit(True);
	end;
	
	function PumpDownAnti(var antiHero: THero; effect: TEffect): Boolean;
	begin
		antiHero.strength.value := antiHero.strength.value - effect.value;
		antiHero.strength.changed := antiHero.strength.changed - effect.value;
		if antiHero.strength.value < 0 then
			antiHero.strength.value := 0;
		if antiHero.strength.value = 0 then
			Exit(True);
		Exit(True);
	end;
	
	function ReduceIntelligence(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.intelligence.value := hero.intelligence.value - effect.value;
		hero.intelligence.changed := hero.intelligence.changed - effect.value;
		if hero.intelligence.value < 0 then
			hero.intelligence.value := 0;
		if hero.intelligence.value = 0 then
			Exit(True);
		Exit(True);
	end;
	
	function ReduceIntelligenceAnti(var antiHero: THero; effect: TEffect): Boolean;
	begin
		antiHero.intelligence.value := antiHero.intelligence.value - effect.value;
		antiHero.intelligence.changed := antiHero.intelligence.changed - effect.value;
		if antiHero.intelligence.value < 0 then
			antiHero.intelligence.value := 0;
		if antiHero.intelligence.value = 0 then
			Exit(True);
		Exit(True);
	end;
	
	function IncreaseIntelligence(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.intelligence.value := hero.intelligence.value + effect.value;
		hero.intelligence.changed := hero.intelligence.changed + effect.value;
		if hero.intelligence.value > 10 then
			hero.intelligence.value := 10;
		if hero.intelligence.value = 10 then
			Exit(True);
		Exit(True);
	end;
	
	function IncreaseIntelligenceAnti(var antiHero: THero; effect: TEffect): Boolean;
	begin
		antiHero.intelligence.value := antiHero.intelligence.value + effect.value;
		antiHero.intelligence.changed := antiHero.intelligence.changed + effect.value;
		if antiHero.intelligence.value > 10 then
			antiHero.intelligence.value := 10;
		if antiHero.intelligence.value = 10 then
			Exit(True);
		Exit(True);
	end;
	
	
	function Luckly(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.fortune.value := hero.fortune.value + effect.value;
		hero.fortune.changed := hero.fortune.changed + effect.value;
		if hero.fortune.value > 10 then
			hero.fortune.value := 10;
		if hero.fortune.value = 10 then
			Exit(True);
		Exit(True);
	end;
	
	function LucklyAnti(var antiHero: THero; effect: TEffect): Boolean;
	begin
		antiHero.fortune.value := antiHero.fortune.value + effect.value;
		antiHero.fortune.changed := antiHero.fortune.changed + effect.value;
		if antiHero.fortune.value > 10 then
			antiHero.fortune.value := 10;
		if antiHero.fortune.value = 10 then
			Exit(True);
		Exit(True);
	end;
	
	function Luckless(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.fortune.value := hero.fortune.value - effect.value;
		hero.fortune.changed := hero.fortune.changed - effect.value;
		if hero.fortune.value < 0 then
			hero.fortune.value := 0;
		if hero.fortune.value = 0 then
			Exit(True);
		Exit(True);
	end;
	
	function LucklessAnti(var antiHero: THero; effect: TEffect): Boolean;
	begin
		antiHero.fortune.value := antiHero.fortune.value - effect.value;
		antiHero.fortune.changed := antiHero.fortune.changed - effect.value;
		if antiHero.fortune.value < 0 then
			antiHero.fortune.value := 0;
		if antiHero.fortune.value = 0 then
			Exit(True);
		Exit(True);
	end;
	
	function Lonely(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.love.value := hero.love.value - effect.value;
		hero.love.changed := hero.love.changed - effect.value;
		if hero.love.value < 0 then
			hero.love.value := 0;
		if hero.love.value = 0 then
			Exit(True);
		Exit(True);
	end;
	
	function LonelyAnti(var antiHero: THero; effect: TEffect): Boolean;
	begin
		antiHero.love.value := antiHero.love.value - effect.value;
		antiHero.love.changed := antiHero.love.changed - effect.value;
		if antiHero.love.value < 0 then
			antiHero.love.value := 0;
		if antiHero.love.value = 0 then
			Exit(True);
		Exit(True);
	end;
	
	function InLove(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.love.value := hero.love.value + effect.value;
		hero.love.changed := hero.love.changed + effect.value;
		if hero.love.value > 10 then
			hero.love.value := 10;
		if hero.love.value = 10 then
			Exit(True);
		Exit(True);
	end;
	
	function InLoveAnti(var antiHero: THero; effect: TEffect): Boolean;
	begin
		antiHero.love.value := antiHero.love.value + effect.value;
		antiHero.love.changed := antiHero.love.changed + effect.value;
		if antiHero.love.value > 10 then
			antiHero.love.value := 10;
		if antiHero.love.value = 10 then
			Exit(True);
		Exit(True);
	end;
	
  function Happiness(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.happy.value := hero.happy.value + effect.value;
		hero.happy.changed := hero.happy.changed + effect.value;
		if hero.happy.value > 10 then
			hero.happy.value := 10;
		if hero.happy.value = 10 then
			Exit(True);
		Exit(True);
	end;
	
	function HappinessAnti(var antiHero: THero; effect: TEffect): Boolean;
	begin
		antiHero.happy.value := antiHero.happy.value + effect.value;
		antiHero.happy.changed := antiHero.happy.changed + effect.value;
		if antiHero.happy.value > 10 then
			antiHero.happy.value := 10;
		if antiHero.happy.value = 10 then
			Exit(True);
		Exit(True);
	end;
	
	function Misfortune(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.happy.value := hero.happy.value - effect.value;
		hero.happy.changed := hero.happy.changed - effect.value;
		if hero.happy.value < 0 then
			hero.happy.value := 0;
		if hero.happy.value = 0 then
			Exit(True);
		Exit(True);
	end;
	
	function MisfortuneAnti(var antiHero: THero; effect: TEffect): Boolean;
	begin
		antiHero.happy.value := antiHero.happy.value - effect.value;
		antiHero.happy.changed := antiHero.happy.changed - effect.value;
		if antiHero.happy.value < 0 then
			antiHero.happy.value := 0;
		if antiHero.happy.value = 0 then
			Exit(True);
		Exit(True);
	end;
	
	function Tuning(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.tune.value := hero.tune.value + effect.value;
		hero.tune.changed := hero.tune.changed + effect.value;
	end;
	
	function TakeToVape(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.vape.value := hero.vape.value + effect.value;
		hero.vape.changed := hero.vape.changed + effect.value;
		if hero.vape.value > 10 then
			hero.vape.value := 10;
		if hero.vape.value = 10 then
			Exit(True);
	end;
	
	function UpReputationInGroup(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.reputationInGroup.value := hero.reputationInGroup.value + effect.value;
		hero.reputationInGroup.changed := hero.reputationInGroup.changed + effect.value;
		if hero.reputationInGroup.value > 10 then
			hero.reputationInGroup.value := 10;
		if hero.reputationInGroup.value = 10 then
			Exit(True);
		Exit(True);
	end;
	
	function UpReputationInGroupAnti(var antiHero: THero; effect: TEffect): Boolean;
	begin
		antiHero.reputationInGroup.value := antiHero.reputationInGroup.value + effect.value;
		antiHero.reputationInGroup.changed := antiHero.reputationInGroup.changed + effect.value;
		if antiHero.reputationInGroup.value > 10 then
			antiHero.reputationInGroup.value := 10;
		if antiHero.reputationInGroup.value = 10 then
			Exit(True);
		Exit(True);
	end;
	
	function DownReputationInGroup(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.reputationInGroup.value := hero.reputationInGroup.value - effect.value;
		hero.reputationInGroup.changed := hero.reputationInGroup.changed - effect.value;
		if hero.reputationInGroup.value < 0 then
			hero.reputationInGroup.value := 0;
		if hero.reputationInGroup.value = 0 then
			Exit(True);
		Exit(True);
	end;
	
	function DownReputationInGroupAnti(var antiHero: THero; effect: TEffect): Boolean;
	begin
		antiHero.reputationInGroup.value := antiHero.reputationInGroup.value - effect.value;
		antiHero.reputationInGroup.changed := antiHero.reputationInGroup.changed - effect.value;
		if antiHero.reputationInGroup.value < 0 then
			antiHero.reputationInGroup.value := 0;
		if antiHero.reputationInGroup.value = 0 then
			Exit(True);
		Exit(True);
	end;
	
	function UpReputationInUniversity(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.reputationInUnderworld.value := hero.reputationInUnderworld.value + effect.value;
		hero.reputationInUnderworld.changed := hero.reputationInGroup.changed + effect.value;
		if hero.reputationInUnderworld.value > 10 then
			hero.reputationInUnderworld.value := 10;
		if hero.reputationInUnderworld.value = 10 then
			Exit(True);
		Exit(True);
	end;
	
	function UpReputationInUniversityAnti(var antiHero: THero; effect: TEffect): Boolean;
	begin
		antiHero.reputationInUnderworld.value := antiHero.reputationInUnderworld.value + effect.value;
		antiHero.reputationInUnderworld.changed := antiHero.reputationInUnderworld.changed + effect.value;
		if antiHero.reputationInUnderworld.value > 10 then
			antiHero.reputationInUnderworld.value := 10;
		if antiHero.reputationInUnderworld.value = 10 then
			Exit(True);
		Exit(True);
	end;
	
	function DownReputationInUniversity(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.reputationInUnderworld.value := hero.reputationInUnderworld.value - effect.value;
		hero.reputationInUnderworld.changed := hero.reputationInUnderworld.changed - effect.value;
		if hero.reputationInUnderworld.value < 0 then
			hero.reputationInUnderworld.value := 0;
		if hero.reputationInUnderworld.value = 0 then
			Exit(True);
		Exit(True);
	end;
	
	function DownReputationInUniversityAnti(var antiHero: THero; effect: TEffect): Boolean;
	begin
		antiHero.reputationInUnderworld.value := antiHero.reputationInUnderworld.value - effect.value;
		antiHero.reputationInUnderworld.changed := antiHero.reputationInUnderworld.changed - effect.value;
		if antiHero.reputationInUnderworld.value < 0 then
			antiHero.reputationInUnderworld.value := 0;
		if antiHero.reputationInUnderworld.value = 0 then
			Exit(True);
		Exit(True);
	end;
	
	function Affect(var hero: THero; var antiHero: THero; effect: TEffect): Boolean;
	begin
		if effect.name = 'damage' then
			if not Damage(hero, effect) then
				Exit(False);
		if effect.name = 'damageAnti' then
			if not Damage(antiHero, effect) then
				Exit(False);
		if effect.name = 'heal' then
			if not Heal(hero, effect) then
				Exit(False);
		if effect.name = 'healAnti' then
			if not Heal(antiHero, effect) then
				Exit(False);
		if effect.name = 'boost' then
			if not Boost(hero, effect) then
				Exit(False);
		if effect.name = 'boostAnti' then
			if not Boost(antiHero, effect) then
				Exit(False);
		if effect.name = 'decrease' then
			if not Decrease(hero, effect) then
				Exit(False);
		if effect.name = 'decreaseAnti' then
			if not Decrease(antiHero, effect) then
				Exit(False);
		if effect.name = 'takeToDrink' then
			if not TakeToDrink(hero, effect) then
				Exit(False);
		if effect.name = 'takeToDrinkAnti' then
			if not TakeToDrink(antiHero, effect) then
				Exit(False);
		if effect.name = 'sober' then
			if not Sober(hero, effect) then
				Exit(False);
		if effect.name = 'soberAnti' then
			if not Sober(antiHero, effect) then
				Exit(False);
		if effect.name = 'pumpUp' then
			if not PumpUp(hero, effect) then
				Exit(False);
		if effect.name = 'pumpUpAnti' then
			if not PumpUp(antiHero, effect) then
				Exit(False);
		if effect.name = 'pumpDown' then
			if not PumpDown(hero, effect) then
				Exit(False);
		if effect.name = 'pumpDownAnti' then
			if not PumpDown(antiHero, effect) then
				Exit(False);
		if effect.name = 'reduceIntelligence' then
			if not ReduceIntelligence(hero, effect) then
				Exit(False);
		if effect.name = 'increaseIntelligence' then
			if not IncreaseIntelligence(hero, effect) then
				Exit(False);
		if effect.name = 'luckly' then
			if not Luckly(hero, effect) then
				Exit(False);
		if effect.name = 'luckless' then
			if not Luckless(hero, effect) then
				Exit(False);
		if effect.name = 'happiness' then
			if not Happiness(hero, effect) then
				Exit(False);
		if effect.name = 'happinessAnti' then
			if not Happiness(antiHero, effect) then
				Exit(False);
		if effect.name = 'misfortune' then
			if not Misfortune(hero, effect) then
				Exit(False);
		if effect.name = 'misfortuneAnti' then
			if not Misfortune(antiHero, effect) then
				Exit(False);
		if effect.name = 'tuning' then
			if not Tuning(hero, effect) then
				Exit(False);
		if effect.name = 'takeToVape' then
			if not TakeToVape(hero, effect) then
				Exit(False);
		if effect.name = 'inLove' then
			if not InLove(hero, effect) then
				Exit(False);
		if effect.name = 'lonely' then
			if not Lonely(hero, effect) then
				Exit(False);
		if effect.name = 'upReputationInGroup' then
			if not UpReputationInGroup(hero, effect) then
				Exit(False);
		if effect.name = 'upReputationInGroupAnti' then
			if not UpReputationInGroup(antiHero, effect) then
				Exit(False);
		if effect.name = 'downReputationInGroup' then
			if not DownReputationInGroup(hero, effect) then
				Exit(False);
		if effect.name = 'downReputationInGroupAnti' then
			if not DownReputationInGroup(antiHero, effect) then
				Exit(False);
		if effect.name = 'upReputationInUniversity' then
			if not UpReputationInUniversity(hero, effect) then
				Exit(False);
		if effect.name = 'upReputationInUniversityAnti' then
			if not UpReputationInUniversity(antiHero, effect) then
				Exit(False);
		if effect.name = 'downReputationInUniversity' then
			if not DownReputationInUniversity(hero, effect) then
				Exit(False);
		if effect.name = 'downReputationInUniversityAnti' then
			if not DownReputationInUniversity(antiHero, effect) then
				Exit(False);
		Exit(True);
	end;

	function Affect(var hero: THero; var antiHero: THero; effects: TEffects): Boolean;
	var
		I: Integer;
	begin
		// TODO: console output
		for I := 0 to Length(effects) - 1 do
			if not Affect(hero, antiHero, effects[I]) then
				Exit(False);
		Exit(True);
	end;
	
end.