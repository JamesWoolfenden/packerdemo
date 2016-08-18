winrm quickconfig
set-item WSMan:\localhost\Client\AllowUnencrypted -Value True
set-item WSMan:\localhost\Client\Auth\Basic  -Value True
set-item WSMan:\localhost\Client\TrustedHosts -Value *

set-item WSMan:\localhost\Service\AllowUnencrypted -Value True
set-item WSMan:\localhost\Service\Auth\Basic  -Value True

#firewall
set-NetFirewallRule -Name  WINRM-HTTP-In-TCP-PUBLIC -Profile Any -Enabled true
set-NetFirewallRule -Name  WINRM-HTTP-In-TCP -Profile Any -Enabled true
new-NetFirewallRule -Name  Terraform-http -DisplayName  "Terraform http" -Enabled  True -Profile Any -Action  Allow -protocol tcp -RemotePort 5985 
new-NetFirewallRule -Name  Terraform-http -DisplayName  "Terraform http" -Enabled  True -Profile Any -Action  Allow -protocol tcp -RemotePort 5986 

#testconnectivity with powershell 
#New-PSSession -ComputerName <temp-ip> -credential (get-credential)
 