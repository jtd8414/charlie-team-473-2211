#CDT windows firewall and hardening ( I hope)

#allow firwall rules, icmp, dns, web 80/443
#flushes dns, logging on (system32\Logfiles\Firewall\pfirewall.log
#remove pass the hash hahes, restricts anonymous enumeration of SAM, UAC
# disable Admin shares servers, disable ipv6 

# open ports: http/s 80/443 in/out, icmp all, dns 53, dhcp 67/68, AD port 445

cls 

#reset firewall 
netsh advfirewall firewall delete rule all

#enables firewall on all profiles and logging
Set-NetFirewallProfile -All -Enabled True
netsh advfirewall set currentprofile logging filename %systemroot%\system32\LogFiles\Firewall\pfirewall.log 
netsh advfirewall set currentprofile logging droppedconnections enable
netsh advfirewall set currentprofile logging allowedconnections enable

#AD firewall rules
netsh advfirewall firewall add rule name="kerberos" dir=in action=allow protocol=TCP localport=88
netsh advfirewall firewall add rule name="RPC" dir=in action=allow protocol=TCP localport=135
netsh advfirewall firewall add rule name="netbios" dir=in action=allow protocol=TCP localport=139
netsh advfirewall firewall add rule name="LDAP" dir=in action=allow protocol=TCP localport=389
netsh advfirewall firewall add rule name="SMB" dir=in localport=445 protocol=TCP action=allow
netsh advfirewall firewall add rule name="kerberos out" dir=out action=allow protocol=TCP remoteport=88
netsh advfirewall firewall add rule name="RPC out" dir=out action=allow protocol=TCP remoteport=135
netsh advfirewall firewall add rule name="netbios out" dir=out action=allow protocol=TCP remoteport=139
netsh advfirewall firewall add rule name="LDAP out" dir=out action=allow protocol=TCP remoteport=389
netsh advfirewall firewall add rule name="SMB out" dir=out remoteport=445 protocol=TCP action=allow


#ICMP traffic allowed
netsh advfirewall firewall add rule name="ICMP ALL" protocol=icmpv4:any,any dir=in action=allow

# DNS outbound
netsh advfirewall firewall add rule name="DNS in UDP" dir=in localport=53 protocol=UDP action=allow
netsh advfirewall firewall add rule name="DNS out UDP" dir=out remoteport=53 protocol=UDP action=allow
netsh advfirewall firewall add rule name="DNS in TCP" dir=in localport=53 protocol=TCP action=allow
netsh advfirewall firewall add rule name="DNS out TCP" dir=out remoteport=53 protocol=TCP action=allow

#dhcp out
netsh advfirewall firewall add rule name="dhcp out" dir=out action=allow protocol=UDP localport=68 remoteport=67 

#Client web access for http/s allows inbound and outbound 80/443 connections
netsh advfirewall firewall add rule name="Allow 80 out" dir=out remoteport=80 protocol=TCP action=allow
netsh advfirewall firewall add rule name="Allow 443 out" dir=out remoteport=443 protocol=TCP action=allow
netsh advfirewall firewall add rule name="Allow 80 in" dir=in localport=80 protocol=TCP action=allow
netsh advfirewall firewall add rule name="Allow 443 out" dir=in localport=443 protocol=TCP action=allow

#sets default action to block for ingress and engress 
netsh advfirewall set allprofiles firewallpolicy blockinbound,blockoutbound

#Flush DNS
ipconfig /flushdns 

#Restrict annonymous access
reg add HKLM\SYSTEM\CurrentControlSet\Control\Lsa /v restrictanonymous /t REG_DWORD /d 1 /f 

# Removes creation of hashes used for pass the hash attack (must password reset and reboot)
reg add HKLM\SYSTEM\CurrentControlSet\Control\Lsa /f /v NoLMHash /t REG_DWORD /d 1

# Restricts anon enum of SAM accounts
reg add HKLM\SYSTEM\CurrentControlSet\Control\Lsa /v restrictanonymoussam /t REG_DWORD /d 1 /f

#UAC perm
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v EnableLUA /t REG_DWORD /d 1 /f

#Disables Admin shares-server and wks
reg add HKLM\SYSTEM\CurrentControlSet\SErvices\LanmanServer\Parameters /f /v AutoshareServer /t REG_DWORD /d 0 
reg add HKLM\SYSTEM\CurrentControlSet\SErvices\LanmanServer\Parameters /f /v AutoshareWks /t REG_DWORD /d 0

#disable IPv6
reg add HKLM\SYSTEM\CurrentControlSet\services\TCPIP6\Parameters /v DisableComponents /t REG_DWORD /d 1 /f

#disable admin cred cach using rdp
reg add HKLM\System\CurrentControlSet\Control\Lsa /v DisableRestrictedAdmin /t REG_DWORD /d 0 /f

Write-Output "Run these now:"
Write-Output "Set-ADAccountPassword <user> -NewPassword <password> -Reset -PassThru"
Write-Output "Restart-Computer"