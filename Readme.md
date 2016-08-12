Instructor:
Terraform the demo pc
Get the output ip
Get the admin password via the aws console
mstsc <ipaddress>
Rdp to the demo pc.


Prep Host Windows

  - Start admin powershell.
  - Install chocolatey
	  - set-executionpolicy remotesigned
	  - iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex
  - Install Minimum required packages
       - cinst awscli -y
       - cinst packer -y
       - cinst git -y
       - cinst atom -y
   - Restart shell
   - Clone demo repo
      git clone https://github.com/JamesWoolfenden/packerdemo.git
   - Open Atom from the shell
	   - atom .
	   - packer & terraform plugin for syntax

	- Generate an access key in aws console
		- http://console.aws.amazon.com
		- add to environent
		- aws configure
      - demonstrate packer installed



build a linux ami in amazon
- download install packer on windows
chocolatey
	choco install packer
- download install packer on linux
- explain different providers

aws authentication
- windows caveats
- ssh on windows
	use git provided tool
	add path to shell
- winrm on windows

provisions to one region and one account only but copied to other regions and shared betweem account
