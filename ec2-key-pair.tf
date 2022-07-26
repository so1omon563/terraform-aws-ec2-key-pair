resource "tls_private_key" "private_key" {
  algorithm = "RSA"
  rsa_bits  = 2048
}

resource "aws_key_pair" "generated_key" {
  key_name   = format("%s-key-%s", var.name, random_id.ec2_key.hex)
  public_key = tls_private_key.private_key.public_key_openssh
  tags       = local.tags
}

resource "random_id" "ec2_key" {
  byte_length = 2
}

resource "aws_secretsmanager_secret" "ec2_key" {
  name        = format("%s-key-%s", var.name, random_id.ec2_key.hex)
  description = format("EC2 Key for %s", var.name)
  kms_key_id  = var.kms_arn
  tags        = local.tags
}

resource "aws_secretsmanager_secret_version" "ec2_key" {
  secret_id     = aws_secretsmanager_secret.ec2_key.id
  secret_string = tls_private_key.private_key.private_key_pem
}
