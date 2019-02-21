SET NETADDR=\\PXE\unatdistr                                                          
SET NETDRIVE=Z
SET INSTALLPATH=\os\winxp\
SET UNATTEND=W:\scripts\unattend.txt
SET SYSDRIVE=D

if exist %NETDRIVE%:%INSTALLPATH%i386\winnt32.exe goto INSTALL

net use %NETDRIVE%: %NETADDR%
sleep 5

:INSTALL
	%NETDRIVE%:
	cd %INSTALLPATH%
	i386\winnt32.exe /s:%NETDRIVE%:%INSTALLPATH%i386 /syspart:%SYSDRIVE% /tempdrive:%SYSDRIVE% /unattend:%UNATTEND%
	pause