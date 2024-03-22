<#Basic Operations#>

Set-Location C:\Learning\Powershell

New-Item -Path TestingFolder -ItemType Directory

Remove-Item .\TestingFolder

<# To delete all subfolders also in the folder#>

Remove-Item .\TestingFolder -Recurse

New-Item -Path PowershellExampleFile.txt -ItemType File

"This is my first statement" | Out-File PowershellExampleFile.txt

"This is my second statement" | Out-File PowershellExampleFile.txt -Append -Encoding ascii

Remove-Item .\PowershellExampleFile.txt

Get-Command -Noun *Object

#To install vscode using powershell

code --install-extension ms-vscode.powershell

code --list-extensions

#explore directory
Get-ChildItem
gci
ls

Set-Location C:\Learning\Powershell

mkdir funwithpowershell

explorer.exe

mkdir dir1, dir2, dir3

Remove-Item dir1

Set-Location ..\dir1

Push-Location users\YOURUSERNAME\funWithPowerShell\dir1
Push-Location users\YOURUSERNAME\funWithPowerShell\dir1

Pop-Location users\YOURUSERNAME\funWithPowerShell\dir1
Pop-Location users\YOURUSERNAME\funWithPowerShell\dir1

#Files
#create new item
New-Item example1.txt, example2.txt

#Copy-Item (cp) and Move-Item (mv)

#moving to directory
Move-Item example.txt dir

#rename the name of the file
Move-Item example.txt benjamin.txt

#copy file data to another file
Copy-Item benjamin.txt steven.txt

Write-Output "The technique of reproduction detaches the reproduced object from the domain of tradition."

Write-Output "The technique of reproduction detaches the reproduced object from the domain of tradition." > benjamin.txt

Get-Content benjamin.txt

#make benjamin2.txt, with the exact same contents as benjamin.txt
Get-Content benjamin.txt > benjamin2.txt

Write-Output "By making many reproductions it substitutes a plurality of copies for a unique existence." > next.txt

#Working with Lots of Files at Once Using Wildcards (*

Get-Content benjamin.txt, benjamin1.txt, benjamin2.txt, next.txt

#to get content of all txt files in the directory
gc *.txt

#Using *, we can search multiple files at the same time
sls "unique existence" *.txt

#Suppose we have numerous different files we want to combine together into another file
gc text1, text2, text3 > newtext

gc bigben.txt -totalcount 10

gc bigben.txt -tail 10

#to exclude a path from get content
gc *.txt -exclude bigben.txt > bigben.txt

#we use > for redirection, for piping we use |
gc benjamin.txt | measure -l -w -c #-line, -word - character

#-ignorewhitespace to the end. (You can also just type -ig)
gc *.txt | measure -l -w -c -ig

#not to run on a prod server, very memeory heavy command
Get-Module -ListAvailable | Import-Module ; gcm -co cmdlet | measure

#to get object of a set we can use get-member

Get-Module -ListAvailable | Select-Object -Property Name | gm
#typename will be selected.system.management.automation.psmoduleinfo
#we get the object we get after the select object command
#use get member to get the object name we are dealing with

Get-Command -Module sqlps

Get-Command -Module Pester

Get-Module -Name ActiveDirectory | gm

dir env:

