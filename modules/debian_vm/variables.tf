variable "ssh_user" {
  type        = string
  description = "Username of attached to the SSH key"
  default     = "ogabiprince"
}

variable "pubkey_file" {
  type        = string
  description = "SSH public key"
  default     = "../.keys/vm_keys.pub"
}

variable "network_name" {
  type        = string
  description = "The name of the VPC network"
  default     = "terraform-network"
}

variable "environment" {
  type        = string
  description = "dev, staging or prod"
  default     = "dev"
}