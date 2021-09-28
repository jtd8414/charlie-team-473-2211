# AD No hours script

[byte[]]$NoHours = 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

Get-ADuser -Filter * | Out-Gridview -PassThru -Title "Select Users to Disable" | Foreach-Object { 
    $_ | Disable-ADAccount
    $_ | Set-ADUser -Replace @{logonhours = $NoHours}
}