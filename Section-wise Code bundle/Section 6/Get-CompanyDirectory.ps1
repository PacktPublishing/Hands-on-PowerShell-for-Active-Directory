#requires -Version 3.0 -Modules ActiveDirectory

<#
.Synopsis
   Create a company directory
.DESCRIPTION
   Pulling information from AD, this script creates a Html based company directory.
.EXAMPLE
   Get-CompanyDirectory.ps1
#>

Get-ADUser -Filter * -Properties City, Emailaddress |
Where-Object givenname -ne $null |
Select-Object surname, givenname, emailaddress, city |
Sort-Object surname, givenname |
ConvertTo-Html > c:\temp\directory.htm