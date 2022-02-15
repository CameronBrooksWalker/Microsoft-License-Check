

$alldomain  =  get-adcomputer  -filter *  -property *

$computers  =  $alldomain.CN

Get-WmiObject SoftwareLicensingProduct -ComputerName $computers | where {$_.PartialProductKey} | Select-Object pscomputername, Name, productkeychannel, licensestatus | Export-Csv -path .\licensecheck.csv -notypeinformation -ErrorAction Stop
