#Install-Module -Name PSDesiredStateConfiguration
Configuration FileConfig
{
    param(
        [Parameter(Mandatory = $true)]
        [string] $CopyFrom,

        [Parameter(Mandatory = $true)]
        [string] $CopyTo
    )

    #not working in vscode pwsh but working in powershell ISE and powershell extension
    Import-DscResource -ModuleName PSDesiredStateConfiguration

    File FileTest
    {
        SourcePath = $CopyFrom
        DestinationPath = $CopyTo
        Ensure = 'Present'
    }
}

Configuration NestedFileConfig
{
    Node localhost
    {
        FileConfig NestedConfig{
            CopyFrom = 'C:\Test\TestFile.txt'
            CopyTo = 'C:\Test\TestFile2.txt'
        }
    }
}
