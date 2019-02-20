@Echo Off
Setlocal EnableDelayedExpansion
Set P=
For %%A In (%*) Do SET P=!P! %%~A

echo %P%