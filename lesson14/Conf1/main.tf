terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

provider "yandex" {
  zone = var.zone
}

resource "yandex_vpc_network" "default" {
  name = var.network
}

resource "yandex_vpc_subnet" "public" {
  network_id     = yandex_vpc_network.default.id
  name           = var.public_subnet_name
  v4_cidr_blocks = var.public_subnet_v4_cidr_blocks
  zone           = var.zone
}

resource "yandex_vpc_subnet" "private" {
  name           = var.private_subnet_name
  zone           = var.zone
  network_id     = yandex_vpc_network.default.id
  v4_cidr_blocks = ["192.168.20.0/24"]
}