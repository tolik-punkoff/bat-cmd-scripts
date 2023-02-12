@echo off
Setlocal EnableDelayedExpansion

set RLST=%TEMP%\%RANDOM%.%RANDOM%

shred -n 3 -z -v %1 2>%RLST% 

FOR /F "tokens=2,5 delims=: " %%i in (%RLST%) do (
	IF "%%j" EQU "(000000)..." (

		set TMPNAME=%RANDOM%.%RANDOM%

		ren %%i !TMPNAME!
		del !TMPNAME!
	)
)

Setlocal DisableDelayedExpansion
::remove list of files
shred -n 3 -z %RLST%
del %RLST%