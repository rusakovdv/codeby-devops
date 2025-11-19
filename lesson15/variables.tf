variable "zone" {
  type    = string
  default = "ru-central1-b"
}

variable "target_zone" {
  description = "В какой зоне создать ВМ"
  type        = string
  default     = "ru-central1-b"
}

variable "target_vpc_name" {
  description = "Имя существующей сети в Yandex Cloud"
  type        = string
  default     = "default" # Обычно сеть по умолчанию называется 'default'
}