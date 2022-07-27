locals {
  key_name = var.key_name_override != null ? var.key_name_override : format("%s-key-%s", var.name, random_id.ec2_key.hex)
  tags     = var.tags
}
