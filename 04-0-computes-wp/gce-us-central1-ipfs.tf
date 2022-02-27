locals {
  usc1_region = var.ipfs_params.usc1[0]
  usc1_boot_disk_image = var.ipfs_params.usc1[1]
  usc1_tags = split(",", var.ipfs_params.usc1[2])
  usc1_vm_machine_type = var.ipfs_params.usc1[3]
  usc1_vm_user = var.ipfs_params.usc1[4]
  usc1_vm_ext_disk_size = var.ipfs_params.usc1[5]

  usc1_a_instances = var.ipfs_params.usc1[6] == "" ? [] : split("|", var.ipfs_params.usc1[6])
  usc1_b_instances = var.ipfs_params.usc1[7] == "" ? [] : split("|", var.ipfs_params.usc1[7])
  usc1_c_instances = var.ipfs_params.usc1[8] == "" ? [] : split("|", var.ipfs_params.usc1[8])
}

module "ipfs-gce-usc1-a" {
  for_each = toset(local.usc1_a_instances)

  source          = "../modules/gce"

  vm_name         = "ipfs-${local.usc1_region}-a"
  vm_sequence     = "${each.key}"
  vm_tags         = local.usc1_tags
  vm_service_account = var.gce_ipfs_service_account
  boot_disk_image  = local.usc1_boot_disk_image
  vm_machine_type  = local.usc1_vm_machine_type
  vm_zone          = "${local.usc1_region}-a"
  vm_user          = local.usc1_vm_user
  vm_subnet        = "ipfs-${local.usc1_region}-001"
  vm_ext_disk_size = local.usc1_vm_ext_disk_size
  project = var.project
  startup_script_path = "../00-1-scripts/rendered-ipfs.bash"
}

module "ipfs-gce-usc1-b" {
  for_each = toset(local.usc1_b_instances)

  source          = "../modules/gce"

  vm_name         = "ipfs-${local.usc1_region}-b"
  vm_sequence     = "${each.key}"
  vm_tags         = local.usc1_tags
  vm_service_account = var.gce_ipfs_service_account
  boot_disk_image  = local.usc1_boot_disk_image
  vm_machine_type  = local.usc1_vm_machine_type
  vm_zone          = "${local.usc1_region}-b"
  vm_user          = local.usc1_vm_user
  vm_subnet        = "ipfs-${local.usc1_region}-001"
  vm_ext_disk_size = local.usc1_vm_ext_disk_size
  project = var.project
  startup_script_path = "../00-1-scripts/rendered-ipfs.bash"
}

module "ipfs-gce-usc1-c" {
  for_each = toset(local.usc1_c_instances)

  source          = "../modules/gce"

  vm_name         = "ipfs-${local.usc1_region}-c"
  vm_sequence     = "${each.key}"
  vm_tags         = local.usc1_tags
  vm_service_account = var.gce_ipfs_service_account
  boot_disk_image  = local.usc1_boot_disk_image
  vm_machine_type  = local.usc1_vm_machine_type
  vm_zone          = "${local.usc1_region}-c"
  vm_user          = local.usc1_vm_user
  vm_subnet        = "ipfs-${local.usc1_region}-001"
  vm_ext_disk_size = local.usc1_vm_ext_disk_size
  project = var.project
  startup_script_path = "../00-1-scripts/rendered-ipfs.bash"
}
