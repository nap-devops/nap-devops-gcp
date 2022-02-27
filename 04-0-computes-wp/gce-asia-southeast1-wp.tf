
module "wp-gce-ase1-a" {
  source          = "../modules/gce"

  vm_name         = "nap-devops-wp-ase1-a"
  vm_sequence     = "00"
  vm_tags         = "wordpress"
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
