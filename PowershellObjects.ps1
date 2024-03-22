#Powershell Objects

Help Get-Service -Parameter name

"winrm" | Get-Service

Get-ChildItem C:\Windows -File | Group-Object -Property Extension | Tee-Object -Variable ex

$ex | Get-Member

$ex | Select-Object -Property Name,Count,
@{Name = "Size"; Expression={ $_.group |
    Measure-Object -Property length -Sum |
    Select-Object -ExpandProperty Sum
}}

Get-Service | Sort-Object -Property StartType

Get-Process | Select-Object -Property Id, Name, WorkingSet

Get-ChildItem -File | Measure-Object -Property Length -Sum

Get-Process -IncludeUserName | Group-Object UserName

Get-Service WinRM | Get-Member -MemberType Properties

Get-Service | Group-Object StartType -NoElement

Get-Service | Sort-Object -Property Name -Descending

Get-Service BITS | Get-Member status

[enum]::GetNames("System.ServiceProcess.ServiceControllerStatus")

Get-Process | Select-Object Id, Name, WS, CPU -First 10

Get-WinEvent -ListLog System

Get-WinEvent -ListLog System | Select-Object *

Get-WinEvent -ListLog * | Select-Object Logname, RecordCount, MaximumSizeInBytes, FileSize | Out-GridView

Get-Process | Measure-Object -Property WS -Sum -Average | Select-Object Count, Sum, Average

Get-Process | Sort-Object WS -Descending | Select-Object -First 5

Get-ChildItem $env:TEMP -Recurse -File |
Measure-Object Length -Sum -Average -Maximum -Minimum |
Select-Object * -ExcludeProperty Property

1..10 | ForEach-Object { $_ * 2 }

1..10 | ForEach-Object { $_ * 2 } | Measure-Object -Sum -Average

1..10 | ForEach-Object { Get-Random -Minimum 1 -Maximum 100 } |
ForEach-Object { $_ * 2 } |
Measure-Object -Sum -Average -Maximum -Minimum |
Select-Object -Property * -ExcludeProperty Property, Count

# % is an alias for foreach loop

Get-ChildItem -File | Select-Object Name

Get-ChildItem -File | Select-Object -ExpandProperty Name

Get-ChildItem C:\Windows -file |
Group-Object -Property Extension |
Select-Object -Property Name,Count,
@{Name="Size"; Expression={ $_.group | Measure-Object -Property length -Sum | Select-Object -ExpandProperty Sum}} |
Sort-Object -Property Size -Descending
Select-Object -First 5
