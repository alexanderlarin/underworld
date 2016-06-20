unit Conditions;

interface
	uses 
		types;

	function CheckCondition(hero: THero; antiHero: THero; condition: TCondition): Boolean;
	function CheckConditions(hero: THero; antiHero: THero; conditions: TConditions): Boolean;
	function ConditionReputationInGroupMore(hero: THero; value: Integer): Boolean;
	function ConditionReputationInGroupLess(hero: THero; value: Integer): Boolean;
	function ConditionReputationInUniversityMore(hero: THero; value: Integer): Boolean;
	function ConditionReputationInUniversityLess(hero: THero; value: Integer): Boolean;
	function ConditionVapeMore(hero: THero; value: Integer): Boolean;
	function ConditionVapeLess(hero: THero; value: Integer): Boolean;
	function ConditionHappyMore(hero: THero; value: Integer): Boolean;
	function ConditionHappyLess(hero: THero; value: Integer): Boolean;
	function ConditionTuningMore(hero: THero; value: Integer): Boolean;
	function ConditionInLoveMore(hero: THero; value: Integer): Boolean;
	function ConditionInLoveLess(hero: THero; value: Integer): Boolean;
	function ConditionFortuneMore(hero: THero; value: Integer): Boolean;
	function ConditionFortuneLess(hero: THero; value: Integer): Boolean;
	function ConditionIntelligenceMore(hero: THero; value: Integer): Boolean;
	function ConditionIntelligenceLess(hero: THero; value: Integer): Boolean;
	function ConditionStrengthMore(hero: THero; value: Integer): Boolean;
	function ConditionStrengthLess(hero: THero; value: Integer): Boolean;
	function ConditionStrengthAntiMore(hero: THero; antiHero: THero): Boolean;
	function ConditionStrengthAntiLess(hero: THero; antiHero: THero): Boolean;
	function ConditionAlchoholMore(hero: THero; value: Integer): Boolean;
	function ConditionAlchoholLess(hero: THero; value: Integer): Boolean;
	function ConditionHealthMore(hero: THero; value: Integer): Boolean;
	function ConditionHealthLess(hero: THero; value: Integer): Boolean;
	function ConditionHealthAntiLess(antiHero: THero; value: Integer): Boolean;

