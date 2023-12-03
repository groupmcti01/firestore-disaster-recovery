resource "google_storage_bucket" "bucket_tf_state" {
    name = var.bucket_name_state
    location = var.region
       
    versioning = var.versioning
}