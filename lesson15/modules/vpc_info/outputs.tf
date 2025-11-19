output "subnet_ids_by_zone" {
  description = "Map: Zone -> Subnet ID. Используется для автовыбора подсети."
  value = {
    for id, s in data.yandex_vpc_subnet.all_subnets : s.zone => s.id
  }
}