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
	 
	function UpReputationInGroup(var hero: THero; effect: TEffect): Boolean;
	function DownReputationInGroup(var hero: THero; effect: TEffect): Boolean;
	function UpReputationInUniversity(var hero: THero; effect: TEffect): Boolean;
	function DownReputationInUniversity(var hero: THero; effect: TEffect): Boolean;

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
	
	function DamageAnti(var antiHero: THero; effect: TEffect): Boolean;
	begin
		antiHero.health := antiHero.health - effect.value;
		if antiHero.health < 0 then
			antiHero.health := 0;
		if antiHero.health = 0 then
			Exit(False);
		Exit(True);
	end;
	
	function Heal(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.health := hero.health + effect.value;
		if hero.health > 10 then
			hero.health := 10;
		if hero.health = 10 then
			Exit(True);
		Exit(True);
	end;
	
	function HealAnti(var antiHero: THero; effect: TEffect): Boolean;
	begin
		antiHero.health := antiHero.health + effect.value;
			antiHero.health := 10;
		if antiHero.health = 10 then
			Exit(True);
		Exit(True);
	end;

	function Boost(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.energy := hero.energy + effect.value;
		if hero.energy > 10 then
			hero.energy := 10;
		if hero.energy = 10 then
			Exit(True);
		Exit(True);
	end;
	
	function BoostAnti(var antiHero: THero; effect: TEffect): Boolean;
	begin
		antiHero.energy := antiHero.energy + effect.value;
		if antiHero.energy > 10 then
			antiHero.energy := 10;
		if antiHero.energy = 10 then
			Exit(True);
		Exit(True);
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
	
	function DecreaseAnti(var antiHero: THero; effect: TEffect): Boolean;
	begin
		antiHero.energy := antiHero.energy - effect.value;
		if antiHero.energy < 0 then
			antiHero.energy := 0;
		if antiHero.energy = 0 then
			Exit(False);
		Exit(True);
	end;
	
	function TakeToDrink(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.alchohol := hero.alchohol + effect.value;
		if hero.alchohol > 10 then
			hero.alchohol := 10;
		if hero.alchohol = 10 then
			Exit(True);
		Exit(True);
	end;
	
	function TakeToDrinkAnti(var antiHero: THero; effect: TEffect): Boolean;
	begin
		antiHero.alchohol := antiHero.alchohol + effect.value;
		if antiHero.alchohol > 10 then
			antiHero.alchohol := 10;
		if antiHero.alchohol = 10 then
			Exit(True);
		Exit(True);
	end;
	
	function Sober(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.alchohol := hero.alchohol - effect.value;
		if hero.alchohol < 0 then
			hero.alchohol := 0;
		if hero.alchohol = 0 then 
			Exit(True);
		Exit(True);
	end;
	
	function SoberAnti(var antiHero: THero; effect: TEffect): Boolean;
	begin
		antiHero.alchohol := antiHero.alchohol - effect.value;
		if antiHero.alchohol < 0 then
			antiHero.alchohol := 0;
		if antiHero.alchohol = 0 then 
			Exit(True);
		Exit(True);
	end;
	
	function PumpUp(var hero: THero; effect: TEffect): Boolean; 
	begin
		hero.strength := hero.strength + effect.value;
		if hero.strength > 10 then
			hero.strength := 10;
		if hero.strength = 10 then
			Exit(True);
		Exit(True);
	end;
	
	function PumpUpAnti(var antiHero: THero; effect: TEffect): Boolean; 
	begin
		antiHero.strength := antiHero.strength + effect.value;
		if antiHero.strength > 10 then
			antiHero.strength := 10;
		if antiHero.strength = 10 then
			Exit(True);
		Exit(True);
	end;
	
	function PumpDown(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.strength := hero.strength - effect.value;
		if hero.strength < 0 then
			hero.strength := 0;
		if hero.strength = 0 then
			Exit(True);
		Exit(True);
	end;
	
	function PumpDownAnti(var antiHero: THero; effect: TEffect): Boolean;
	begin
		antiHero.strength := antiHero.strength - effect.value;
		if antiHero.strength < 0 then
			antiHero.strength := 0;
		if antiHero.strength = 0 then
			Exit(True);
		Exit(True);
	end;
	
	function ReduceIntelligence(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.intelligence := hero.strength - effect.value;
		if hero.intelligence < 0 then
			hero.intelligence := 0;
		if hero.intelligence = 0 then
			Exit(True);
		Exit(True);
	end;
	
	function ReduceIntelligenceAnti(var antiHero: THero; effect: TEffect): Boolean;
	begin
		antiHero.intelligence := antiHero.strength - effect.value;
		if antiHero.intelligence < 0 then
			antiHero.intelligence := 0;
		if antiHero.intelligence = 0 then
			Exit(True);
		Exit(True);
	end;
	
	function IncreaseIntelligence(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.intelligence := hero.strength + effect.value;
		if hero.intelligence > 10 then
			hero.intelligence := 10;
		if hero.intelligence = 10 then
			Exit(True);
		Exit(True);
	end;
	
	function IncreaseIntelligenceAnti(var antiHero: THero; effect: TEffect): Boolean;
	begin
		antiHero.intelligence := antiHero.strength + effect.value;
		if antiHero.intelligence > 10 then
			antiHero.intelligence := 10;
		if antiHero.intelligence = 10 then
			Exit(True);
		Exit(True);
	end;
	
	
	function Luckly(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.fortune := hero.fortune + effect.value;
		if hero.fortune > 10 then
			hero.fortune := 10;
		if hero.fortune = 10 then
			Exit(True);
		Exit(True);
	end;
	
	function LucklyAnti(var antiHero: THero; effect: TEffect): Boolean;
	begin
		antiHero.fortune := antiHero.fortune + effect.value;
		if antiHero.fortune > 10 then
			antiHero.fortune := 10;
		if antiHero.fortune = 10 then
			Exit(True);
		Exit(True);
	end;
	
	function Luckless(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.fortune := hero.fortune - effect.value;
		if hero.fortune < 0 then
			hero.fortune := 0;
		if hero.fortune = 0 then
			Exit(True);
		Exit(True);
	end;
	
	function LucklessAnti(var antiHero: THero; effect: TEffect): Boolean;
	begin
		antiHero.fortune := antiHero.fortune - effect.value;
		if antiHero.fortune < 0 then
			antiHero.fortune := 0;
		if antiHero.fortune = 0 then
			Exit(True);
		Exit(True);
	end;
	
	function Lonely(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.love := hero.love - effect.value;
		if hero.love < 0 then
			hero.love := 0;
		if hero.love = 0 then
			Exit(True);
		Exit(True);
	end;
	
	function LonelyAnti(var antiHero: THero; effect: TEffect): Boolean;
	begin
		antiHero.love := antiHero.love - effect.value;
		if antiHero.love < 0 then
			antiHero.love := 0;
		if antiHero.love = 0 then
			Exit(True);
		Exit(True);
	end;
	
	function InLove(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.love := hero.love + effect.value;
		if hero.love < 0 then
			hero.love := 0;
		if hero.love = 0 then
			Exit(True);
		Exit(True);
	end;
	
	function InLoveAnti(var antiHero: THero; effect: TEffect): Boolean;
	begin
		antiHero.love := antiHero.love + effect.value;
		if antiHero.love < 0 then
			antiHero.love := 0;
		if antiHero.love = 0 then
			Exit(True);
		Exit(True);
	end;
	
  function Happiness(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.happy := hero.happy + effect.value;
		if hero.happy < 0 then
			hero.happy := 0;
		if hero.happy = 0 then
			Exit(True);
		Exit(True);
	end;
	
	function HappinessAnti(var antiHero: THero; effect: TEffect): Boolean;
	begin
		antiHero.happy := antiHero.happy + effect.value;
		if antiHero.happy < 0 then
			antiHero.happy := 0;
		if antiHero.happy = 0 then
			Exit(True);
		Exit(True);
	end;
	
	function Misfortune(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.happy := hero.happy - effect.value;
		if hero.happy < 0 then
			hero.happy := 0;
		if hero.happy = 0 then
			Exit(True);
		Exit(True);
	end;
	
	function MisfortuneAnti(var antiHero: THero; effect: TEffect): Boolean;
	begin
		antiHero.happy := antiHero.happy - effect.value;
		if antiHero.happy < 0 then
			antiHero.happy := 0;
		if antiHero.happy = 0 then
			Exit(True);
		Exit(True);
	end;
	
	function UpReputationInGroup(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.reputationInGroup := hero.reputationInGroup + effect.value;
		if hero.reputationInGroup > 10 then
			hero.reputationInGroup := 10;
		if hero.reputationInGroup = 10 then
			Exit(True);
		Exit(True);
	end;
	
	function UpReputationInGroupAnti(var antiHero: THero; effect: TEffect): Boolean;
	begin
		antiHero.reputationInGroup := antiHero.reputationInGroup + effect.value;
		if antiHero.reputationInGroup > 10 then
			antiHero.reputationInGroup := 10;
		if antiHero.reputationInGroup = 10 then
			Exit(True);
		Exit(True);
	end;
	
	function DownReputationInGroup(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.reputationInGroup := hero.reputationInGroup - effect.value;
		if hero.reputationInGroup < 0 then
			hero.reputationInGroup := 0;
		if hero.reputationInGroup = 0 then
			Exit(True);
		Exit(True);
	end;
	
	function DownReputationInGroupAnti(var antiHero: THero; effect: TEffect): Boolean;
	begin
		antiHero.reputationInGroup := antiHero.reputationInGroup - effect.value;
		if antiHero.reputationInGroup < 0 then
			antiHero.reputationInGroup := 0;
		if antiHero.reputationInGroup = 0 then
			Exit(True);
		Exit(True);
	end;
	
	function UpReputationInUniversity(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.reputationInUnderworld := hero.reputationInUnderworld + effect.value;
		if hero.reputationInUnderworld > 10 then
			hero.reputationInUnderworld := 10;
		if hero.reputationInUnderworld = 10 then
			Exit(True);
		Exit(True);
	end;
	
	function UpReputationInUniversityAnti(var antiHero: THero; effect: TEffect): Boolean;
	begin
		antiHero.reputationInUnderworld := antiHero.reputationInUnderworld + effect.value;
		if antiHero.reputationInUnderworld > 10 then
			antiHero.reputationInUnderworld := 10;
		if antiHero.reputationInUnderworld = 10 then
			Exit(True);
		Exit(True);
	end;
	
	function DownReputationInUniversity(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.reputationInUnderworld := hero.reputationInUnderworld - effect.value;
		if hero.reputationInUnderworld < 0 then
			hero.reputationInUnderworld := 0;
		if hero.reputationInUnderworld = 0 then
			Exit(True);
		Exit(True);
	end;
	
	function DownReputationInUniversityAnti(var antiHero: THero; effect: TEffect): Boolean;
	begin
		antiHero.reputationInUnderworld := antiHero.reputationInUnderworld - effect.value;
		if antiHero.reputationInUnderworld < 0 then
			antiHero.reputationInUnderworld := 0;
		if antiHero.reputationInUnderworld = 0 then
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
		if effect.name = 'reduceIntelligenceAnti' then
			if not ReduceIntelligence(antiHero, effect) then
				Exit(False);
		if effect.name = 'inreaseIntelligence' then
			if not IncreaseIntelligence(hero, effect) then
				Exit(False);
		if effect.name = 'inreaseIntelligenceAnti' then
			if not IncreaseIntelligence(antiHero, effect) then
				Exit(False);
		if effect.name = 'luckly' then
			if not Luckly(hero, effect) then
				Exit(False);
		if effect.name = 'lucklyAnti' then
			if not Luckly(antiHero, effect) then
				Exit(False);
		if effect.name = 'luckless' then
			if not Luckless(hero, effect) then
				Exit(False);
		if effect.name = 'lucklessAnti' then
			if not Luckless(antiHero, effect) then
				Exit(False);
		if effect.name = 'happiness' then
			if not Damage(hero, effect) then
				Exit(False);
		if effect.name = 'happinessAnti' then
			if not Damage(antiHero, effect) then
				Exit(False);
		if effect.name = 'misfortune' then
			if not Damage(hero, effect) then
				Exit(False);
		if effect.name = 'misfortuneAnti' then
			if not Damage(antiHero, effect) then
				Exit(False);
		if effect.name = 'inLove' then
			if not Damage(hero, effect) then
				Exit(False);
		if effect.name = 'inLoveAnti' then
			if not Damage(antiHero, effect) then
				Exit(False);
		if effect.name = 'lonely' then
			if not Damage(hero, effect) then
				Exit(False);
		if effect.name = 'lonelyAnti' then
			if not Damage(antiHero, effect) then
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