build {
sources=[
  "source.amazon-ebs.base1604"
  ]

  provisioner "shell" {
     inline=[
        "sudo apt-get update -y",
        "sudo apt-get install apache2 -y",
        "sudo apt-get install mysql-server -y",
        "sudo apt-get install libapache2-mod-auth-mysql -y",
        "sudo apt-get install php5-mysql -y",
        "sudo mysql_install_db"]
  }
}
