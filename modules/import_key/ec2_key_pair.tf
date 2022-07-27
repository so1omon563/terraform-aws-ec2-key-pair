resource "aws_key_pair" "imported_key" {
  key_name   = local.key_name
  public_key = var.public_key
  tags       = local.tags
}
