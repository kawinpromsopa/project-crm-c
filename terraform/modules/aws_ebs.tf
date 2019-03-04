resource "aws_ebs_volume" "jenkins" {
  availability_zone = "${aws_instance.jenkins.availability_zone}"
  size              = "${var.jenkins_volume_size}"
  type              = "gp2"

  tags {
    Name     = "${var.customer}-jenkins"
    Customer = "${var.customer}"
    Type     = "jenkins"
    Snapshot = "jenkins"
  }

  lifecycle {
    ignore_changes = [
      "size",
      "snapshot_id",
    ]
  }
}

resource "aws_volume_attachment" "jenkins" {
  device_name  = "/dev/xvdf"
  volume_id    = "${aws_ebs_volume.jenkins.id}"
  instance_id  = "${aws_instance.jenkins.id}"
  force_detach = true
}
