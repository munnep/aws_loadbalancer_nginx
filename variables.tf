variable "tag_prefix" {
  default = "patrick"
}

variable "region" {
  default = "eu-central-1"
}

variable "ami" {
  default     = "ami-0a49b025fffbbdac6"
  description = "Must be an Ubuntu image that is available in the region you choose"
}
