unit Effects;

interface
	uses
		types;
	function Affect(var hero: THero; effect: TEffect): Boolean;
	function Affect(var hero: THero; effects: TEffects): Boolean;
	
	function Damage(var hero: THero; effect: TEffect): Boolean;

implementation
	function Damage(var hero: THero; effect: TEffect): Boolean;
	begin
		hero.Health := hero.Health - effect.value;
		if hero.Health < 0 then
			hero.Health = 0;
		if hero.Health = 0 then
			Exit(False);
		Exit(True);
	end;

	function Affect(var hero: THero; effect: TEffect): Boolean;
	begin
		if effect.name = 'damage' then
			if not Damage(hero, effect) then
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