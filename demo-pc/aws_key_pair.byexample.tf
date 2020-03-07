resource "aws_key_pair" "byexample" {
  key_name   = "byexample"
  public_key = tls_private_key.byexample.public_key_openssh
}

resource "tls_private_key" "byexample" {
  algorithm = "RSA"
}

resource "local_file" "publickey" {
  content  = tls_private_key.byexample.public_key_openssh
  filename = "${path.module}/id_rsa.byexample.pub"
}

resource "local_file" "privatekey" {
  content  = tls_private_key.byexample.private_key_pem
  filename = "${path.module}/id_rsa.byexample"
}
