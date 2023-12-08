
## Test Environment
## Convention Name: 
##   organization-project-environment
##   organization-project-name-environment
### Global Settings for the test environment

# region or location 
variable "location" {
  type        =   string
  description =   "Region"
  default     =   "northamerica-northeast1" 
}

# environment name
variable "environment" {
  type        =   string
  description =   "Environment Name"
  default     =   "testing"
}

# Environment Test Settings

variable "project_id" {
  description = "Project ID"
  type        = string
}

# Bucket Arguments
variable "bucket_name" {
  description =   "Storage for FireStore Database backups"
  type        =   string
}

variable "uniform_bucket_level_access" {
  description = "Enables Bucket Policy Only access to a bucket"
  type        =   bool
}

variable "storage_class" {
  description = "The Storage Class of the bucket."
  type        =   string
}

variable "retention_policy" {
  description = "Configuration of the bucket's data retention policy for how long objects in the bucket should be retained."
  type = object({
    is_locked        = bool
    retention_period = number
  })
}


## Optional: Backend Settings
# backend
variable "key_terraform" {
  type        =   string
}
