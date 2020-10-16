resource "aws_security_group" "windemopc" {
  name        = "windemopc"
  description = "Terraform security group"

  #rdp
  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = var.cidr
  }

  #winrm
  ingress {
    from_port   = 5985
    to_port     = 5985
    protocol    = "tcp"
    cidr_blocks = var.cidr
  }

  #http
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.cidr
  }

  // allows traffic from the SG itself for tcp
  ingress {
    from_port = 0
    to_port   = 65535
    protocol  = "tcp"
    self      = true
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = var.cidr
  }
}
 
