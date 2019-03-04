locals {
  customer = "${terraform.workspace}"
}

variable "vpc_cidr" {}

variable "region" {
  default = "ap-southeast-1"
}

variable "availability_zones" {
  default = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
}

variable "key_name" {
  default = "crmc_key2"
}

variable "s3_bucket_name" {
  default = ""
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

