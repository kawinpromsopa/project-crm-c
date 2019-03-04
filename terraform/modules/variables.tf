variable "vpc_cidr" {}
variable "key_name" {}
variable "s3_bucket_name" {}

# Use with bash scripts
locals {
  customer = "${terraform.workspace}"
}

variable "default_instances_ami" {
  default = ""
}

variable "jenkins_instances_ami" {
  default = ""
}

variable "default_instances_type" {
  default = "t3.small"
}

variable "jenkins_instances_type" {
  default = "t3.small"
}

variable "name" {
  default = "Jenkins"
}

variable "region" {
  default = "ap-southeast-1"
}

variable "availability_zones" {
  default = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
}

variable "jenkins_volume_size" {
  default = "20"
}