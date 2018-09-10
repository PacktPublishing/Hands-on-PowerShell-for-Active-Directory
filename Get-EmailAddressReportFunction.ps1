<#
.Synopsis
   Returns a report in CSV format showing
   User's login names and email addresses.
.DESCRIPTION
   Gets all AD users that have an email address
   and sorts them by email address. Produces
   a report showing login names and email
   addresses for these users.
.EXAMPLE
   Get-EmailAddressReport -Path c:\name.csv
.NOTES
   This script is designed as an example of a very basic script to include a simple help section,
   one parameter within the Param block, and a command string. Note that it is best practice to use
   full Cmdlet and parameter names instead of abbreviations and aliases. The command string is also
   made easier to read by using line breaks after each pipe (|). PowerShell automatically knows that
   it is expected to have more after a pipe so it continues to the next line. This works for other symbols
   that require another symbol to close a section such as ( or {.

   This script will load the function Get-EmailAddressReport into the current console in which it is run.
   If all of this script were copied and pasted into a PowerShell profile script, then it would make the
   function available when opening a new console session.
#>
function Get-EmailAddressReport
{
    [CmdletBinding()]
    Param
    (
        [Parameter(Mandatory=$true,
                   HelpMessage='Valid path and filename with .CSV extension to create report file', 
                   Position=0)]
        [ValidateNotNull()]
        $Path
        )

Get-aduser -Filter * -pr emailaddress |
Where-Object Emailaddress -NE $null |
Select-Object @{name='Login Name';
expression={$_.samaccountname}},
@{name='Email Address';expression={
$_.emailaddress}} |
Sort-Object 'Login Name' |
export-csv $Path
}