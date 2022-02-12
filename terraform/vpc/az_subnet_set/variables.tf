locals {
  availability_zone_ender_string = substr(var.availability_zone, -2, 2)
}

variable "vpc_id" {
  type        = string
  description = "ID of the VPC"
}

variable "availability_zone" {
  type        = string
  description = "AZ of the Subnet"
}

variable "resource_name_prefix" {
  type        = string
  description = "Prefix of the name for created resources"
}

variable "public_subnet_info" {
  type        = object({ cidr_block = string, route_table_id = string })
  description = "Object with the CIDR block & Route Table ID of the public subnet"
  default     = null
}

variable "map_public_ip_on_launch" {
  type        = bool
  description = "Whether to map a public IP on launch in the public subnet"
  default     = true
  validation {
    # Restrict to either true or false
    condition     = var.map_public_ip_on_launch == true || var.map_public_ip_on_launch == false
    error_message = "Invalid value for map_public_ip_on_launch, please use true/false only."
  }
}

variable "private_subnet_info" {
  type        = object({ cidr_block = string, route_table_id = string })
  description = "Object with the CIDR block & Route Table ID of the private subnet"
  default     = null
}
