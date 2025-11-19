variable "zone" {
  type    = string
  default = "ru-central1-b"
}

variable "network" {
  type    = string
  default = "ya-network"
}

variable "public_subnet_name" {
  type    = string
  default = "public-subnet"
}

variable "public_subnet_v4_cidr_blocks" {
  type    = list(string)
  default = ["192.168.10.0/24"]
}

variable "private_subnet_name" {
  type    = string
  default = "private-subnet"
}

variable "private_subnet_v4_cidr_blocks" {
  type    = list(string)
  default = ["192.168.20.0/24"]
}

