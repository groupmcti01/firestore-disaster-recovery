terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.57.0"
    }
  }
}

provider "google" {
  project     = var.project_id
}


terraform {
  backend "gcs" {
    bucket = var.bucket_name_state
    region = var.location_bucket_tf
    key    = var.key_terraform
    prefix = var.environment
  }
}