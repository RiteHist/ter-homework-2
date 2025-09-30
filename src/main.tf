resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone[0]
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = [var.default_cidr[0]]
}

resource "yandex_vpc_subnet" "subnet_db" {
  name = var.subnet_db
  zone = var.default_zone[1]
  network_id = yandex_vpc_network.develop.id
  v4_cidr_blocks = [var.default_cidr[1]]
}


data "yandex_compute_image" "ubuntu" {
  family = var.image_family
}
resource "yandex_compute_instance" "platform" {
  name        = local.vm_web_name
  platform_id = var.vms_resources["web"].platform_id
  resources {
    cores         = var.vms_resources["web"].cores
    memory        = var.vms_resources["web"].memory
    core_fraction = var.vms_resources["web"].core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vms_resources["web"].preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = var.vms_resources["web"].nat
  }

  metadata = local.vm_metadata_ssh

}

resource "yandex_compute_instance" "vm_db" {
  name = local.vm_db_name
  platform_id = var.vms_resources["db"].platform_id
  resources {
    cores = var.vms_resources["db"].cores
    memory = var.vms_resources["db"].memory
    core_fraction = var.vms_resources["db"].core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = var.vms_resources["db"].preemptible
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.subnet_db.id
    nat       = var.vms_resources["db"].nat
  }
  metadata = local.vm_metadata_ssh
  zone = var.default_zone[1]
}