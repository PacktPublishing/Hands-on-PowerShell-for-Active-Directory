<#
.Synopsis
   Create multiple AD users automatically from CSV file.
.DESCRIPTION
   Imports new users from a CSV file and creates them as new Active Directory users one by one.
.EXAMPLE
   Add-MultipleADUsers.ps1 -Path c:\newuserlist.csv
.NOTES
   AS THIS IS AN EXAMPLE, YOU WILL NEED TO CHANGE VARIABLES AND DATA BELOW TO MATCH YOUR ENVIRONMENT OR LAB. BETTER YET, ADD PARAMETERS
   TO REPLACE THEM FOR MORE VERSATILE USAGE.
#>

    Param
    (
        # Path to the CSV file
        [Parameter(Mandatory=$true,
                   ValueFromPipelineByPropertyName=$true,
                   Position=0)]
        $Path)

$newusers = Import-Csv $Path

foreach ($newuser in $newusers) {
$first = $newuser.FirstName
$last = $newuser.LastName
$name = "$first $last"
$login = $newuser.loginname
$email = "$login@contoso.com"
$city = 'New York'

New-ADUser -Name $name -SamAccountName $login -EmailAddress $email -GivenName $newuser.firstname -Surname $newuser.lastname -City $city
}#foreach