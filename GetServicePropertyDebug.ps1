. .\GetServicePropertyFunction.ps1 #path to the powershell function

#Load the function in memory using F8
#Get-ServiceProperty -Name RemoteRegistry

#Get-ServiceProperty -Name RemoteRegistry -Property *

Get-ServiceProperty -Name RemoteRegistry -Property StartName, DelayedAutoStart, PathName
