
module "group-wp-ase1" {
  source  = "../modules/instance-group"

  project = var.project
  region = "asia-southeast1"
  type = "wp"
  zone_a_instances = ["00"]
  zone_b_instances = []
  zone_c_instances = []
}

module "group-wp-adm-ase1" {
  source  = "../modules/instance-group"

  project = var.project
  region = "asia-southeast1"
  type = "wp"
  zone_a_instances = ["aldamex"]
  zone_b_instances = []
  zone_c_instances = []
}
