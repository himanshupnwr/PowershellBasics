Get-Content -Path .\PowershellExampleFile

$file_content = Get-Content -Path .\PowershellExampleFile

$file_content[2] <# To get the value at second place as file content is an array#>

Get-Content -Path .\PowershellExampleFile | Where-Object {$_ -like '*line4'} <#To get the line which has the substring line4#>

Get-History <#To get complete history of the scripts run#>