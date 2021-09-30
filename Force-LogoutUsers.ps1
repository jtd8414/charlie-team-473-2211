# The purpose of this script is to force log out users found on the system.
# be sure to run quser before running this script and update the user id added to the whitelist, to prevent yourself from being logged out
quser

$whiteListedSessionNumbers = New-Object Collections.Generic.List[Int]
$whiteListedSessionNumbers.Add(6); # update this number with your user ID from the quser command

$users = quser

foreach($user in $users)
{
    $id = ($user -split '\s+')[2]
    
    if ($whiteListedSessionNumbers -notcontains $id -and $id -ne "SESSIONNAME") {
        Write-Host $id
        logoff $id
    }
}
