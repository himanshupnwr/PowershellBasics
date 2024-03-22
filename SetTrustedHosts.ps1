# Configuring TrustedHosts

# Enter session with IP Address to DC01
$ServerIP = '192.168.68.99'
Invoke-Command -ComputerName $ServerIP -ScriptBlock {
    Get-computerInfo | select-object -Property CsName,CsDomain,WindowsProductName}

$Credential = Get-Credential
Invoke-Command -ComputerName $ServerIP -Credential $Credential -ScriptBlock {
    Get-computerInfo | select-object -Property CsName,CsDomain,WindowsProductName}

# Enter Session to server01
$ComputerName = "Server01"
$Credential = Get-Credential
Invoke-Command -ComputerName $ComputerName -Credential $Credential -ScriptBlock {
    Get-computerInfo | select-object -Property CsName,CsDomain,WindowsProductName}

    # Error

get-item WSMan:\localhost\Client\TrustedHosts

set-item WSMan:\localhost\Client\TrustedHosts -Value "*"

# Test remoting to IP

$ServerIP = '192.168.68.99'
$Credential = Get-Credential
Invoke-Command -ComputerName $ServerIP -Credential $Credential -ScriptBlock {
    Get-computerInfo | select-object -Property CsName,CsDomain,WindowsProductName}

# Test remoting to non-domain computer

$ComputerName = 'Server01'
$Credential = Get-Credential
Invoke-Command -ComputerName $ComputerName -Credential $Credential -ScriptBlock {
    Get-computerInfo | select-object -Property CsName,CsDomain,WindowsProductName}

set-item WSMan:\localhost\Client\TrustedHosts -Value ""