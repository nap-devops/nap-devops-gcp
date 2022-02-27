locals {
  ase1_region = var.ipfs_params.ase1[0]
  ase1_boot_disk_image = var.ipfs_params.ase1[1]
  ase1_tags = split(",", var.ipfs_params.ase1[2])
  ase1_vm_machine_type = var.ipfs_params.ase1[3]
  ase1_vm_user = var.ipfs_params.ase1[4]
  ase1_vm_ext_disk_size = var.ipfs_params.ase1[5]

  ase1_a_instances = var.ipfs_params.ase1[6] == "" ? [] : split("|", var.ipfs_params.ase1[6])
  ase1_b_instances = var.ipfs_params.ase1[7] == "" ? [] : split("|", var.ipfs_params.ase1[7])
  ase1_c_instances = var.ipfs_params.ase1[8] == "" ? [] : split("|", var.ipfs_params.ase1[8])  
}

module "ipfs-gce-ase1-a" {
  for_each = toset(local.ase1_a_instances)

  source          = "../modules/gce"

  vm_name         = "ipfs-${local.ase1_region}-a"
  vm_sequence     = "${each.key}"
  vm_tags         = local.ase1_tags
  vm_service_account = var.gce_ipfs_service_account
  boot_disk_image  = local.ase1_boot_disk_image
  vm_machine_type  = local.ase1_vm_machine_type
  vm_zone          = "${local.ase1_region}-a"
  vm_user          = local.ase1_vm_user
  vm_subnet        = "ipfs-${local.ase1_region}-001"
  vm_ext_disk_size = local.ase1_vm_ext_disk_size
  project = var.project
  startup_script_path = "../00-1-scripts/rendered-ipfs.bash"
}

module "ipfs-gce-ase1-b" {
  for_each = toset(local.ase1_b_instances)

  source          = "../modules/gce"

  vm_name         = "ipfs-${local.ase1_region}-b"
  vm_sequence     = "${each.key}"
  vm_tags         = local.ase1_tags
  vm_service_account = var.gce_ipfs_service_account
  boot_disk_image  = local.ase1_boot_disk_image
  vm_machine_type  = local.ase1_vm_machine_type
  vm_zone          = "${local.ase1_region}-b"
  vm_user          = local.ase1_vm_user
  vm_subnet        = "ipfs-${local.ase1_region}-001"
  vm_ext_disk_size = local.ase1_vm_ext_disk_size
  project = var.project
  startup_script_path = "../00-1-scripts/rendered-ipfs.bash"
}

module "ipfs-gce-ase1-c" {
  for_each = toset(local.ase1_c_instances)

  source          = "../modules/gce"

  vm_name         = "ipfs-${local.ase1_region}-c"
  vm_sequence     = "${each.key}"
  vm_tags         = local.ase1_tags
  vm_service_account = var.gce_ipfs_service_account
  boot_disk_image  = local.ase1_boot_disk_image
  vm_machine_type  = local.ase1_vm_machine_type
  vm_zone          = "${local.ase1_region}-c"
  vm_user          = local.ase1_vm_user
  vm_subnet        = "ipfs-${local.ase1_region}-001"
  vm_ext_disk_size = local.ase1_vm_ext_disk_size
  project = var.project
  startup_script_path = "../00-1-scripts/rendered-ipfs.bash"
}
