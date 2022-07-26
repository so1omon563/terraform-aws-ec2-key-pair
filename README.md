# EC2 Key Pair

Creates an EC2 Key Pair that can be used when launching instances.

Also creates an entry in Secrets Manager with the contents of the private key.

If tearing down a Key Pair, please note that the secret will remain in Secrets Manager for a minimum of 7 days, so the key name cannot be re-used during that time.

The key name has a randomly generated hash at the end of it to help prevent this issue.

If you wish to force delete the key, you will need to use the CLI.

`aws secretsmanager delete-secret --secret-id <key-name> --force-delete-without-recovery`

Examples for use can be found under the [examples](https://github.com/so1omon563/terraform-aws-ec2-key-pair/tree/main/examples) directory.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
Auto-generated technical documentation is created using [`terraform-docs`](https://terraform-docs.io/)

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.38 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.23.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.3.2 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_key_pair.generated_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_secretsmanager_secret.ec2_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret) | resource |
| [aws_secretsmanager_secret_version.ec2_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) | resource |
| [random_id.ec2_key](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [tls_private_key.private_key](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_kms_arn"></a> [kms\_arn](#input\_kms\_arn) | The ARN of the KMS key to use for encrypting your secrets. If left blank, the default encryption key will be used. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Short, descriptive name of the environment. All resources will be named using this value as a prefix. See [aws\_sns\_topic](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic#name) for more information on name restrictions / requirements. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tag names and values for tags to apply to all taggable resources created by the module. Default value is a blank map to allow for using Default Tags in the provider. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ec2_key_pair"></a> [ec2\_key\_pair](#output\_ec2\_key\_pair) | A map of properties for the generated EC2 Key pair. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
