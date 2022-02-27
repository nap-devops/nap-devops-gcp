#TODO : Added gitlab SA IAM roles

locals {
  project  = "nap-devops-nonprod"
  region = "asia-southeast1"
}

inputs = {
  project = local.project
  name_prefix = "nap-devops"
  top_level_domain = "devops-dev.napbiotec.io"

  gce_wp_service_account = "gce-wp@${local.project}.iam.gserviceaccount.com"
}



################################## Common ########################################

remote_state {
 backend = "gcs" 
 config = {
   bucket = "nap-dev-terraform-states"
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
