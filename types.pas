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
		
		TCondition = record
			name: String;
			attribute: String;
			value: Integer;			
		end;
		
		TConditions = array of TCondition;
		
		TTransition = record
			name: String;
			conditions: TConditions;
			effects: TEffects;
			toLocation: String;
			toEvent: String;
		end;
		
		TTransitions = array of TTransition;
		
		TCommand = record
			name: String;
			text: String;
			cmd: String;
			transitions: TTransitions;
		end;
		
		TCommands = array of TCommand;
		
		TEvent = record
			name: String;
			text: String;
			commands: TCommands;
		end;
		
		TEvents = array of TEvent;
		
		TLocation = record
			name: String;
			events: TEvents;
		end;
		
		TLocations = array of TLocation;
implementation

end.