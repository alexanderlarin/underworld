unit setlocale;

interface

procedure setlocale(cat : integer; p : pchar); cdecl; external name 'setlocale';

const
	LC_ALL = 6;

implementation
	
begin
	setlocale(LC_ALL, PChar(''));
end.
