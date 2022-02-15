

$computers = Get-Content "C:\Users\cwalker\Desktop\allcomputers.txt"

try {

Get-WmiObject SoftwareLicensingProduct -ComputerName $computers | where {$_.PartialProductKey} | Select-Object pscomputername, Name, productkeychannel, licensestatus | Export-Csv -path c:\users\cwalker\desktop\arrrgmatey3000.csv -notypeinformation -ErrorAction Stop

} Catch { $_| Out-File c:\users\cwalker\licensingerrorresponses.txt } #not currently working plz fix

<#

0   Unlicensed
1   Licensed
2   OOBGrace
3   OOTGrace
4   NonGenuineGrace
5   Notification
6   ExtendedGrace

#>