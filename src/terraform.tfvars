cloud_id = "b1gfju9irjmi29ag2kvk"
folder_id = "b1g3ce2ml8s4bt24vm77"
default_cidr = ["10.0.1.0/24", "10.0.2.0/24"]
default_zone = ["ru-central1-a", "ru-central1-b"]
vms_resources = {
  "web" = {
    cores = 2
    memory = 1
    core_fraction = 20
    preemptible = true
    nat = true
    platform_id = "standard-v4a"
  }
  "db" = {
    cores = 2
    memory = 2
    core_fraction = 20
    preemptible = true
    nat = true
    platform_id = "standard-v4a"
  }
}
vm_metadata = {
  "serial-port-enable" = "1"
}