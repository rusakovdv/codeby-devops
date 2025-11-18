data "yandex_vpc_network" "ya-network" {
  name = "ya-network"
}

data "yandex_vpc_subnet" "public" {
  name = "public-subnet"
}

data "yandex_vpc_subnet" "private" {
  name = "private-subnet"
}

data "yandex_compute_image" "my_image" {
  family = "ubuntu-2204-lts"
}