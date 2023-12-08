output "url" {
  description = "Bucket URL (for single use)."
  value       = module.bucket.url
}

output "bucket" {
  description = "The created storage bucket"
  value       = module.bucket
}

output "name" {
  description = "Bucket name."
  value       = module.bucket.name
}