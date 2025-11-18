variable "zone" {
  type    = string
  default = "ru-central1-b"
}

variable "private_key_path" {
  description = "Path to the private key for SSH access"
  type        = string
  default     = "/.ssh/id_ed25519"
}

variable "public_key_path" {
  description = "Path to the public key for SSH access"
  type        = string
  default     = "/.ssh/id_ed25519.pub"
}

variable "vm_1_name" {
  type    = string
  default = "public-vm"
}

variable "vm_2_name" {
  type    = string
  default = "private-vm"
}

variable "platform" {
  type = string
  default = "standard-v1"
}

