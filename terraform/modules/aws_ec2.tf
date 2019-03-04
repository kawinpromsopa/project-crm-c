resource "aws_instance" "jenkins" {
  ami                         = "${var.jenkins_instances_ami}"
  instance_type               = "${var.jenkins_instances_type}"
  subnet_id                   = "${aws_subnet.a0.id}"
  associate_public_ip_address = true
  key_name                    = "${var.key_name}"

  root_block_device {
    volume_size = 16
    volume_type = "gp2"
  }

  vpc_security_group_ids = [
    "${aws_security_group.common.id}",
  ]

  tags {
    Name      = "${var.name}"
    Component = "${var.name}"
  }

  lifecycle {
    prevent_destroy = true

    ignore_changes = [
      "ami",
      "user_data",
      "root_block_device",
    ]
  }
}
