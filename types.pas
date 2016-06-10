unit Types;

interface
	uses
		outputcolor;
	type
		TColorString = record
			text: String;
			color: String;
		end;
		
		THero = record
			
			health: Integer;
			energy: Integer;
			alchohol: Integer;
			
			strength: Integer;
			intelligence: Integer;
			fortune: Integer;
			
			love: Integer;
			happy: Integer;
		
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
			name: TColorString;
			text: TColorString;
			cmd: String;
			transitions: TTransitions;
		end;
		
		TCommands = array of TCommand;
		
		TEvent = record
			name: TColorString;
			text: TColorString;
			commands: TCommands;
		end;
		
		TEvents = array of TEvent;
		
		TLocation = record
			name: TColorString;
			events: TEvents;
		end;
		
		TLocations = array of TLocation;
implementation

end.