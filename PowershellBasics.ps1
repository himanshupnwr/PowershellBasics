Get-Command -Verb Get -Noun *DNS*

help -Name Get-Command -Detailed

Get-Help -Name *DNS*

Help about* | more

Get-Service -Name P* -RequiredServices

Get-Service P* -Req

Get-Alias -Name Get-S*

Get-Alias -Name G* | Format-Table Name, Definition

Get-Alias -Definition *Service*

Get-NetIPAddress | Format-Table

Get-Service | Where-Object Status -EQ "Stopped" | Start-Service

Get-Command -Verb Get -Noun *DNS*

(Get-Service | Where-Object Status -EQ "Stopped" | Select-Object Name, Status).count

Get-Variable -Name P*

Get-ChildItem ENV: | more #Get all env variables from the system

Write-Output "The name of the computer is $ENV:COMPUTERNAME"

Write-Output The name of the computer is $ENV:COMPUTERNAME | Get-Member

$credential = Get-Credential

$credential | Get-Member

Get-Command -Name get-*Fire*

help Get-NetFirewallRule -Examples

Get-NetFirewallRule -Name *RemoteDesktop* | Format-Table #FT is Format-Table

Get-NetFirewallRule -Name *RemoteDesktop*
    | Set-NetFirewallRule -Enabled 'True' -Whatif # whatif will tell what this command did when it ran

Get-Command | Where-Object {$_.Definition -Like "*Whatif*"}

get-module -ListAvailable | Select-Object -Property name

Get-Module -ListAvailable | Select-Object -Property Name | ConvertTo-Xml | Out-File module.html

Import-Module -Name ActiveDirectory | Get-Member

Get-Module -name activedirectory | Get-Member

Get-ChildItem ENV:

Get-Module -ListAvailable
