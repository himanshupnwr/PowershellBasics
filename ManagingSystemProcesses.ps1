Start-Process calc

Start-Process calc -PassThru

Start-Process -FilePath "C:\Practice\sample.bat"

Get-Process - <#Returns all the processes that are running right now#>

Get-Process -Name chrome

Get-Process -Id 10884

Get-Process -Name Calculator | Select-Object *

Get-Process -Name chrome

Get-Process -Name chrome | Out-GridView

Get-Process -Name chrome | Select-Object * | Out-GridView

Get-Process -Name 'c*' | select -First 1 | select * <# processes that are starting with name c#>

Get-Process -Name 'c*' | Select-Object -Property Name, Company, WorkingSet, Handles, Path

Get-Process -Name 'c*' | Select-Object -Property Name, Company, WorkingSet, Handles, Path | Format-Table -AutoSize

Get-Process -Name 'c*' | Where-Object { $_.Company -like 'Google*'} <#$_ points to the current object or item#>

Get-Process -Name 'c*' | Where-Object { ($_.Company -like 'Google*') -and ($_.Handles -gt 500)} | select *

Get-Process -name chrome | Stop-Process