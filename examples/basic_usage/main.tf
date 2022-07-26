provider "aws" {
  default_tags {
    tags = {
      environment = "dev"
      terraform   = "true"
    }
  }
}

module "ec2-key-pair" {
  # source  = "so1omon563/ec2-key-pair/aws/"
  # version = "1.0.0" # Replace with appropriate version

  source = "../../"

  name = "example-ec2-key-pair"
  tags = {
    example = "true"
  }
}
output "ec2-key-pair" {
  value = module.ec2-key-pair
}
