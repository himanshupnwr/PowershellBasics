Configuration MyConfig
{
    Node NOMAD01 {
        Service myBitsSvc
        {
            Name  = "BITS"
            State = "Running"
        }
    }
}

MyConfig

ise .\MyConfig\localhost.mof

#State of the service

Get-Service -Name "BITS" -ComputerName localhost, NOMAD01

Start-DscConfiguration -Path "C:\DSC\119521\MyConfig" -Wait -Verbose -ComputerName localhost, NOMAD01

Test-DscConfiguration

Test-DscConfiguration -CimSession NOMAD01

Get-DscResource

Find-Module | Out-GridView

Find-DscResource | Out-GridView

Find-DscResource -ModuleName *SharePoint*

Find-DscResource -Name *LoopBack*

Find-DscResource | Where-Object Name -Like *LoopBack*

Install-Module cWindowsOS

Get-DscLocalConfigurationManager

Get-DscLocalConfigurationManager -CimSession NOMAD01

Test-DscConfiguration

Get-DscLocalConfigurationStatus

Get-DscConfiguration

Configuration BitsCfg
{
    Service myBitsSvc
    {
        Name = "BITS"
        State = "Running"
    }
}

#push configuration
$nodeID = [guid]::NewGuid()

Write-Host "EASYNOMADSERVER01 will now be known at $nodeID"

$shareName = "\\EASYNOMADSERVER01\DSCSMBPullServer"

dir $shareName

[DSClocalConfigurationManager()]
Configuration DemoConfigNow
{
    param(
        # Parameter help description
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty]
        [string]
        $shareName,

        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty]
        [string]
        $NodeConfigurationId
    )
}

Node EASYNOMADSERVER01
{
    Settings{
        ConfigurationMode = "ApplyAndAutoCorrect"
        RefreshFrequencyMins = 30
        ConfigurationModeFrequencyMins = 30
    }

    ConfigurationRepositoryShare PullConfigServer
    {
        SourcePath = $shareName
    }
}

$mofPath = "C:\DSC\DesiredStateConfiguration"

DemoConfigNew - ShareName $shareName -NodeConfigurationId $nodeID -OutputPath $mofPath

Set-DscLocalConfigurationManager -Path $mofPath -ComputerName EASYNOMADSERVER01

Get-DscLocalConfigurationManager -CimSession EASYNOMADSERVER01

(Get-DscLocalConfigurationManager -CimSession EASYNOMADSERVER01).ConfigurationID
$nodeID

