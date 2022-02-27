resource "google_dns_managed_zone" "top_level" {
  name     = "devops"
  dns_name = "${var.top_level_domain}."

  dnssec_config {
    state = "on"
  }
}
