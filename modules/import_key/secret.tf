resource "aws_secretsmanager_secret" "ec2_key" {
  count       = var.private_key == null ? 0 : 1
  name        = local.key_name
  description = format("EC2 Key for %s", local.key_name)
  kms_key_id  = var.kms_arn
  tags        = local.tags
}

resource "aws_secretsmanager_secret_version" "ec2_key" {
  count         = var.private_key == null ? 0 : 1
  secret_id     = aws_secretsmanager_secret.ec2_key[count.index].id
  secret_string = var.private_key
}
