# Import EC2 Key Pair

Used to import an existing Key Pair into AWS so it can be used when launching instances.

Can also create an entry in Secrets Manager with the contents of the private key. This functionality is determined by the `private_key` input variable being populated or not.

If you wish to populate the secret separately, it is suggested you look into using the [secrets-manager](https://registry.terraform.io/modules/so1omon563/secrets-manager) module.

If tearing down a Key Pair, please note that the secret will remain in Secrets Manager for a minimum of 7 days, so the key name cannot be re-used during that time.

By default, the key name has a randomly generated hash at the end of it to help prevent this issue. The name can be overridden if desired, using the `key_name_override` input variable.

If you wish to force delete the key, you will need to use the CLI.

`aws secretsmanager delete-secret --secret-id <key-name> --force-delete-without-recovery`

## Populating the Private Key

**DO NOT** place your secrets in source control.

There are multiple options for passing in the `private_key` value without placing them in source control.

The most common options include:

#### Use a .tfvars file

Use a `terraform.tfvars` file that contains the value of `private_key`.

Make sure that you have `terraform.tfvars` in your `.gitignore` so it doesn't accidentally get committed.

An example of the format for that is here:

```
# terraform.tfvars

private_key = "string_value"

```

#### Pass in input variable on command line

Pass in the value of `private_key` on the command line when running Terraform.

An example is here:

```
terraform apply -var="private_key=string_value"
```

Depending on how you are calling the module, this option may not always work as expected.

#### Pass in input variable using environment variables

You can also set your input variable as an environment variable in your shell prior to running Terraform.

An example of `private_key` is here:

```
export TF_VAR_private_key=string_value
terraform apply
```
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

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_key_pair.imported_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair) | resource |
| [aws_secretsmanager_secret.ec2_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret) | resource |
| [aws_secretsmanager_secret_version.ec2_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version) | resource |
| [random_id.ec2_key](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_key_name_override"></a> [key\_name\_override](#input\_key\_name\_override) | The specific name you wish to use for the key pair, if you don't wish to use the default formatted name. Either this, or `name` must be set. | `string` | `null` | no |
| <a name="input_kms_arn"></a> [kms\_arn](#input\_kms\_arn) | The ARN of the KMS key to use for encrypting your secret. If left blank, the default encryption key will be used. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Short, descriptive name of the environment. All resources will be named using this value as a prefix. Either this or `key_name_override` must be set. | `string` | `null` | no |
| <a name="input_private_key"></a> [private\_key](#input\_private\_key) | The private key to import. Don't keep this value in source control! See `Populating the Private Key` in the README for more information. | `string` | n/a | yes |
| <a name="input_public_key"></a> [public\_key](#input\_public\_key) | The public key to import. See the [AWS Documentation](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html#how-to-generate-your-own-key-and-import-it-to-aws) for more information on supported formats. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tag names and values for tags to apply to all taggable resources created by the module. Default value is a blank map to allow for using Default Tags in the provider. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ec2_key_pair"></a> [ec2\_key\_pair](#output\_ec2\_key\_pair) | A map of properties for the imported EC2 Key. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
