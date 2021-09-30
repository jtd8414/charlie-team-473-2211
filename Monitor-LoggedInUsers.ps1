# This is a simple script to output the currently logged in users every 5 seconds, it is intended to run in the background and to be visually checked periodically.
# If unauthorized user found I would recommend running Force-LogoutUsers.ps1 script.

while(1) 
{
    quser
    Write-Host
    sleep 5
}
