#suppose there is remote server host named nomad01

ping nomad01

Enter-PSSession -ComputerName nomad01

Enter-PSSession -ComputerName nomad01 -Credential

Exit-PSSession

$nomad1 = New-PSSession -ComputerName nomad01

Get-PSSession

Enter-PSSession -id 1 #1 is session id

Exit-PSSession

Get-PSSession 

Disconnect-PSSession -id 1

Get-WmiObject -ComputerName serv1, serv2 -class win32_bios

Invoke-Command -ComputerName serv1, serv2, -ScriptBlock { Get-EventLog -LogName Security -Newest 5}

Invoke-Command -ComputerName (Get-Content -Path C:\server.txt) -FilePath C:\script.ps1

Connect-WSMan

Get-PSProvider

cd WSMan:\localhost

dir

PS WSMAN:\localhost\client> dir .\trustedhosts #populate the trusted host list

PS WSMAN:\localhost\client> Set-Item .\trustedhosts -value .\Nonmad1 #add nomad1 to trustedhosts

#To set firewall rule
Set-NetFirewallRule -Name "WINRM-HTTP-IN-TCP-PUBLIC" -RemoteAddress Any

Invoke-Command -ComputerName Dc01 -ScriptBlock {Get-Service}

#if i want to run the command on the server but wants to get the result generated in client machine file
Get-Process | Out-File \\localmachine\c$\mem-process.txt

# Windows PowerShell Remoting Options
# Demo: Remoting without Configuration
# Note: Only a subset of PowerShell cmdlets do not support -computername

#Help

help -Name about_Remote

# open Windows PowerShell as Administrator

Start-Process PowerShell -Verb runAs 

# View commands with -computername that don't use WinRM or create a session
Get-Command | Where-Object {$_.parameters.keys -contains "ComputerName" -and $_.parameters.keys -notcontains "Session"}

# Event logs
# Get-EventLog has been deprecated in powershell 7 and the replacement is Get-WinEvent. Get-EventLog works in windows powershell
Get-EventLog -ComputerName LocalHost -LogName Security -InstanceId 4624,4625 -Newest 5 | 
format-table -Property MachineName,Time,InstanceId,Message

Windows PowerShell Remoting Options
# Demo: Remoting with Invoke-Command
# Run these commands in Windows PowerShell console as Administrator 
    
# Help with Invoke-Command
help Invoke-command

# Variable for -ComputerName value
$ComputerName = "DC01, Localhost"
$Name = "*win*"

# Running get-service on remote system
Invoke-command -ComputerName $computername -ScriptBlock { get-service -Name $Name | format-table DisplayName,Status,Name }
    #Note: This fails since you cannot pass variables to remote systems

# Passing variable to remote system with Using:
invoke-command -ComputerName $computername -ScriptBlock { get-service -Name $using:Name | format-table DisplayName,Status,Name }

# More Information on $using in help
help about_Remote_Variables

# Adding remote computer data to variable
$data =  invoke-command -ComputerName $computername -ScriptBlock { get-service -Name $using:Name }
$data | get-member
# Note: Objects are deserialized - Due to XML conversion, many methods are removed. Properties of object generally remain intact.

$data | where-object -Property status -Eq "Stopped" | select-object -Property DisplayName,status,machinename

# Running Remote Commands
$ADUser = "psuser"

invoke-command -ComputerName $computername -ScriptBlock { Get-ADUser -Identity $using:ADuser | format-list }
# Because DC01 is a domain controller and has the ADDS tools installed, you can run any of the cmdlets installed.

Invoke-Command -FilePath .\get-helpdeskdata.ps1 -ComputerName DC01,client01

# Windows PowerShell Remoting Options
# Demo: Running commands “locally” with Enter-PSSession
# Help resources for Remote Sessions

help about_PSSessions

help Enter-PSSession

# Set Demo Variable for remote computer

$ComputerName = "DC01"

# Interactive remote session
$localComputer = "localhost"
Enter-PSSession -ComputerName $localComputer

    # Commands on Remote System
        Get-ComputerInfo -Property CsName,CSProcessors,CsTotalPhysicalMemory

        Exit-PSSession
   # Back on client

# Interactive remote session
Enter-PSSession -ComputerName $ComputerName

    # Commands on Remote System

        Get-ComputerInfo -Property CsName,CSProcessors,CsTotalPhysicalMemory

        $ComputerInfo = Get-ComputerInfo -Property CsName,CSProcessors,CsTotalPhysicalMemory

        $ComputerInfo

Exit-PSSession
   # Back on client
   
$ComputerInfo

Get-PSSession

# Windows PowerShell Remoting Options
# Demo: Gathering information with CIM and WMI

# Using WMI and CIM Information
    # Using WMI and CIM to find physical memory information
    # Remember: -class and -classname parameter values are the same for most WMI/CIM calls
    # General Rule: Use CIM on modern versions of windows; Use WMI for older versions
    Get-WmiObject -List *    
    Get-WmiObject -List *memory*
    Get-WmiObject -class Win32_PhysicalMemory
    
    #CIM
    Get-CimClass -ClassName *memory*
    Get-CimInstance -ClassName Win32_PhysicalMemory
    Get-CimInstance -ClassName Win32_PhysicalMemory | Select Tag,Capacity
    (Get-CimInstance Win32_PhysicalMemory -ComputerName Client01).Capacity
    ((((Get-CimInstance Win32_PhysicalMemory -ComputerName Client01).Capacity | measure -Sum).Sum)/1gb)

# Help files
help about_WMI_Cmdlets

# Demo: Remoting with New-CimSession
# Run these commands in Windows PowerShell console as Administrator 

# Help with New-Cimsession
help about_CimSession

# Help for New-CimSession
Help New-CimSession

$CimSession = New-CimSession -ComputerName DC01

# Accessing DNS Client on remote system

Help Get-DNSClientServerAddress

Get-DNSClientServerAddress -CimSession $cimsession

# Storing CIM Session in variable for use later
# Using multiple CIM sessions
$ComputerNames = "dc01","Client01","Localhost","dc01","Client01","Localhost","dc01","Client01","Localhost","dc01","Client01","Localhost","dc01","Client01","Localhost"
$cimsession = New-CimSession -ComputerName $ComputerNames

Get-DnsClientServerAddress -CimSession $cimsession

Get-DnsClientServerAddress -CimSession $cimsession | Format-Table -RepeatHeader -GroupBy PSComputername