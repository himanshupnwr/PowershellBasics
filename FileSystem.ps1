#alias of Get-ChildItem is ls

Get-ChildItem -Path C:\Windows\Web -Name

Get-ChildItem -Path C:\Windows\Web -Recurse


Get-ChildItem -Path C:\Windows\Web -Name -Recurse

Get-ChildItem -Path C:\Windows\Web -Include *.jpg -Name -Recurse

(Get-ChildItem -Path C:\Windows\Web -Include *.jpg -Name -Recurse).count

Get-Command *copy*

Copy-Item -Path C:\Windows\Web -Destination .\copiedFolder -Recurse -Verbose
#Verbose provides descriptive output of each time the command is working

