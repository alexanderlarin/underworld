unit Types;

interface
	type
		THero = record
			depth: Integer;
			
			Health: Integer;
			Energy: Integer;
			Alchohol: Integer;
			
			Strength: Integer;
			Agility: Integer;
			Intelligence: Integer;
			Fortune: Integer;
		
			ReputationInGroup: Integer;
			ReputationInUnderworld: Integer;	
		end;
		
		TEffect = record
			name: String;
			text: String;
			value: Integer;
		end;
		
		TEffects = array of TEffect;
		
		TCommand = record
			name: String;
			text: String;
			cmd: String;
			effects: TEffects;
			toEvent: String;
		end;
		
		TCommands = array of TCommand;
		
		TEvent = record
			name: String;
			text: String;
			commands: TCommands;
		end;
		
		TEvents = array of TEvent;
implementation

end.