variable "name" {}

variable "tags" {}

provider "aws" {
  default_tags {
    tags = var.tags
  }
}

module "ec2-key-pair" {
  source = "../../../"

  name = var.name
  tags = {
    example = "true"
  }
}
output "ec2-key-pair" { value = module.ec2-key-pair }
