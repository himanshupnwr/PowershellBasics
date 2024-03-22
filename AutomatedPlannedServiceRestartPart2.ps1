<# Automation of planned service restarts#>

$BASE_DIR = (Resolve-Path .\).Path

$ddmmyyyy = (Get-Date).ToString('dd-mm-yyyy');
$LOG_FILE = $BASE_DIR + "\Daily_Service_Restart_$ddmmyyyy`.log"

Start-Transcript -Path "$LOG_FILE"

$xml_config_file = $BASE_DIR + "\configuration_file.xml"
[xml]$xml_content = Get-Content $config_file

$services = "pla", "Spooler","WpnService"

Write-Output "${get-data} :INFO Starting the script execution"

foreach( $entity in $xml_content.SERVICE_RESTART.SERVER_SERVICE_COMBINATION){

    $servers = ($entity.SERVERS).split(',')
    $servers = ($entity.SERVICES).split(',')

Invoke-Command -ComputerName $arr_servers -ScriptBlock {
    $sleeptime = 30;

    Write-Output "$(Get-Date) :INFO Fetching the initial status of services"
    Get-Service -Name $Using:services | select name, status, PSComputerName

    Write-Output "$(Get-Date) :INFO Stopping Services"
    Stop-Service -Name $Using:services

    sleep($sleeptime)
    Write-Output "$(Get-Date) :INFO Checking the status to see if the services are stopped"
    Get-Service -Name $Using:services | select name, status, PSComputerName

    sleep($sleeptime)
    Write-Output "$(Get-Date) :INFO starting the services"
    Start-Service -Name $Using:services

    sleep($sleeptime)
    Write-Output "$(Get-Date) :INFO FINAL Status"
    Get-Service -Name $Using:services | select name, status, PSComputerName

}
write-output "$(Get-Date) :INFO Script Execution Over"
Stop-Transcript