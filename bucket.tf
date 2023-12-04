resource "google_storage_bucket" "bucket_tf_state" {
    name = var.bucket_name_state
    location = var.location_bucket_tf
    project  = "${var.project_id}-${var.organization}-${var.project_name}-${var.environment}"

    versioning {
      enabled = var.versioning
    }
}