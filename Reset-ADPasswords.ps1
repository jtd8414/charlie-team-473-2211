# The purpose of this script is to quickly change passwords for all AD users and remove them from the Domain Admins group.
$userName = "Administrator"
$Password = ConvertTo-SecureString "qEVl393w4eAfmlY0" -AsPlainText -Force
Set-ADAccountPassword -Identity $userName -NewPassword $Password –Reset 

$userName = "StevenHiller"
$Password = ConvertTo-SecureString "E8703Ho7aSb1e3V1" -AsPlainText -Force
Set-ADAccountPassword -Identity $userName -NewPassword $Password –Reset 
Remove-ADGroupMember -Identity "Domain Admins" -Members $userName -Confirm:$false

$userName = "RussellCasse"
$Password = ConvertTo-SecureString "1QdCn2PGhyboxwXK" -AsPlainText -Force
Set-ADAccountPassword -Identity $userName -NewPassword $Password –Reset 
Remove-ADGroupMember -Identity "Domain Admins" -Members $userName -Confirm:$false

$userName = "MattyRoberts"
$Password = ConvertTo-SecureString "F7d28v2iEltgzZuu" -AsPlainText -Force
Set-ADAccountPassword -Identity $userName -NewPassword $Password –Reset 
Remove-ADGroupMember -Identity "Domain Admins" -Members $userName -Confirm:$false

$userName = "Predator"
$Password = ConvertTo-SecureString "fMrfmf3x5bBDZVCi" -AsPlainText -Force
Set-ADAccountPassword -Identity $userName -NewPassword $Password –Reset 
Remove-ADGroupMember -Identity "Domain Admins" -Members $userName -Confirm:$false

$userName = "Xenomorph"
$Password = ConvertTo-SecureString "YUmSO76R16uGQ0RR" -AsPlainText -Force
Set-ADAccountPassword -Identity $userName -NewPassword $Password –Reset 
Remove-ADGroupMember -Identity "Domain Admins" -Members $userName -Confirm:$false

$userName = "AgentK"
$Password = ConvertTo-SecureString "I2pEl48b8A1AKdGC" -AsPlainText -Force
Set-ADAccountPassword -Identity $userName -NewPassword $Password –Reset 
Remove-ADGroupMember -Identity "Domain Admins" -Members $userName -Confirm:$false

$userName = "AgentJ"
$Password = ConvertTo-SecureString "2VPJxcM5eed1TA2b" -AsPlainText -Force
Set-ADAccountPassword -Identity $userName -NewPassword $Password –Reset 
Remove-ADGroupMember -Identity "Domain Admins" -Members $userName -Confirm:$false

$userName = "FrankthePug"
$Password = ConvertTo-SecureString "O10l0YR3tU88Qm8A" -AsPlainText -Force
Set-ADAccountPassword -Identity $userName -NewPassword $Password –Reset 
Remove-ADGroupMember -Identity "Domain Admins" -Members $userName -Confirm:$false

$userName = "Ripley"
$Password = ConvertTo-SecureString "97OZAz0zm3a4b6nM" -AsPlainText -Force
Set-ADAccountPassword -Identity $userName -NewPassword $Password –Reset 
Remove-ADGroupMember -Identity "Domain Admins" -Members $userName -Confirm:$false

$userName = "ET"
$Password = ConvertTo-SecureString "r1A58O59Q46k38P8" -AsPlainText -Force
Set-ADAccountPassword -Identity $userName -NewPassword $Password –Reset 
Remove-ADGroupMember -Identity "Domain Admins" -Members $userName -Confirm:$false

$userName = "Paul"
$Password = ConvertTo-SecureString "40O99A3CarN6JrQt" -AsPlainText -Force
Set-ADAccountPassword -Identity $userName -NewPassword $Password –Reset 
Remove-ADGroupMember -Identity "Domain Admins" -Members $userName -Confirm:$false


$userName = "Thing"
$Password = ConvertTo-SecureString "793Idg467G0S9xdO" -AsPlainText -Force
Set-ADAccountPassword -Identity $userName -NewPassword $Password –Reset 
Remove-ADGroupMember -Identity "Domain Admins" -Members $userName -Confirm:$false
