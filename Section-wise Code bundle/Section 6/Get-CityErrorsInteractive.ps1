#requires -Version 3.0 -Modules ActiveDirectory
<#
.Synopsis
   Interactive Script to run a report showing city errors.
.DESCRIPTION
   Interactive script to produce a CSV file showing inconsitencies regarding the city
   property in AD users.
.EXAMPLE
   This script is interactive. Simply run it in a console.

#>

$reportfile = Read-Host "Enter report path and name. example c:\report.csv"

get-aduser -Filter * -Properties city |
Where-Object city -ne $null |
Select-Object city, samaccountname |
Sort-Object city | 
Export-Csv $reportfile