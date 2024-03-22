. $PSScriptRoot\GetServicePropertyFunction.ps1

Describe 'Get-ServiceProperty Tests'
{
    Context 'Example 1' {
        $result = Get-ServiceProperty -Name RemoteRegistry

        It 'Count Should be 6'
        {
            ($result.PSObject.Properties.Name).Count | Should -Be 6
        }
    }

    Context 'Example 2' {

        It 'Count Should be greater than 6'
        {
            ((Get-ServiceProperty -Name RemoteRegistry -Property *).PSObject.Properties.Name).Count | Should -BeGreaterThan 6
        }
    }
}
