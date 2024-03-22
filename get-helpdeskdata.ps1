Write-Output " This script ran on $env:computername"
Write-Output " ++++++++++++++++++++++++++++++"
get-service -Name WinRM,Winmgmt,WinRM | Format-table -Property status,name