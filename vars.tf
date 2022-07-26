variable "key_name_override" {
  type        = string
  description = "The specific name you wish to use for the key pair, if you don't wish to use the default formatted name. Either this, or `name` must be set."
  default     = null
}

variable "name" {
  type        = string
  description = "Short, descriptive name of the environment. All resources will be named using this value as a prefix. Either this or `key_name_override` must be set."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "A map of tag names and values for tags to apply to all taggable resources created by the module. Default value is a blank map to allow for using Default Tags in the provider."
  default     = {}
}

variable "kms_arn" {
  type        = string
  description = "The ARN of the KMS key to use for encrypting your secret. If left blank, the default encryption key will be used."
  default     = null
}
