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

module "vpc_info" {
  source   = "./modules/vpc_info"
  vpc_name = var.target_vpc_name
}

module "create_vm" {
  source = "./modules/create_vm"
  vm_name  = "lesson15-homework-vm"
  image_id = data.yandex_compute_image.my_image.id
  vm_zone  = var.zone
  subnet_map = module.vpc_info.subnet_ids_by_zone
}