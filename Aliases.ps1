#Aliases

Get-Alias

Get-Alias -name *a

Test-Path $profile

New-Item -path $profile -ItemType file -force

Get-Variable profile | Format-List

Set-Alias listit GetChildren

Get-Alias | fl | more

Get-Command -noun alias

Get-PSProvider

Import-Module activedirectory

Import-Module sqlps #sql server powershell provider

Set-Location ad:

Set-Location C:

Get-PSDrive

Get-Command -name item

#Object Members

Get-Service -name winrm | get-member #get member type and properties

Get-Process | Get-Member

Get-Process -name spooler

Get-Service -DisplayName "print spooler"

$s = Get-Service -name spooler
$s
$s.Start()
$s.Refresh()

Set-Alias showme Get-ChildItem
showme

$services = Get-Service RemoteRegistry, EventLog
foreach($service in $services) 
{
    $filter = "Name = '$($service.Name)'" 
    Get-WmiObject -Class win32_service -Filter $filter
}

$admins = Get-LocalGroupMember administrators
foreach($admin in $admins)
{
    Get-LocalUser -SID $admin.SID
}

Get-Help Get-LocalUser -Examples

$admins = Get-LocalGroupMember administrators | Select-Object Name, SID
$admins
foreach($admin in $admins)
{
    Get-LocalUser -SID $admin.SID
}
