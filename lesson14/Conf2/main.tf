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


resource "yandex_vpc_security_group" "public_sg" {
  name       = "public-vm-sg"
  network_id = data.yandex_vpc_network.ya-network.id

  ingress {
    protocol       = "TCP"
    description    = "Allow SSH"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 22
  }
  ingress {
    protocol       = "TCP"
    description    = "Allow HTTP"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 80
  }
  ingress {
    protocol       = "TCP"
    description    = "Allow HTTPS"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 443
  }

  egress {
    protocol       = "ANY"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "yandex_vpc_security_group" "private_sg" {
  name       = "private-vm-sg"
  network_id = data.yandex_vpc_network.ya-network.id

  ingress {
    protocol       = "TCP"
    description    = "Allow SSH from trusted network"
    v4_cidr_blocks = ["0.0.0.0/0"] 
    port           = 22
  }
  ingress {
    protocol       = "TCP"
    description    = "Allow port 8080"
    v4_cidr_blocks = ["0.0.0.0/0"] 
    port           = 8080
  }

  egress {
    protocol       = "ANY"
    v4_cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "yandex_compute_instance" "public_vm" {
  name        = var.vm_1_name
  platform_id = var.platform
  zone        = var.zone

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.my_image.id
    }
  }

  network_interface {
    subnet_id          = data.yandex_vpc_subnet.public.id
    nat                = true
    security_group_ids = [yandex_vpc_security_group.public_sg.id]
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }

  # Установка Nginx с помощью provisioner
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y nginx",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
    ]

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file(var.private_key_path)
      host        = self.network_interface.0.nat_ip_address
    }
  }
}

resource "yandex_compute_instance" "private_vm" {
  name        = var.vm_2_name
  platform_id = var.platform
  zone        = var.zone

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.my_image.id
    }
  }

  network_interface {
    subnet_id          = data.yandex_vpc_subnet.private.id
    nat                = false
    security_group_ids = [yandex_vpc_security_group.private_sg.id]
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }
}

import { 
    to = yandex_compute_instance.import-vm 
    id = "epdqnqbogktqhpdqha8e" 
} 

resource "yandex_compute_instance" "import-vm" {
  allow_recreate            = null
  allow_stopping_for_update = null
  description               = null
  folder_id                 = "b1gn4ftvfr3rid4cmecp"
  gpu_cluster_id            = null
  hostname                  = "import-vm"
  labels                    = {}
  maintenance_grace_period  = null
  maintenance_policy        = null
  metadata = {
    ssh-keys  = "rusakov:ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAP++Es0oRgm"
    user-data = "#cloud-config\ndatasource:\n Ec2:\n  strict_id: false\nssh_pwauth: no\nusers:\n- name: rusakov\n  sudo: ALL=(ALL) NOPASSWD:ALL\n  shell: /bin/bash\n  ssh_authorized_keys:\n  - ssh-ed25519 AAAAC3NzaC1lZDI1NT"
  }
  name                      = "import-vm"
  network_acceleration_type = "standard"
  platform_id               = "standard-v3"
  service_account_id        = null
  zone                      = "ru-central1-b"
  boot_disk {
    auto_delete = true
    device_name = "epdsjku82kpht4asu9hp"
    disk_id     = "epdsjku82kpht4asu9hp"
    mode        = "READ_WRITE"
    initialize_params {
      block_size  = 4096
      description = null
      image_id    = "fd80von1v2g6rjn7oofk"
      kms_key_id  = null
      name        = "disk-ubuntu-24-04-lts-1763488865748"
      size        = 20
      snapshot_id = null
      type        = "network-ssd"
    }
  }
  metadata_options {
    aws_v1_http_endpoint = 1
    aws_v1_http_token    = 2
    gce_http_endpoint    = 1
    gce_http_token       = 1
  }
  network_interface {
    index              = 0
    ip_address         = "192.168.20.11"
    ipv4               = true
    ipv6               = false
    ipv6_address       = null
    nat                = true
    nat_ip_address     = "158.160.23.120"
    security_group_ids = []
    subnet_id          = "e2l09pliuocu8pc6mu9t"
  }
  placement_policy {
    host_affinity_rules       = []
    placement_group_id        = null
    placement_group_partition = 0
  }
  resources {
    core_fraction = 100
    cores         = 2
    gpus          = 0
    memory        = 2
  }
  scheduling_policy {
    preemptible = false
  }
}
