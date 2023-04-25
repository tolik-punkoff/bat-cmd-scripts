@Echo Off
:: WARNING! SLOW ALGORITHM FOR STRING LENGTHIN
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
	Set "len=0"

	for /L %%a in (0,1,9000) do (
			if "!param:~%%a,1!" NEQ "" (
				Set /a "len+=1"
			) else goto :_break
		)
	:_break
	
endlocal & set %Out:~1%=%len%
exit /b 0
 