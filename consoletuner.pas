unit ConsoleTuner;
 
interface
 	uses
		{$IFDEF WINDOWS}
		windows;
		{$ENDIF}
	
	const
		LF_FACESIZE = 32;
		
	type
		CONSOLE_FONT_INFOEX = record
		cbSize     : ULONG;
		nFont      : DWORD;
		dwFontSize : COORD;
		FontFamily : UINT;
		FontWeight : UINT;
		FaceName   : array [0..LF_FACESIZE-1] of WCHAR;
	end;
	
	
	function SetLucidaConsoleFont(): Boolean;
implementation
	function SetCurrentConsoleFontEx(hConsoleOutput: HANDLE; bMaximumWindow: BOOL; var CONSOLE_FONT_INFOEX): BOOL; stdcall; external kernel32;
	
	function SetLucidaConsoleFont(): Boolean;
	var
		New_CONSOLE_FONT_INFOEX: CONSOLE_FONT_INFOEX;
	begin
		FillChar(New_CONSOLE_FONT_INFOEX, SizeOf(CONSOLE_FONT_INFOEX), 0);
		New_CONSOLE_FONT_INFOEX.cbSize := SizeOf(CONSOLE_FONT_INFOEX);
		//New_CONSOLE_FONT_INFOEX.FaceName := 'Consolas';
		New_CONSOLE_FONT_INFOEX.FaceName := 'Lucida Console';
		New_CONSOLE_FONT_INFOEX.dwFontSize.Y := 24;
		 
		SetCurrentConsoleFontEx(StdOutputHandle, False, New_CONSOLE_FONT_INFOEX);
		Exit(True);
	end;
end.