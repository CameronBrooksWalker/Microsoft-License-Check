# Microsoft License Check

This script checks the licensing status of any Microsoft products (Windows, Office, SQL, etc.) on all remote computers.  
  
It's INCREDIBLY simple, and utilizes yet another piece of the beloved WMI tool in PowerShell. If you were really cool, you could probably even cut this down to a single line of code. In this example, we'll have to settle for three.  
  
  
  
  
  

    $alldomain  =  get-adcomputer  -filter *  -property *
    
    $computers  =  $alldomain.CN    
        
    Get-WmiObject SoftwareLicensingProduct -ComputerName $computers  |  where {$_.PartialProductKey} |  Select-Object pscomputername, Name, productkeychannel, licensestatus |  Export-Csv  -path c:\users\cwalker\desktop\licensingstatus.csv -notypeinformation -ErrorAction Stop

  
  
We're just grabbing a giant list of all the computers in the domain, stripping it to their host-name, piping that into the WMI tool, calling the "SoftwareLicensingProduct" feature for each one, grabbing any entry that has a product key of any sort, and exporting info about its status and such to a .csv.  
  
  
The numbers in the "licensestatus" field are coded as follows, though they're not super clearly defined unfortunately.  
  
  
  
  
| Number | Meaning         |
|--------|-----------------|
| 0      | Unlicensed      |
| 1      | Licensed        |
| 2      | OOBGrace        |
| 3      | OOTGrace        |
| 4      | NonGenuineGrace |
| 5      | Notification    |
| 6      | ExtendedGrace   |
  
  
--Cameron


