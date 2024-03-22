1..10 | ForEach-Object { Add-Content -Path .\LineNumber.txt -Value "This is line $_." }

Get-Content -Path .\LineNumber.txt -TotalCount 5

Get-Item -Path .\LineNumber.txt | Get-Content -Tail 5

Get-Service | Export-Csv demo.csv

Get-Content | Export-Csv demo.csv

Import-Csv .\demo.csv | Where-Object -Property Name -Like "*xbox" | Format-Table Name, Description

Get-ComputerInfo

Get-ComputerInfo | Get-Member

Get-ComputerInfo -Property OS*

Get-ComputerInfo | Format-Table -Property OsBuildNumber, WindowsEditionId, CsNumberOfLogicalProcessors, CsNumberOfProcessors


#-Computername is not supported in powershell 7 but its supported till 5.1
$Computername = Read-Host 'Enter name of the host'

$stoppedservice = Get-Service -ComputerName $Computername | Where-Object -Property Status -EQ "Stopped"

Write-Output $stoppedservice
