output "public_vm_external_ip" {
  description = "External IP address of the public VM"
  value       = yandex_compute_instance.public_vm.network_interface.0.nat_ip_address
}

output "private_vm_internal_ip" {
  description = "Internal IP address of the private VM"
  value       = yandex_compute_instance.private_vm.network_interface.0.ip_address
}