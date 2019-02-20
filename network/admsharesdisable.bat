@echo off
Setlocal EnableDelayedExpansion

for /F %%i In ('net share') do (

	set ITEM=%%i
	call :check !ITEM!

)

goto :eof

:check

	set V1=%1
	set V2=%V1:$=%

	if NOT %V1%==%V2% (
		echo %V1%
		net share %V1% /delete
	)

:eof
