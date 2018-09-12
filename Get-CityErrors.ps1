#requires -Version 3.0 -Modules ActiveDirectory

<#
.Synopsis
   Script to run a report showing city errors.
.DESCRIPTION
   Script to produce a CSV file showing inconsitencies regarding the city
   property in AD users.
.EXAMPLE
   Get-CityErrors.ps1 -Path c:\report.csv

#>

    Param
    (
        # Path for the file that will be created, include the .csv extension
        [Parameter(Mandatory=$true,
                   Position=0)]
        $Path
)


Get-ADUser -Filter * -Properties city |
Where-Object city -ne $null |
Select-Object city, samaccountname |
Sort-Object city | 
Export-Csv $Path