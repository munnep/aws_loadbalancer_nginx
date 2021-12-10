variable "tag_prefix" {
  default = "patrick"
}

variable "region" {
  default = "eu-central-1"
}

variable "vpc_cidr" {
  default = "10.233.0.0/16"  
  description = "which private subnet /16 do you want to use for the VPC"
}

variable "ami" {
  default     = "ami-0a49b025fffbbdac6"
  description = "Must be an Ubuntu image that is available in the region you choose"
}
