Write-Host "Hello, and Welcome to the introduction to powershell course"

get-psdrive

Get-Module

Get-Module -listavailable

gcm -Module applocker

gcm -Module BranchCache

Get-Help servermanager

Get-Help * | where {$_.sysnopsis -match "path"} | ft name.synopsis -auto

#Comparison operators

10 -gt 20

20 -gt 10

10 -lt 10

20 -eq 15+5

20 -ne 15+5

20 -le 30

"Hello" -eq "Hello"

#Where-Object

Get-Process | Where-Object {$_.PriorityClass -eq "normal"}

Get-Process | Where-Object PriorityClass -eq "normal"

#Conditionals

$num=11

if($num -eq 10) {Write-Host "it's a 10"} elseif($num -eq 11) {Write-Host "its and 11"} else {write-host "not 10"}

write-host ((Get-date).DayOfYear)

write-host ((Get-Date).DayOfWeek)

switch((Get-Date).DayOfWeek) {` "saturday" {Write-Host "sports day"}` default {Write-Host "workday"}}