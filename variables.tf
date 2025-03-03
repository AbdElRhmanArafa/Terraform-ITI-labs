variable "project_name" {
  description = "The name of the project"
  type        = string
}
variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}
variable "subnets_list" {
  type = list(object({
    name              = string
    cidr              = string
    type              = string
    availability_zone = string
  }))
}

variable "ec2_config" {
  type = list(object({
    name          = string
    instance_type = string
    ami           = string
    key_name      = string
    subnet_name   = string
  }))
}