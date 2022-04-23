
module "wp-gce-ase1-a" {
  source          = "../modules/gce"

  vm_name         = "wp-asia-southeast1-a" #Name is significant to instance group
  vm_sequence     = "00" #napbiotec.io
  vm_tags         = ["wordpress"]
  vm_service_account = var.gce_wp_service_account
  boot_disk_image  = var.gce_wp_boot_disk
  vm_machine_type  = var.gce_wp_machine_type
  vm_zone          = "asia-southeast1-a"
  vm_user          = "devops"
  vm_subnet        = var.gce_wp_subnet
  vm_ext_disk_size = var.gce_ext_disk_size
  project = var.project
  startup_script_path = "../00-1-scripts/rendered-wp.bash"
}

module "admx-gce-adm-ase1-a" {
  source          = "../modules/gce"

  vm_name         = "admx-asia-southeast1-a" #Name is significant to instance group
  vm_sequence     = "00"
  vm_tags         = ["wordpress"]
  vm_service_account = var.gce_wp_service_account
  boot_disk_image  = var.gce_wp_boot_disk
  vm_machine_type  = var.gce_wp_machine_type
  vm_zone          = "asia-southeast1-a"
  vm_user          = "devops"
  vm_subnet        = var.gce_wp_subnet
  vm_ext_disk_size = var.gce_ext_disk_size
  project = var.project
  startup_script_path = "scripts/startup-aldamex.bash"
}
