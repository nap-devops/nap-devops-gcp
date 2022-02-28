#TODO : Added gitlab SA IAM roles

locals {
  project  = "nap-devops-prod"
  region = "asia-southeast1"
}

inputs = {
  project = local.project
  vpc_name = "projects/nap-infra/global/networks/nap-vpc-prod"
  name_prefix = "nap-devops"
  top_level_domain = "devops.napbiotec.io"
  additional_domain_names = ["www.napbiotec.io", "napbiotec.io"]
  gce_wp_machine_type = "e2-small"
  gce_wp_subnet = "projects/nap-infra/regions/asia-southeast1/subnetworks/devops-prod-web"
  gce_ext_disk_size = "100"
  gce_wp_service_account = "gce-wp@${local.project}.iam.gserviceaccount.com"
  gce_wp_boot_disk = "projects/ubuntu-os-cloud/global/images/ubuntu-2004-focal-v20220204"
}



################################## Common ########################################

remote_state {
 backend = "gcs" 
 config = {
   bucket = "nap-prod-terraform-states"
   prefix = path_relative_to_include()
   project = "${local.project}"
   location = "${local.region}"
 }
}

generate "provider" {
  path = "provider.tf"

  if_exists = "overwrite_terragrunt"

  contents = <<EOF
provider "google" {
  project     = "${local.project}"
  region      = "${local.region}"
}

terraform {
  backend "gcs" {}
  required_providers {
    google = "4.10.0"
  }  
}
EOF
}
