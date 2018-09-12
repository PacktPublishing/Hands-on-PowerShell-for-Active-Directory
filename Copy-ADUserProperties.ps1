<#
.Synopsis
   This is not intended to be a script, but rather an example of a command string that could be used within a console to copy
   the data from one property into another to fill a void.
#>

#First you could run this to acquire the information and properties. Then put that data into a variable.
$users = get-aduser -Filter * -Properties city, office |
Select-Object samaccountname, city, office

#Now taking the previous command variable, the following command would go user by user and copy the data from the city property into the office property.
foreach ($user in $users) {
Set-ADUser $user.samaccountname -Office $user.city
}#foreach