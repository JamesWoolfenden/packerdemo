**Instructor**:

1.  Terraform the [demo PC](demo-pc).

    Set your AWS config.

    ```terraform apply demo-pc```

2.  Get the output IP.
>Outputs:
>
>public ip = 54.194.22.10
<!-- -->

3.  Get the admin password via the [AWS console](http://console.aws.amazon.com).

    ```Mstsc <outputIP>```
    Using your private key.
4.  RDP to the demo pc.

**Lesson 1 Preparation is everything**

-   Start admin PowerShell in the remote PC

-   Install chocolatey

    ```Set-ExecutionPolicy remotesigned```

    ```iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex```

-   Install Minimum required packages

    ```cinst awscli -y```

    ```cinst packer -y```

    ```cinst git -y```

    ```cinst atom -y```

-   Restart shell

-   Clone demo repo

    -   **git**` clone `<https://github.com/JamesWoolfenden/packerdemo.git>

>   Cloning into 'packerdemo'...  
    remote: Counting objects: 70, done.  
    remote: Compressing objects: 100% (60/60), done.  
    remote: Total 70 (delta 32), reused 34 (delta 6), pack-reused 0  
    Unpacking objects: 100% (70/70), done.  
    Checking connectivity... done.  

-   Open Atom from the shell

     ```atom .```

    -   Explain packer & terraform plugin for syntax.

    -   Generate an access key in [AWS console](http://console.aws.amazon.com).

<!-- -->

-   Add AWS keys environment

    In the shell:

   ```aws configure```

-   Demonstrate packer installed

   ```packer version```

**Lesson 2 Building a LAMP stack AMI**

Open [base.json](packer/base.json) in atom, then in your shell:

```packer validate ./packer/base.json```

This fails with
>    Template validation failed. Errors are shown below.
>    
>    Errors validating build 'amazon-ebs'. 1 error(s) occurred:
>    
>    * A source_ami must be specified

We need to specify an ubuntu ami, from the offical images account 099720109477. At your shell:

```$Ubuntu=(aws ec2 describe-images --owners 099720109477 --filters "Name=root-device-type,Values=ebs" "Name=architecture,Values=x86_64" "Name=name,Values='*hvm-ssd/ubuntu-trusty-14.04*'"|convertfrom-json).Images```

```$ubuntu| sort Name| Select-Object -Last 1```

This was ami-55452e26 at time of writing. Update base.json and check:

```packer validate ./packer/base.json```

### Doing something, anything...

It's not much use yet as it is, we haven't added anything into the base ami, for this we use provisioners.

Add provisioner skeleton to your json file:

    "provisioners": [
    {
       "type": "shell",
       "inline": [""]
    }
    ]

Then we add to the contents of the inline statement. Ensure we have latest packages with:    

```sudo apt-get update -y```

ALWAYS.

Next add in Apache

```sudo apt-get install apache2 -y```

mysql?

```sudo apt-get install mysql-server -y```

Link them?

```sudo apt-get install libapache2-mod-auth-mysql -y```

Practical Home Page?

```sudo apt-get install php5-mysql -y```

and finally fixup the db?

```sudo mysql_install_db  ```  

That's the whole of LAMP stack installed. OK now Lamp.json and base.json should be identical.

Open the [Lamp.json](packer/LAMP.json) file and [explain](Packer.md).

-   In the shell at the root of the repo:

   ```Packer build ./packer/LAMP.json```

-   Show the built AMI in the AWS [console](https://console.aws.amazon.com/console/home).

**Lesson 3 Building a windows application server**

Building a Windows server in packer is a bit more problematic.
To save you a lot of time and headaches, you need to run the script setup-pc.ps1 first.

This open ports on your firewall for winrm, and enables/set-up winrm.
Winrm  needs to be set to be unencrypted, setting your base image to use https is not a beginner exercise.

This is repeated on the target system through the use of user data payload, pay close attention to your choice of password as the base image has a very strict policy in place.  

You can find the lastest windows ami using: 
   ```$Windows=(aws ec2 describe-images --owners self amazon --filters --filters "Name=root-device-type,Values=ebs" "Name=architecture,Values=x86_64" "Name=platform,Values=windows" "Name=name,Values='Windows_Server-2012-R2_RTM-English-64Bit-Base*'|convertfrom-json).Images|sort Name| Select-Object -Last 1```

More information on Windows AMI and update schedules:https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/windows-ami-version-history.html#subscribe-notifications 

   ```Packer build ./packer/basewin212kr2.json```

It will take a while for the image to fully boot in AWS.
