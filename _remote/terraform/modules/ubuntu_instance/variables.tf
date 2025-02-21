variable "name" {
  type        = string
  description = "Name of the EC2 instance"
}

variable "key_name" {
  type        = string
  description = "SSH key name to use for the EC2 instance"
}

variable "ansible_groups" {
  type        = list(string)
  description = "Ansible groups to add the EC2 instance to"
  default     = []
}
