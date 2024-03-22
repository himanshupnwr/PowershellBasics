Get-Service | Where-Object {$_.status -eq 'running'}

Get-Service | Where-Object {$PSItem.status -eq 'running'} #instead of _ use $psitem

#combination of early and late filtering combined
Get-Service -Name w* | Where-Object { $PSItem.Status -eq 'running' -and $PSItem.StartType -eq 'manual'}

#early filtering
Get-ChildItem C:\Windows\System32\*.xml

Get-ChildItem C:\Windows\System32\ -Filter *.xml

#with include we have to use -recurse and give depth of how deep we want to check
Get-ChildItem C:\Windows\System32 -Include a*.xml -Exclude appx*.xml -Recurse -Depth 1 -ErrorAction SilentlyContinue | Select-Object Name

Get-CimInstance -ClassName Win32_SystemDriver -filter "state = 'running' and servicetype='file system driver'"

Get-CimInstance -query "Select DisplayName,Name,State from Win32_SystemDriver where state = 'running' and servicetype='file system driver'" | Format-Table

Get-CimInstance -query "Select DisplayName,Name,State from Win32_SystemDriver where state = 'running' and servicetype='file system driver'" | Select-Object DisplayName,Name,State

Get-CimInstance -ClassName Win32_SystemDriver -filter  "state = 'running' and servicetype='file system driver'" -Property DisplayName,Name,State | Select-Object DisplayName,Name,State

Get-ChildItem alias: -include c* -Recurse

Get-Alias c*

Get-PSProvider

#Late Filtering

Get-Service w* | Where-Object {$_.Status -eq 'running'}

$now = Get-Date
#find temp files created in the last 7 days
#remember, you can use any object property you find with Get-member
Get-ChildItem $env:TEMP -file -Recurse | Where-Object {$psitem.CreationTime -ge $now.AddDays(-7) }

#you can use your own computername multiple times for testing
get-content c:\work\servers.txt
#cat is an alias for Get-Content
$servers = Get-Content C:\work\servers.txt | Where-Object { Test-Connection -ComputerName $_ -count 2 -Quiet }
$servers

Get-Ciminstance -ClassName win32_process | Select-Object -first 5

Measure-Command {
    Get-CimInstance win32_process -ComputerName $servers |
    Where-Object WorkingSetSize -ge 50MB
}

Measure-Command {
    Get-CimInstance win32_process -ComputerName $servers -filter "WorkingSetSize >=52428800"
}

Get-CimInstance win32_process -filter "WorkingSetSize >= $(50mb)" -ComputerName $servers |
Sort-Object WorkingSetSize -Descending

