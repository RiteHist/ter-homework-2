variable "environment" {
    type = list(string)
    default = ["develop", "stage", "production"]
}

variable "role" {
    type = list(string)
    default = ["web", "db"]
}

variable "project" {
    type = string
    default = "netology"
}

/*
variable "vm_web_name" {
  type = string
  default = "netology-develop-platform-web"
}

variable "vm_db_name" {
    type = string
    default = "netology-develop-platform-db"
}
*/

variable "vm_web_platform_id" {
  type = string
  default = "standard-v4a"
}

variable "vm_db_plaftorm_id" {
    type = string
    default = "standard-v4a"
}

variable "vm_web_cores" {
  type = number
  default = 2
}

variable "vm_db_cores" {
    type = number
    default = 2
}

variable "vm_web_memory" {
  type = number
  default = 1
}

variable "vm_db_memory" {
    type = number
    default = 2
}

variable "vm_web_core_fraction" {
  type = number
  default = 20
}

variable "vm_db_core_fraction" {
    type = number
    default = 20
}

variable "vm_web_preemptible" {
  type = bool
  default = true
}

variable "vm_db_preemptible" {
    type = bool
    default = true
}

variable "vm_web_nat" {
  type = bool
  default = true
}

variable "vm_db_nat" {
    type = bool
    default = true
}

variable "vm_web_metadata_serial_port" {
    type = string
    default = "1"
}

variable "vm_db_metadata_serial_port" {
    type = string
    default = "1"
}