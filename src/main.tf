resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

resource "yandex_vpc_subnet" "subnet_db" {
  name = var.subnet_db
  zone = var.vm_db_zone
  network_id = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.cidr_db
}


data "yandex_compute_image" "ubuntu" {
  family = var.image_family
}
resource "yandex_compute_instance" "platform" {
  name        = var.vm_web_name
  platform_id = var.vm_web_platform_id
  resources {
    cores         = var.vm_web_cores
    memory        = var.vm_web_memory
    core_fraction = var.vm_web_core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_web_preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.vm_web_nat
  }

  metadata = {
    serial-port-enable = var.vm_web_metadata_serial_port
    ssh-keys           = "ubuntu:${file(var.vms_ssh_root_key)}"
  }

}

resource "yandex_compute_instance" "vm_db" {
  name = var.vm_db_name
  platform_id = var.vm_db_plaftorm_id
  resources {
    cores = var.vm_db_cores
    memory = var.vm_db_memory
    core_fraction = var.vm_db_core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vm_db_preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.subnet_db.id
    nat       = var.vm_web_nat
  }
  metadata = {
    serial-port-enable = var.vm_db_metadata_serial_port
    ssh-keys           = "ubuntu:${file(var.vms_ssh_root_key)}"
  }
  zone = var.vm_db_zone
}