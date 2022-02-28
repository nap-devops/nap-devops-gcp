locals {
  prefix = "wp"
}

module "wp-lb" {
  source                = "../modules/http-load-balancer"
  name                  = "${local.prefix}-${var.name}"
  project               = var.project

  dns_managed_zone_name = "devops"
  custom_domain_names   = [ "wp.${var.top_level_domain}" ]
  create_dns_entries    = true
  dns_record_ttl        = var.wp_dns_record_ttl
  enable_http           = false
  enable_ssl            = true
  instances_regions     = ["asia-southeast1"]
  prefix                = local.prefix

  custom_labels = var.custom_labels
}