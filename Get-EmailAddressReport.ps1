#requires -Version 3.0 -Modules ActiveDirectory
<#
.Synopsis
   Returns a report in CSV format showing User's login names and emails.
.DESCRIPTION
   Gets all Active Directory users that have an email address and sorts them by email address. Produces a report showing login names
   and email addresses for these users.
.EXAMPLE
   Get-EmailAddressReport.ps1 -Path c:\reportname.csv
.NOTES
   You could replace the Param block with:
   
   $Path = Read-Host "Enter file path and name. Example c:\reportname.csv"

   This can sometimes be easier as a tool for help desk team members that are not familiar
   with PowerShell and would prefer a prompt instead of training to provide a parameter.
#>
    Param
    (
        # 
        [Parameter(Mandatory=$true,
                   HelpMessage='Valid path and filename with .CSV extension to create report file', 
                   ValueFromPipeline=$true,
                   ValueFromPipelineByPropertyName=$true, 
                   ValueFromRemainingArguments=$false, 
                   Position=0)]
        [ValidateNotNull()]
        $Path
        )

Get-aduser -Filter * -pr emailaddress |
Where-Object Emailaddress -NE $null |
Select-Object @{name='Login Name';expression={$_.samaccountname}}, @{name='Email Address';expression={$_.emailaddress}} |
Sort-Object "Login Name" |
export-csv $Path