unit Conditions;

interface
	uses 
		types;

	function CheckCondition(hero: THero; antiHero: THero; condition: TCondition): Boolean;
	function CheckConditions(hero: THero; antiHero: THero; conditions: TConditions): Boolean;
	function ConditionStrengthMore(hero: THero; value: Integer): Boolean;
	function ConditionStrengthLess(hero: THero; value: Integer): Boolean;
	function ConditionStrengthEqual(hero: THero; value: Integer): Boolean;
	function ConditionStrengthAntiMore(hero: THero; antiHero: THero): Boolean;
	function ConditionHealthMore(hero: THero; value: Integer): Boolean;
	function ConditionHealthLess(hero: THero; value: Integer): Boolean;
	function ConditionHealthEqual(hero: THero; value: Integer): Boolean;
	

	
	
	
implementation
	function CheckCondition(hero: THero; antiHero: THero; condition: TCondition): Boolean;
	begin
		case condition.name of
		'StrengthMore': Exit(ConditionStrengthMore(hero, condition.value));
		'StrengthLess': Exit(ConditionStrengthLess(hero, condition.value));
		'StrengthEqual': Exit(ConditionStrengthEqual(hero, condition.value));
		'StrengthAntiMore': Exit(ConditionStrengthAntiMore(hero, antiHero));
		'HealthMore': Exit(ConditionHealthMore(hero, condition.value));
		'HealthLess': Exit(ConditionHealthLess(hero, condition.value));
		'HealthEqual': Exit(ConditionHealthEqual(hero, condition.value));
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
	
	function ConditionStrengthMore(hero: THero; value: Integer): Boolean;
	begin
		Exit(hero.strength > value);			
	end;
	
	function ConditionStrengthLess(hero: THero; value: Integer): Boolean;
	begin
		Exit(hero.strength < value);
	end;
	
	function ConditionStrengthEqual(hero: THero; value: Integer): Boolean;
	begin
		Exit(hero.strength = value);
	end;
	
	function ConditionStrengthAntiMore(hero: THero; antiHero: THero): Boolean;
	begin
		Exit(hero.strength > antiHero.strength);
	end;
	
	function ConditionStrengthAntiLess(hero: THero; antiHero: THero): Boolean;
	begin
		Exit(hero.strength < antiHero.strength);
	end;
	
	function ConditionStrengthAntiEqual(hero: THero; antiHero: THero): Boolean;
	begin
		Exit(hero.strength = antiHero.strength);
	end;
	
	function ConditionHealthMore(hero: THero; value: Integer): Boolean;
	begin
		Exit(hero.health > value);
	end;
	
	function ConditionHealthLess(hero: THero; value: Integer): Boolean;
	begin
		Exit(hero.health < value);
	end;
	
	function ConditionHealthEqual(hero: THero; value: Integer): Boolean;
	begin
		Exit(hero.health = value);
	end;
	
	function ConditionHealthAntiMore(hero: THero; antiHero: THero): Boolean;
	begin
		Exit(hero.health > antiHero.health);
	end;
	
	function ConditionHealthAntiLess(hero: THero; antiHero: THero): Boolean;
	begin
		Exit(hero.health < antiHero.health);
	end;
	
	function ConditionHealthAntiEqual(hero: THero; antiHero: THero): Boolean;
	begin
		Exit(hero.health = antiHero.health);
	end;
	
end.