SET NETADDR=\\PXE\win7                                                          
SET NETDRIVE=Z

if exist %NETDRIVE%:\sources\setup.exe goto INSTALL

net use %NETDRIVE%: %NETADDR%
sleep 5

:INSTALL
	%NETDRIVE%:
	cd \sources
	setup.exe
	pause