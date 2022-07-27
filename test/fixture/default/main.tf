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

module "imported-ec2-key-pair" {
  source = "../../..//modules/import_key/"

  name        = var.name
  public_key  = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDGMWd8hF4dNCWcoPWcwdPmFV8ZrvfxlGwlw7zzICIkxJIvzNDu0IDSh31HymX+C0gd/h4ZplS6+1n1j3RjUEyRAy9Z+effUJ66EYoXRqWLXhFQ741tT4Tsaiu6oJGQ96Yh15tCoaCIQQGTKo+GOqzDYVp1JZrd4offnz7RjKOQFDWXubyzDvvrBfELQfPc1tIxErQ4eu6o7mP4uFkc31BPnnxS9sWb2/5BaBCQlQ7Clg04jrYTtv/7m+rlVUJVEGdRXLrDbp4+E/TOdNleI23/w0uM92kYSgm8SrTWYbJSo3Sg04BCAh+USRw/lgtB3qYBmwTI/Vfwr3dLCdcVAeeH"
  private_key = "dummy string" # Don't put real secrets in source control!!!!
  tags = {
    example = "true"
  }
}
output "imported-ec2-key-pair" { value = module.imported-ec2-key-pair }
