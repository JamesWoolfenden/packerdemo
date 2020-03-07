resource "aws_instance" "demopc" {
  key_name        = aws_key_pair.byexample.key_name
  ami             = var.ami
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.windemopc.name]
}

variable "ami" {
  default = "ami-6fd5b81c"
}
