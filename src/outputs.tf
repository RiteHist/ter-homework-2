output "ip_info" {
    value = {
        vm_db = {
            instance_name = yandex_compute_instance.vm_db.name
            ip_external = yandex_compute_instance.vm_db.network_interface[0].nat_ip_address
            fqdn = yandex_compute_instance.vm_db.fqdn
        },
        vm_web = {
            instance_name = yandex_compute_instance.platform.name
            ip_external = yandex_compute_instance.platform.network_interface[0].nat_ip_address
            fqdn = yandex_compute_instance.platform.fqdn
        }
    }
}