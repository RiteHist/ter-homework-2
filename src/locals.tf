locals {
    vm_web_name = "${var.project}-${var.environment[0]}-platform-${var.role[0]}"
    vm_db_name = "${var.project}-${var.environment[0]}-platform-${var.role[1]}"
}