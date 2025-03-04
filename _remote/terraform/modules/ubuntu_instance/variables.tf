variable "name" {
  type        = string
  description = "The name to assign to the EC2 instance. This will be used as a tag for identification."
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet where the EC2 instance will be launched."
}

variable "type" {
  type        = string
  description = "The instance type to use for the EC2 instance (e.g., t3.micro, t2.medium)."
  default     = "t3.micro"
}

variable "key_name" {
  type        = string
  description = "The name of the SSH key pair to associate with the EC2 instance for secure access. Set to null if not required."
  default     = null
}

variable "allow_ssh" {
  type        = bool
  description = "Enable or disable SSH access (port 22) to the EC2 instance. If true, an ingress rule allowing SSH will be created."
  default     = false
}

variable "groups" {
  type        = list(string)
  description = "A list of groups to associate with the EC2 instance (e.g., for Ansible or organizational purposes)."
  default     = []
}

variable "extra_tags" {
  type        = map(string)
  description = "A map of additional tags to apply to the EC2 instance. These tags help with resource organization and cost tracking."
  default     = {}
}
