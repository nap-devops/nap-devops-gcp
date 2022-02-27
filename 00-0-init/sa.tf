#### IPFS ###

resource "google_service_account" "wp_service_account" {
  account_id   = "gce-wp"
  display_name = "Terraform - GCE service account for Wordpress"
}

resource "google_project_iam_member" "wp_storage_viewer" {
  project = var.project
  role    = "roles/storage.objectViewer"
  member  = "serviceAccount:${google_service_account.ipfs_service_account.email}"
}

resource "google_project_iam_member" "wp_sm_accessor" {
  project = var.project
  role    = "roles/secretmanager.secretAccessor"
  member  = "serviceAccount:${google_service_account.ipfs_service_account.email}"
}
