unit Types;

interface
	uses
		outputcolor;
	type
		TColorString = record
			text: String;
			color: String;
		end;
		
		TMultiLineColorText = array of TColorString;
		
		TStat = record
			value: Integer;
			changed: Integer;
		end;
		
		THero = record
			
			health: TStat;
			energy: TStat;
			alchohol: TStat;
			tune: TStat;
			vape: TStat;
			
			strength: TStat;
			intelligence: TStat;
			fortune: TStat;
			
			love: TStat;
			happy: TStat;
		
			ReputationInGroup: TStat;
			ReputationInUnderworld: TStat;	
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
			text: TColorString;
			texts: TMultiLineColorText;
			isMultiLine: Boolean;
		end;
		
		TConditions = array of TCondition;
		
		TTransition = record
			name: String;
			text: TColorString;
			texts: TMultiLineColorText;
			isMultiLine: Boolean;
			conditions: TConditions;
			effects: TEffects;
			toLocation: String;
			toEvent: String;
		end;
		
		TTransitions = array of TTransition;
		
		TCommand = record
			name: TColorString;
			text: TColorString;
			texts: TMultiLineColorText;
 			isMultiLine: Boolean;
			cmd: String;
			conditions: TConditions;
			transitions: TTransitions;
		end;
		
		TCommands = array of TCommand;
		
		TEvent = record
			name: TColorString;
			text: TColorString;
			texts: TMultiLineColorText;
 			isMultiLine: Boolean;
			commands: TCommands;
		end;
		
		TEvents = array of TEvent;
		
		TLocation = record
			name: TColorString;
			events: TEvents;
		end;
		
		TLocations = array of TLocation;
		
		TStory = String;
		
		TStories = array of TStory;
		
		TPosition = record
			location: TLocation;
			event: TEvent;
		end;
		
		TStatus = record
			hero: THero;
			antiHero: THero;
			currentPosition: TPosition;
		end;
implementation

end.