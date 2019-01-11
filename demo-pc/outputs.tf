output "public ip" {
  value = "${aws_instance.demopc.public_ip}"
}
