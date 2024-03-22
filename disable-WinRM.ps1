#We need to run all these commands to completely disable the remoting through powershell om remote system

Disable-PSRemoting

#Delete Listener
dir WSMan:\localhost\Listener
Remove-Item -Path WSMan:\localhost\Listener\Listener* -Recurse

#Disable WinRM Service
Stop-Service WinRM -PassThru
Set-Service WinRM -StartupType Disabled -PassThru

#Disable the firewall exceptions
Set-NetFirewallRule -DisplayName "Windows Remote Management (HTTP-IN)" -Enabled False -PassThru
    | select -Property DisplayName, Profile, Enabled

#Modify LocalAccountTokenFilterPolicy token
Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System -Name LocalAccountTokenFilterPolicy -Value 0
