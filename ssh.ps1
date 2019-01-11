param(
[Parameter(Mandatory=$true)]
[string]$keyfile)

ssh-keygen -t rsa -b 4096 -f .\secret\$keyfile
