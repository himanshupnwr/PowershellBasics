# Managing PowerShell Sessions

# All commands available for -PSSession

get-command -Name *-PSSession

#Create a PSSession
$ComputerName = "DC01"
$credential = Get-Credential

# Create a new Session
New-PSSession -ComputerName $ComputerName -Credential $credential -Name DC01-Session

# View Avaialbel Sessions
Get-PSSession

# Enter a Session
Enter-PSSession -Name DC01-Session

Disconnect-PSSession -Name DC01-Session

Connect-PSSession -Name DC01-session

Enter-PSSession -Name DC01-Session

# Remove A Session
Get-PSSession

Remove-PSSession -id 17

# View Sessions
Get-PSSession

#Import commands from a remote system
$ComputerName = "DC01"
$credential = Get-Credential
$NewSession = New-PSSession -ComputerName $ComputerName -Credential $credential -Name DC01-Import

Get-PSSession

# Use Import-Session to access scripts, cmdlets, and functions on a remote system

Import-PSSession -Session $NewSession -CommandName Get-ADUSer -FormatTypeName *

Get-Command -Name Get-ADUSer

Get-ADUser -Identity psuser | format-list

# Import Module

Invoke-Command -Session $NewSession {Import-Module -Name ActiveDirectory}

Import-PSSession -Session $NewSession -Module ActiveDirectory

# Note Temporary Name of module
Get-command -Name Get-
