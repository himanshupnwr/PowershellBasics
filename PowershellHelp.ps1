Get-Help

#To download the help to local machine folder
Save-Help -Module ServerManager, SMBShare -DestinationPath C:\Help -Force

Update-Help -Module ServerManager, SMBShare -SourcePath C:\Help -Force

help *process

Get-Help Get-Service

help Get-Service -ShowWindow

help Get-Process -Full

help Get-Service -Parameter Name

help Get-Service -Parameter *Name

help about_Aliases

help about_*

Get-Module PSReadLine

Install-Module PSReadLine -Force

Remove-Module PSReadLine

Import-Module PSReadLine

Get-Module PSReadLine

"bits", "win*" | Get-Service

Install-Module PSTeachingtools

Get-SmbShare

Get-Help Stop-Service -parameter *