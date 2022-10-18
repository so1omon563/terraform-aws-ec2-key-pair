# Basic usage

Basic usage example.

Example shows using Default Tags in the provider as well as passing additional tags into the resource.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


## Examples

```hcl
provider "aws" {
  default_tags {
    tags = {
      environment = "dev"
      terraform   = "true"
    }
  }
}

module "ec2-key-pair" {
  source  = "so1omon563/ec2-key-pair/aws/"
  version = "2.0.0" # Replace with appropriate version

  name = "example-ec2-key-pair"
  tags = {
    example = "true"
  }
}
output "ec2-key-pair" {
  value = module.ec2-key-pair
}
```

## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_ec2-key-pair"></a> [ec2-key-pair](#module\_ec2-key-pair) | so1omon563/ec2-key-pair/aws/ | 2.0.0 |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ec2-key-pair"></a> [ec2-key-pair](#output\_ec2-key-pair) | n/a |


<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
