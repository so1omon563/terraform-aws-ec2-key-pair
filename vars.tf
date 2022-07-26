variable "name" {
  type        = string
  description = "Short, descriptive name of the environment. All resources will be named using this value as a prefix. See [aws_sns_topic](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic#name) for more information on name restrictions / requirements."
}

variable "tags" {
  type        = map(string)
  description = "A map of tag names and values for tags to apply to all taggable resources created by the module. Default value is a blank map to allow for using Default Tags in the provider."
  default     = {}
}

variable "kms_arn" {
  type        = string
  description = "The ARN of the KMS key to use for encrypting your secrets. If left blank, the default encryption key will be used."
  default     = null
}
