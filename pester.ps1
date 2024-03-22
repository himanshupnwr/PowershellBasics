Get-Module pester -ListAvailable

Install-Module pester -RequiredVersion 4.1.0 -SkipPublisherCheck

Invoke-Pester -Script .\GetServicePropertyFunction.Tests.ps1
