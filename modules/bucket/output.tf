output "bucket" {
  description = "The created storage bucket"
  value       = google_storage_bucket.mcti-capstone2-bucket
}

output "name" {
  description = "Bucket name."
  value       = google_storage_bucket.mcti-capstone2-bucket.name
}

output "url" {
  description = "Bucket URL (for single use)."
  value       = google_storage_bucket.mcti-capstone2-bucket.url
}