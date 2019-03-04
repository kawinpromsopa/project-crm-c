terraform {
  backend "s3" {
    bucket = "CRMC_TERRAFORM_STATE"
    region = "ap-southeast-1"
    key    = "crm-c.tfstate"
  }
}

provider "aws" {
  region = "${var.region}"
}

provider "aws" {
  region = "ap-southeast-1"
  alias  = "ap-southeast-1"
}

module "aboutops.io" {
  source                      = "./modules"
  customer                    = "${local.customer}"
  region                      = "${var.region}"
  availability_zone           = "${var.availability_zone}"
  vpc_cidr                    = "${var.vpc_cidr}"
  key_name                    = "${var.key_name}"
  jenkins_instances_type      = "${var.jenkins_instances_type}"
  base_ami                    = "${var.base_ami}"
  s3_bucket_name              = "${var.s3_bucket_name}"
#  s3_secret_bucket_name      = "secret-bucket"

  providers {
    # for object in s3 secret bucket
    aws.ap-southeast-1 = "aws.ap-southeast-1"
  }
}

