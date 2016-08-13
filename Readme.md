**Instructor**:

1.  Terraform the demo pc

2.  Get the output ip

3.  Get the admin password via the aws console **mstsc**

4.  RDP to the demo pc.

**Lesson 1 Preparation is everything**

-   Start admin powershell.

-   Install chocolatey

    -   **Set-ExecutionPolicy remotesigned**

    -   **iwr https://chocolatey.org/install.ps1 -UseBasicParsing | iex**

-   Install Minimum required packages

    -   **cinst awscli -y**

    -   **cinst packer -y**

    -   **cinst git -y**

    -   **cinst atom -y**

-   Restart shell

-   Clone demo repo

<!-- -->

-   **git clone <https://github.com/JamesWoolfenden/packerdemo.git>**

<!-- -->

-   Open Atom from the shell

    -   **atom .**

    -   Explain packer & terraform plugin for syntax.

    -   Generate an access key in [AWS console](http://console.aws.amazon.com).

<!-- -->

-   add to environment

-   **In the shell:**

<!-- -->

-   **aws configure**

    -   demonstrate packer installed

**Lesson 2 Building a LAMP stack AMI**

Open the [Lamp.json](packer/LAMP.json) file and [explain](Packer.md).

In the root of the repo:

-   **Packer build ./packer/LAMP.json**

Show the built AMI in the AWS [console](https://console.aws.amazon.com/console/home).
