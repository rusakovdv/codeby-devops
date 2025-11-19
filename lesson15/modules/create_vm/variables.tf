variable "vm_name" {
  type = string
}

variable "vm_zone" {
  description = "Зона доступности для ВМ"
  type        = string
}

variable "subnet_map" {
  description = "Карта { zone = subnet_id } из модуля vpc_info"
  type        = map(string)
}

variable "public_key_path" {
  description = "Path to the public key for SSH access"
  type        = string
  default     = "c:/Users/RusakovD/.ssh/id_ed25519.pub"
}

variable "image_id" {
  description = "ID образа загрузочного диска"
  type        = string
}