resource "aws_instance" "demopc" {
  key_name      = "${aws_key_pair.redwolf.key_name}"
   ami="ami-6fd5b81c"
   instance_type="t2.micro"
   security_groups = ["${aws_security_group.demopc.name}"]
}
