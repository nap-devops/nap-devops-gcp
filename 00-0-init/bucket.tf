# Bucket to deploy bootstrap script
resource "google_storage_bucket" "bucket" {
  name          = lower("${var.project}-bootstrap")
  location      = "ASIA"
  force_destroy = true
  
  uniform_bucket_level_access = true
  storage_class = "STANDARD"
  
  versioning {
    enabled = true
  }
}

resource "google_storage_bucket_object" "wp-deploy" {
  name          = "wp/bootstrap.bash"
  content       = file("bootstrap.bash")
  bucket        = "${google_storage_bucket.bucket.name}"
}


# Bucket to deploy application
resource "google_storage_bucket" "bucket-wp" {
  name          = lower("${var.project}-wp")
  location      = "ASIA"
  force_destroy = true
  
  uniform_bucket_level_access = true
  storage_class = "STANDARD"
  
  versioning {
    enabled = true
  }
}
