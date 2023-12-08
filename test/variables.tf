
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

variable "lifecycle_rules" {
  description = "The bucket's Lifecycle Rules configuration."
  type = list(object({
    action = any
    condition = any
  }))
}

variable "iam_members" {
  description = "The list of IAM members to grant permissions on the bucket."
  type = list(object({
    role   = string
    member = string
  }))
  default = []
}

## Firestore Variables
variable "create_duration" {
  type = string
}

variable "disable_on_destroy" {
  type = bool
  default = false
}

variable "database_type" {
  description = "FireStore Database type"
  type        = string
}

variable "firestore_name" {
  description   = "Firestore database name"
  type          = string
}

variable "concurrency_mode" {
  description   = "The concurrency control mode to use for this database"
  type          = string
}

variable "app_engine_integration_mode" {
  description = "The App Engine integration mode to use for this database"
  type        = string
}

## Optional: Backend Settings
# backend
variable "key_terraform" {
  type        =   string
}
