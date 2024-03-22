Get-Volume

Get-PSDrive

Get-Volume -DriveLetter C

Get-Service bits, winrm, Spooler

Get-Command -name *disk -CommandType cmdlet, function

Get-Verb | more

Get-Command -Verb Mount

Get-Command -Noun disk*

Get-Command -Noun DiskImage

Get-Command -Noun disk* -Verb get

help Get-Disk -Examples

Get-Service -Name win* -Verbose

Get-Service win*

help Get-Service -Parameter requiredservices

Get-Process -Id $pid

help Get-Process -Parameter Id

Get-CimInstance #enter win32_logicaldisk

help Get-CimInstance -Parameter *name

Get-CimInstance Win32_OperatingSystem -Verbose -ComputerName localhost

Get-History 10 #shows the 10th last command that was run

Invoke-History 10 #runs the 10th last command that was run

Get-Module PSReadLine

Install-Module PSReadLine -Force

Get-PSReadLineOption

Set-PSReadLineOption -PredictionSource History

Set-PSReadLineOption -Colors @{InlinePrediction = "$([char]27)[4;38;5;189m"}

Get-Service -Name AppVClient

Get-Service win*

Get-service win*

Get-WinEvent -FilterHashtable @{Logname="Windows Powershell";Id=400} -MaxEvents 1 | Select-Object -ExpandProperty message

Get-WinEvent -ListLog * -ComputerName localhost -Credential company\administrator - message "Enter the admin credentials"

Get-WinEvent -LogName "Windows Powershell" -MaxEvents 10

Get-WinEvent -ListLog Microsoft-Windows-Powershell/Operational

Get-WinEvent Microsoft-Windows-Powershell/Operational -max 1 | Select-Object * | more

Get-WinEvent -FilterHashtable @{Logname = "Microsoft-Windows-Powershell/Operational"; ID=4100} -MaxEvents 5 | Select-Object -ExpandProperty message

Get-WinEvent -FilterHashtable @{Logname = "Microsoft-Windows-Powershell/Operational"; ID=4104} -MaxEvents 5 | Select-Object -ExpandProperty message

Show-EventLog #To open event viewer from powershell windows not powershell 7

#Windows powershell host

Write-Host "A is for apple" -ForegroundColor Yellow

Read-Host "Enter a service name"

Read-Host "Enter the passowrd" -AsSecureString

Get-CimInstance Win32_LogicalDisk -filter "deviceid='c:'" -Verbose

#you can also use the common errorvariable
Get-Service FooBarFun,winrm,BITS -ErrorVariable ev
$ev
$ev.exception | out-file c:\work\ev.txt
#$ev.exception > c:\work\ev.txt
#use >> to append to a file
get-content c:\work\ev.txt

#verbose
Get-CimInstance Win32_LogicalDisk -filter "deviceid='c:'" -Verbose 4>c:\work\verbose.txt
#another alias for get-content
Get-Content C:\work\verbose.txt



#to view environment variables
cd env:
dir
cmd.exe #to go back to the command prompt

cd function:
dir
cmd.exe

$a = Get-ChildItem function:help
$a.definition

$x = Get-ChildItem function:c:
$x.definition

Show-Command

help Get-Event -ShowWindow

Get-Help -Verbose about_*

Get-Service | Select-Object -Property Status, DisplayName | Where-Object { $_.Status -eq "Running" }
