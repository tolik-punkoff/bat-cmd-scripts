@Echo Off
SetLocal EnableExtensions EnableDelayedExpansion

Set "String1=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
Set "String2=132 sd72 362 232 83827 3n238237"
Set "String3=1 >>>32 lnsdfn lskd &&&&&     _----__\\\\|||sd72 *&&&@@######~~~~~362 232 83827 3n238237"
Set "String4=A"
Set "String5=%%1"

call:strLen "%String1%"
echo Length String 1 - [%strLen%]
call:strLen "%String2%"
echo Length String 2 - [%strLen%]
call:strLen "%String3%"
echo Length String 3 - [%strLen%]
call:strLen "%String4%"
echo Length String 4 - [%strLen%]
call:strLen "%String5%"
echo Length String 5 (Command Line Parameter) - [%strLen%]

endlocal
pause
exit /b 0

::Start Strlen function
:Strlen 
	SetLocal EnableExtensions EnableDelayedExpansion
	Set Out=%~0
	Set "param=%~1"
	Set "str=A!param!"
	echo %str%
	Set "len=0"
        for /l %%a in (30,-1,0) do (
        	set /a "len|=1<<%%a"
				
        	for %%b in (!len!) do if "!str:~%%b,1!"=="" set /a "len&=~1<<%%a"
    )
endlocal & set %Out:~1%=%len%
exit /b 0 