implementation
	function CheckCondition(hero: THero; antiHero: THero; condition: TCondition): Boolean;
	begin
		case condition.name of
		'ReputationInGroupMore': Exit(ConditionReputationInGroupMore(hero, condition.value));
		'ReputationInGroupLess': Exit(ConditionReputationInGroupLess(hero, condition.value));
		'ReputationInUniversityMore': Exit(ConditionReputationInUniversityMore(hero, condition.value));
		'ReputationInUniversityLess': Exit(ConditionReputationInUniversityLess(hero, condition.value));
		'VapeMore': Exit(ConditionVapeMore(hero, condition.value));
		'VapeLess': Exit(ConditionVapeLess(hero, condition.value));
		'HappyMore': Exit(ConditionHappyMore(hero, condition.value));
		'HappyLess': Exit(ConditionHappyLess(hero, condition.value));
		'TuningMore': Exit(ConditionTuningMore(hero, condition.value));
		'InLoveMore': Exit(ConditionInLoveMore(hero, condition.value));
		'InLoveLess': Exit(ConditionInLoveLess(hero, condition.value));
		'IntelligenceMore': Exit(ConditionIntelligenceMore(hero, condition.value));
		'IntelligenceLess': Exit(ConditionIntelligenceLess(hero, condition.value));
		'FortuneMore':Exit(ConditionFortuneMore(hero, condition.value));
		'FortuneLess':Exit(ConditionFortuneLess(hero, condition.value));
		'StrengthMore': Exit(ConditionStrengthMore(hero, condition.value));
		'StrengthLess': Exit(ConditionStrengthLess(hero, condition.value));
		'StrengthAntiMore': Exit(ConditionStrengthAntiMore(hero, antiHero));
		'StrengthAntiLess': Exit(ConditionStrengthAntiLess(hero, antiHero));
		'AlchoholMore': Exit(ConditionAlchoholMore(hero, condition.value));
		'AlchoholLess': Exit(ConditionAlchoholLess(hero, condition.value));
		'HealthMore': Exit(ConditionHealthMore(hero, condition.value));
		'HealthLess': Exit(ConditionHealthLess(hero, condition.value));
		'HealthAntiLess': Exit( ConditionHealthAntiLess(antiHero, condition.value));
		end;
		Exit(True);
	end;
	
	function CheckConditions(hero: THero; antiHero: THero; conditions: TConditions): Boolean;
	var 
		I: Integer;
	begin
		for I := 0 to Length(conditions) - 1 do
		begin
			if (not CheckCondition(hero, antiHero, conditions[I])) then
				Exit(False);
		end;
		Exit(True);
	end;
	
	function ConditionReputationInGroupMore(hero: THero; value: Integer): Boolean;
	begin
		Exit(hero.ReputationInGroup.value >= value);			
	end;
	
		function ConditionReputationInGroupLess(hero: THero; value: Integer): Boolean;
	begin
		Exit(hero.ReputationInGroup.value < value);			
	end;
	
	function ConditionReputationInUniversityMore(hero: THero; value: Integer): Boolean;
	begin
		Exit(hero.ReputationInUnderworld.value >= value);			
	end;
	
	function ConditionReputationInUniversityLess(hero: THero; value: Integer): Boolean;
	begin
		Exit(hero.ReputationInUnderworld.value < value);			
	end;
	
	function ConditionVapeMore(hero: THero; value: Integer): Boolean;
	begin
		Exit(hero.vape.value >= value);			
	end;
	
	function ConditionVapeLess(hero: THero; value: Integer): Boolean;
	begin
		Exit(hero.vape.value < value);			
	end;
	
	function ConditionHappyMore(hero: THero; value: Integer): Boolean;
	begin
		Exit(hero.happy.value >= value);			
	end;
	
	function ConditionHappyLess(hero: THero; value: Integer): Boolean;
	begin
		Exit(hero.happy.value < value);			
	end;
	
	function ConditionTuningMore(hero: THero; value: Integer): Boolean;
	begin
		Exit(hero.tune.value > value);			
	end;
	
	function ConditionInLoveLess(hero: THero; value: Integer): Boolean;
	begin
		Exit(hero.love.value < value);			
	end;
	
	function ConditionInLoveMore(hero: THero; value: Integer): Boolean;
	begin
		Exit(hero.love.value >= value);			
	end;
	
	function ConditionFortuneMore(hero: THero; value: Integer): Boolean;
	begin
		Exit(hero.fortune.value >= value);			
	end;
	
	function ConditionFortuneLess(hero: THero; value: Integer): Boolean;
	begin
		Exit(hero.fortune.value < value);			
	end;
	
	function ConditionIntelligenceMore(hero: THero; value: Integer): Boolean;
	begin
		Exit(hero.intelligence.value >= value);			
	end;
	
	function ConditionIntelligenceLess(hero: THero; value: Integer): Boolean;
	begin
		Exit(hero.intelligence.value < value);			
	end;
	
	function ConditionStrengthMore(hero: THero; value: Integer): Boolean;
	begin
		Exit(hero.strength.value >= value);			
	end;
	
	function ConditionStrengthLess(hero: THero; value: Integer): Boolean;
	begin
		Exit(hero.strength.value < value);
	end;
	
	
	function ConditionStrengthAntiMore(hero: THero; antiHero: THero): Boolean;
	begin
		Exit(hero.strength.value >= antiHero.strength.value);
	end;
	
	function ConditionStrengthAntiLess(hero: THero; antiHero: THero): Boolean;
	begin
		Exit(hero.strength.value < antiHero.strength.value);
	end;
	
	function ConditionAlchoholMore(hero: THero; value: Integer): Boolean;
	begin
		Exit(hero.alchohol.value >= value);			
	end;
	
	function ConditionAlchoholLess(hero: THero; value: Integer): Boolean;
	begin
		Exit(hero.alchohol.value < value);			
	end;
	
	function ConditionHealthMore(hero: THero; value: Integer): Boolean;
	begin
		Exit(hero.health.value > value);
	end;
	
	function ConditionHealthLess(hero: THero; value: Integer): Boolean;
	begin
		Exit(hero.health.value <= value);
	end;
	
	function ConditionHealthAntiLess(antiHero: THero; value: Integer): Boolean;
	begin
		Exit(antiHero.health.value <= value);
	end;

end.