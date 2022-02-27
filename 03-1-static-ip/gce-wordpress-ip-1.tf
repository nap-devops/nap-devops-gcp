/*
resource "google_compute_global_address" "gce_wp" {
  project      = var.project
  name         = "gce-wp-1"
  ip_version   = "IPV4"
  address_type = "EXTERNAL"
}

resource "google_dns_record_set" "gce_wp_dns_1" {
  project = var.project

  name = "wordpress.${var.top_level_domain}."
  type = "A"
  ttl  = 300
  managed_zone = "devops"

  rrdatas = [google_compute_global_address.gce_wp.address]
}
*/