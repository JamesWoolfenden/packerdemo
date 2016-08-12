#this script assume your using dev and sets it too the prod aws cred
Param(
   [Parameter(Mandatory=$true)]
   [string]$awsprofile)

   $exists="$(aws configure get aws_access_key_id --profile $awsprofile)"

   if ($exists)
   {
      [Environment]::SetEnvironmentVariable("AWS_DEFAULT_PROFILE","$awsprofile","machine")
      $env:AWS_DEFAULT_PROFILE=$awsprofile

      [Environment]::SetEnvironmentVariable("AWS_PROFILE","$awsprofile","machine")
      $env:AWS_PROFILE=$awsprofile

      [Environment]::SetEnvironmentVariable("AWS_REGION","$(aws configure get region --profile $awsprofile)","machine")
      $env:AWS_REGION=$(aws configure get region --profile $awsprofile)

      [Environment]::SetEnvironmentVariable("TF_VAR_access_key","$(aws configure get aws_access_key_id --profile $awsprofile)","machine")
      [Environment]::SetEnvironmentVariable("TF_VAR_secret_key","$(aws configure get aws_secret_access_key --profile $awsprofile)","machine")
      
      
      Write-Host "Switched to AWS Profile: $awsprofile"
      aws configure list
      Write-host ""
      Write-host "For terraform:"
      
      Write-host "Key   : $env:TF_VAR_access_key "
      Write-host "Secret: $env:TF_VAR_secret_key"      
   }
   else
   {
      Write-Error "Profile: $awsprofile not found"
   }
