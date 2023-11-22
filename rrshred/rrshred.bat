@echo off

IF "%1" EQU "" goto paramerr

SET RLST=%TEMP%\%RANDOM%.%RANDOM%

rr -m %1 -v >%RLST%

FOR /F "tokens=5,5 delims= " %%i in (%RLST%) do (

	shred -n 3 -z %%i
	del %%i

)

::remove list of files
shred -n 3 -z %RLST%
del %RLST%
exit /b

:paramerr
echo First parameter must be file name or file mask!
echo e.g. rrshred.bat *.txt
echo e.g. rrshred.bat text.txt