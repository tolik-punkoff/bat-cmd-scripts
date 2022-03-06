@echo off

if "%~1" EQU "" (
	echo No arguments. Use  "%~n0%~x0  <filename> <size> [K|M]"
	exit /b 1
)

if "%~1" EQU "/?" (
	echo Use  "%~n0%~x0  <filename> <size> [K|M]"
	exit /b 1
)

if "%~1" EQU "%~n1%~x1" (
	set FILENAME=%CD%\%~1
) else (
	set FILENAME=%~1
)

set FILESIZE=%~2
set ED=%~3

set /a "RES=FILESIZE+1-1"
if %RES% LEQ 0 (
	echo Can't create file with size %RES%
	exit /b 2
)

if "%ED%" EQU "G" goto :gb
if "%ED%" EQU "K" goto :kb
if "%ED%" EQU "M" goto :mb
if "%ED%" EQU "g" goto :gb
if "%ED%" EQU "k" goto :kb
if "%ED%" EQU "m" goto :mb
goto :create

:kb
	set /a "RES=FILESIZE*1024"
	set ST=%FILESIZE% Kb
	goto :create

:mb
	set /a "RES=FILESIZE*1024*1024"
	set ST=%FILESIZE% Mb
	goto :create

:gb
	set /a "RES=FILESIZE*1024*1024*1024"
	set ST=%FILESIZE% Mb	
	
:create
	echo Creating file:	%FILENAME%
	if "%ST%" EQU "" (
		echo Size:		%RES% bytes		
	) else (
		echo Size:		%ST% [%RES% bytes]
	)
	
	wsudo fsutil file createnew "%FILENAME%" %RES%