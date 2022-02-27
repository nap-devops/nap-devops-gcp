variable "gce_wp_service_account" {
  type = string
  nullable = false 
}

variable "gce_wp_boot_disk" {
  type = string
  nullable = false 
}

variable "project" {
  type     = string
  nullable = false
  default = ""
}

variable "gce_ext_disk_size" {
  type     = string
  nullable = false
  default = ""
}

variable "gce_wp_machine_type" {
  type     = string
  nullable = false
  default = ""
}
