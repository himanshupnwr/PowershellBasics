Get-Process -IncludeUserName |
Sort-object Username |
Format-Table -groupby Username -Property Handles,WS,PM,NPM,CPU,ID,Name,
@{Name="Runtime";Expression={New-Timespan -start $_.starttime -end (Get-Date)}} -AutoSize |
Out-File c:\work\user.txt

$a = Get-WinEvent system | Select-Object entrytype, source, message -First 5 | Format-Table
$a

Get-Process -Id $PID | Format-Table Name, peak*size

Get-Process | Select-Object id,Name, Path, WS | Format-Table -Wrap

Get-Process -IncludeUserName |
Sort-object Username |
Format-Table -groupby Username -Property ID,Name,Handles,WS,PM,NPM,CPU,
@{Name="Runtime";Expression={New-Timespan -start $_.starttime -end (Get-Date)}} -AutoSize -Wrap |
Out-Printer

#formatted data fails
Get-Service w* | Sort-Object displayname | Format-Table Displayname,Status,StartType | Out-GridView
Get-Service w* | Select-Object Displayname,Status,StartType | Out-GridView
#passthrough is very useful
Get-Service | Where-Object {$_.status -eq 'running'} | Out-GridView -Title "Select a process" -PassThru

Get-CimInstance Win32_Process -Filter "workingsetsize > $(50mb) -ComputerName server1, server2, server3" |
Format-Table -GroupBy PSComputername -Property ProcessId, Name, WorkingSetSize

Get-ChildItem C:\Windows\System32 -File | Sort-Object Extension | Format-Table -GroupBy Extension -Property Mode, Lastwritetime, Length, Name

#Formatting Table
Get-Process -Id $PID | Format-Table Id, WS, @{label="Runtime";Expression={New-TimeSpan -Start $_.starttime -End (Get-Date)}}

Get-Process -Id $PID | Format-Table Id, WS, @{Name="Runtime";Expression={New-TimeSpan -Start $_.starttime -End (Get-Date)}}

Get-Process -Id $PID | Format-Table Id, WS,
@{Name="WorkingSetMB"; Expression={$_.WS/1mb -as [int]}},
@{Name="Runtime";Expression={New-TimeSpan -Start $_.starttime -End (Get-Date)}} |
Format-Table -GroupBy Path -Property ID,WorkingSetMB, Runtime

Get-Process -Id $PID | Format-Table Id, WS, Path,
@{Name="WorkingSetMB"; Align='center'; Expression={$_.WS/1mb -as [int]}},
@{Name="Runtime"; Align='right'; Expression={New-TimeSpan -Start $_.starttime -End (Get-Date)}}

Get-Process -Id $PID | Format-List

#works on windows powershell as the path points to the windows powershell not powershell 7
Get-Item $PSHOME\powershell.exe

Get-Item $PSHOME\powershell.exe | Format-List

Get-Item $PSHOME\powershell.exe | Format-List -Property *

Get-Process -id $pid | Select-Object ID,Name,HandleCount,WS,PM,Path,Description
#ends here

dir C:\work -File |
Format-List -Property Name, @{Name="size"; Expression={$_.Length}},
LastWriteTime
@{Name="Age"; Expression={New-TimeSpan -Start $_.LastWriteTime -End (Get-Date)}}

$g = Get-WinEvent system -MaxEvents 500 | Group-Object source
$g | Format-Wide
$g | Sort-Object Name | Format-Wide {"$($_.Name) [$($_.Count)]"}

#Format Views

Get-Process | Format-Table -view priority

Get-Process | Sort-Object starttime | Format-Table -view Starttime | more

Get-FormatData system.diagnostics.process -PowerShellVersion $PSVersionTable.PSVersion |
Select-Object -ExpandProperty FormatViewDefinition

Get-FormatView | Group-Object typename | Where-Object count -gt 2 | Sort-Object count -Descending | Format-Table -AutoSize

#this will give error and won't work because formatting is done at the end. the sort will not know what to do with formatted table data
Get-Service | Format-Table Displayname,Status,StartType | Sort-Object Displayname

#filter left, then sort and then format right
Get-Service w* | Sort-Object Displayname | Format-Table Displayname,Status,StartType

#out-* commands will accept formatted objects - Out-File, Out-Printer, Out-String
#Out-file
Get-WinEvent -FileterHashTable @{Logname='system'; Level=2} -MaxEvents 100 |
Format-Table Timecreated, ProviderName, ID, message -AutoSize -Wrap | Out-File

#out printer will convert the results into pdf
Get-WinEvent -FileterHashTable @{Logname='system'; Level=2} -MaxEvents 100 |
Format-Table Timecreated, ProviderName, ID, message -AutoSize -Wrap | Out-Printer

#out string can be used to treat any output as one long string
$s = Get-Service -ComputerName DOM1 | Format-List -Property Name, DisplayName, State, StartType, MachineName | Out-String
$s

Get-Process | Select-Object ID, Handles, Name, WS, StartPath | Out-GridView

Get-Process -IncludeUserName |
Sort-Object Username |
Format-Table -GroupBy Username -Property Handles,WS,PM,NPM,CPU,ID,Name,
@{Name="Runtime";Expression={New-TimeSpan -Start $_.starttime -End (Get-Date)}} -AutoSize -Wrap |
Out-File C:\work\user.txt

#out-gridview
Get-Service w* | Sort-Object DisplayName | Format-Table DisplayName,Status,StartType | Out-GridView

#passthru - pass through the data back to powershell pipeline
Get-Service | Where-Object {$_.Status -eq 'running'} | Out-GridView -Title "Select a process" -PassThru

Get-Service | Where-Object {$_.Status -eq 'running'} |
Out-GridView -Title "Select a process" -OutputMode Multiple |
Restart-Service -PassThru
