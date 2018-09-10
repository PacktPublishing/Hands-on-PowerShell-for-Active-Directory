<#
.Synopsis
   Creates a new AD user according to company standards
.DESCRIPTION
   Uses New-ADUser and pre specified input to maintain corporate standards in new
   user creation.
.EXAMPLE
   Add-ADUser
.NOTES
   This script is designed as an interactive tool example for an IT department usage in creating new AD
   users in a standard fashion. It is strickly designed as an example for learning and inspiration.
#>

$FirstName = Read-Host 'Enter First Name'
$LastName = Read-Host 'Enter Last Name'
$Login = Read-Host 'Enter Login Name (Use first initial and last name)'
$Name = "$FirstName $LastName"
$City = 'New York'


New-ADUser -SamAccountName $Login -GivenName $FirstName -Surname $LastName -City $City -Office $City -DisplayName $Name -Name $Name -AccountPassword ("Password1" |
ConvertTo-SecureString -AsPlainText -Force) -Enabled $true -ChangePasswordAtLogon $true
