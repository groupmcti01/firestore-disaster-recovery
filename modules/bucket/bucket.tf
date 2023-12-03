# Create new storage bucket in the northamerica-northeast1 region
# with standard storage
# https://cloud.google.com/storage/docs/terraform-create-bucket-upload-object

resource "google_storage_bucket" "capstone2-mcti-bucket" {
                   
  name          = "${var.project_id}-${var.project_name}-${var.organization}-${var.bucket_name}-${var.environment}"
  location      = "northamerica-northeast1"
  project       = "${var.project_id}-${var.project_name}-${var.organization}-${var.environment}"
  storage_class = var.storage_class
  uniform_bucket_level_access = var.uniform_bucket_level_access

  retention_policy {
    # 10 days retention in seconds
    retention_period = var.retention_period
  }

  lifecycle_rule {
    condition {
      # days  
      age = var.lifecycle_rule_age_coldline
    }
    action {
      type = var.lifecycle_rule_set_storage_type
      storage_class = var.lifecycle_rule_set_storage_class
    }
  }

  lifecycle_rule {
    condition {
      # days  
      age = var.lifecycle_rule_age_deletion
    }
    action {
      type = var.lifecycle_rule_set_deletion
    }
  }
}
