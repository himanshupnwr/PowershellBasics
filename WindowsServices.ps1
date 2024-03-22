Get-Service

Get-Service | Select-Object -Property Name, Status

Get-Service -Name Winmgmt

Get-Service -Name Winmgmt | Select-Object *

Get-Service -Name 'vmi*' | Select-Object name, DisplayName | Format-Table

<# Get all services which are in running state and startup type is manual#>

Get-Service | Where-Object { ($_.Status -eq 'Running') -and ($_.StartType -eq 'Manual')} | Select-Object name, status, starttype

<# When running the script on remote machine use the computer name#>

Get-Service -computerName 'Computername' -Name Winmgmt

Get-Service -Name Spooler | Stop-Service

Set-Service -Name Spooler -StartupType Automatic -Description 'This is the new description'

Set-Service -Name Spooler -Status Running

<# Set credentials to run a service using a particular user account#>

$credentials = Get-Credential -Credential .\testuser
Set-Service -Name Spooler -Credential $credentials

sc.exe config "Spooler" obj=".\testuser" password="Powershell" type=own

Get-Service | Select-Object -Property Status, DisplayName | Group-Object -Property Status

Get-Service | Select-Object -Property Status, DisplayName -ExpandProperty Name | Group-Object -Property Status | Format-List

Get-Service | Select-Object -Property Status,Name | Get-Member

$wrm = Get-Service -Name WinRM
$wrm.Start()

Get-Service | Sort-Object ws -Descending