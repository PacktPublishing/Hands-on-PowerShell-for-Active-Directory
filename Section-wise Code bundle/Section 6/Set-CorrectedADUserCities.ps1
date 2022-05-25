<#
This is not a script, but rather an example of importing a csv in a console. Then putting that data into a variable. Finally, using a foreach statement changing that data
to a correct style.
#>

$users = import-csv C:\temp\reportoncities.csv

foreach ($user in $users) {
if ($user.city -ne 'New York') {
Set-ADUser $user.samaccountname -City 'New York'}#if
}#foreach