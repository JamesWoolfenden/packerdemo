**Instructor**:

1.  Terraform the demo pc

2.  Get the output ip

3.  Get the admin password via the aws console **mstsc**

4.  RDP to the demo pc.

**Lesson 1 Preparation is everything**

-   Start admin powershell.

-   Install chocolatey

    -   **set-executionpolicy remotesigned**

    -   **iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex**

-   Install Minimum required packages

    -   **cinst awscli -y**

    -   **cinst packer -y**

    -   **cinst git -y**

    -   **cinst atom -y**

-   Restart shell

-   Clone demo repo

> **git clone https://github.com/JamesWoolfenden/packerdemo.git**

-   Open Atom from the shell

    -   **atom .**

    -   explain packer & terraform plugin for syntax

    -   Generate an access key in aws console

<!-- -->

-   <http://console.aws.amazon.com>

-   add to environment

-   **aws configure**

    -   demonstrate packer installed

    -   packer

**Lesson 2 Building a LAMP stack AMI**

Open the Lamp.json file and explain.

In the root of the repo:

-   **Packer build ./packer/LAMP.json**

Show the built ami in the aws console.
