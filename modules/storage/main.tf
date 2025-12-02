# Final storage bucket for logs of the log bucket
# checkov:skip=CKV_GCP_62 "Final log bucket does not log access"
# checkov:skip=CKV_GCP_63 "Final log bucket should not log to itself"
resource "google_storage_bucket" "log_bucket_logs" {
  name     = "${var.bucket_name}-logs-storage"
  location = var.region

  uniform_bucket_level_access = true
  public_access_prevention    = "enforced"

  versioning {
    enabled = true
  }
}

# Main log bucket
resource "google_storage_bucket" "log_bucket" {
  name     = "${var.bucket_name}-logs"
  location = var.region

  uniform_bucket_level_access = true
  public_access_prevention    = "enforced"

  versioning {
    enabled = true
  }

  logging {
    log_bucket        = google_storage_bucket.log_bucket_logs.name
    log_object_prefix = "logs"
  }
}

# Main application bucket
resource "google_storage_bucket" "my_bucket" {
  name     = var.bucket_name
  location = var.region

  versioning {
    enabled = var.enable_versioning ? true : false
  }

  public_access_prevention = "enforced"
  uniform_bucket_level_access = true

  logging {
    log_bucket        = google_storage_bucket.log_bucket.name
    log_object_prefix = "access-logs"
  }
}