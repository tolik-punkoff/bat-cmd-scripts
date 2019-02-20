@Echo Off
Setlocal EnableDelayedExpansion
Set P="C:\Program Files\qemu\qemu-system-i386.exe"
For %%A In (%*) Do SET P=!P! %%~A

start "QEMU"/B %P%