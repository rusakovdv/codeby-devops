output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = yandex_vpc_subnet.public.id
}

output "private_subnet_id" {
  description = "ID of the private subnet"
  value       = yandex_vpc_subnet.private.id
}