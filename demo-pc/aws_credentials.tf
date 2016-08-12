provider "aws" {
  region     = "eu-west-1"
}

resource "aws_key_pair" "redwolf" {
  key_name   = "redwolf"
  public_key = "${file("${path.module}/../secret/redwolfdemo.pub")}"
}
