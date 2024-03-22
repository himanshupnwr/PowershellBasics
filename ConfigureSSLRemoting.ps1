# Configure Windows PowerShell Remoting with SSL

# Pre-requisites

# NOTE: This demo uses a self-signed certificate for ease of demonastration. In a production environment, you would need to use a PKI like Active Directory Certificate Services.

# For more information on setting up Active Directory Certificate Services

Start-process https://learn.microsoft.com/windows-server/networking/core-network-guide/cncg/server-certs/server-certificate-deployment

help about_Certificate_Provider

## Creating a Self-Signed Certificate
## Complete on target computer - DC01
## Run as Administrator

New-SelfSignedCertificate -Subject 'CN=dc01.psdemo.co' -Type SSLServerAuthentication -HashAlgorithm 'Sha256'

## Configuring the WinRM Listener
winrm create winrm/config/Listener?Address=*+Transport=HTTPS '@{Hostname="dc01.psdemo.co"; CertificateThumbprint="FCDF16567051CD5A8D0525881CB805B08BC36ECE"}'

winrm enumerate winrm/config/Listener

## Opening the WinRM SSL Firewall Port

$FirewallParam = @{
    DisplayName = 'Windows Remote Management (HTTPS-In)'
    Direction = 'Inbound'
    LocalPort = 5986
    Protocol = 'TCP'
    Action = 'Allow'
    Program = 'System'
}
New-NetFirewallRule @FirewallParam

# Test

Enter-PSSession -ComputerName $ComputerName -Credential $Credential -UseSSL

    # Fails due lack of trust chain with self-signed cert

$PSSessionSSLOption = New-PSSessionOption -skipCACheck

Enter-PSSession -ComputerName $ComputerName -Credential $Credential -UseSSL -SessionOption $PSSessionSSLOption

    # Failed due to host name

$ComputerName = 'dc01.psdemo.co'
Enter-PSSession -ComputerName $ComputerName -Credential $Credential -UseSSL -SessionOption $PSSessionSSLOption