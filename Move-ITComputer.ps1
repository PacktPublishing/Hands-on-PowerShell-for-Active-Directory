<#
.Synopsis
   Set a newly added computer to the IT Computer OU
.DESCRIPTION
   By entering the computer name, this tool with move that AD computer to the IT computer OU.
.EXAMPLE
   Move-ITComputer.ps1
#>

#Choose the AD OU to move the computer to and put it's address in a variable
$ITComputers = Get-ADOrganizationalUnit "OU=OU\=IT\,OU\=Client Computers\,DC\=packtlab\,DC\=com,DC=corp,DC=packtlab,DC=com"

#Interactively request the computer's name from an IT staff member
$ComputerName = Read-Host 'Enter Computer Name'

#Capturing the AD computer object
$Computer = Get-ADComputer $ComputerName

#Moving the AD computer to the IT computer OU
$Computer | Move-ADObject -TargetPath $ITComputers -Confirm
