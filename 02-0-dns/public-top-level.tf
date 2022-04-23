resource "google_dns_managed_zone" "top_level" {
  name     = "devops"
  dns_name = "${var.top_level_domain}."

  dnssec_config {
    state = "on"
  }
}

resource "google_dns_managed_zone" "top_level_admx" {
  name     = "admx"
  dns_name = "${var.top_level_domain2}."

  dnssec_config {
    state = "on"
  }
}