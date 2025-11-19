output "vm_public_ip" {
  value = module.create_vm.external_ip
}

output "network_map_debug" {
  value = module.vpc_info.subnet_ids_by_zone
}