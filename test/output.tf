output "url" {
  description = "Bucket URL (for single use)."
  value       = google_storage_bucket.bucket.url
}

output "bucket" {
  description = "The created storage bucket"
  value       = google_storage_bucket.bucket
}

output "name" {
  description = "Bucket name."
  value       = google_storage_bucket.bucket.bucket_name
}