terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

data "yandex_vpc_network" "selected" {
  name = var.vpc_name
}

data "yandex_vpc_subnet" "all_subnets" {
  for_each = toset(data.yandex_vpc_network.selected.subnet_ids)
  subnet_id = each.value
}