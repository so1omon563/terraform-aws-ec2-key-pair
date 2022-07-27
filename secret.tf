resource "aws_secretsmanager_secret" "ec2_key" {
  name        = local.key_name
  description = format("EC2 Key for %s", local.key_name)
  kms_key_id  = var.kms_arn
  tags        = local.tags
}

resource "aws_secretsmanager_secret_version" "ec2_key" {
  secret_id     = aws_secretsmanager_secret.ec2_key.id
  secret_string = tls_private_key.private_key.private_key_pem
}
