unit EndProgram;

interface
	uses
	{$IFDEF UNIX}
		unix,
	{$ENDIF}
		canvas,
		outputcolor;

	procedure ExitProgram(status: Integer);
	procedure ExitProgram(status: Integer; message: String);
	
implementation
	procedure ExitProgram(status: Integer);
	begin
		{$IFDEF UNIX}
		//Restore terminal settings
		fpSystem('tput rs1');
		{$ENDIF}
		Halt(status);
	end;
	
	procedure ExitProgram(status: Integer; message: String);
	begin
		CanvasClear();
		GotoXY(0,0);
		TextColor(4);
		WriteLn(message);
		WriteLn('Push Enter to exit...');
		ReadLn;
		ExitProgram(status);
	end;
end.
