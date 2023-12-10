
## Test Environment
## Convention Name: 
##   organization-project-environment
##   organization-project-name-environment
### Global Settings for the test environment

# organization
variable "organization" {
  type      =   string
}

variable "workspace" {
  type      =   string
}

# region or location 
variable "location" {
  type        =   string
  description =   "Region"
  default     =   "northamerica-northeast1" 
}

# environment name
variable "environment" {
  type        =   string
  description =   "Tag Project Name in prod, dev, and test environments"
  default     =   "capstone2"
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


## Cloud Workflows and Scheduler Settings

variable "workflow_name" {
  description = "The name of the cloud workflow to create"
  type        = string
}

variable "workflow_description" {
  description = "Description for the cloud workflow"
  type        = string
  default     = "Workflow Description"
}

variable "workflow_service_account" {
    type        =  string
    description =  "Service Account with roles/workflows.invoker permissions"  
}

variable "workflow_source" {
  description = "Workflow YAML code to be executed. The size limit is 32KB."
  type        = string
}

variable "workflow_trigger" {
  type = object({

      name                  = string
      description           = string
      schedule              = string
      time_zone             = string
      attempt_deadline      = string
    }) 
  
  description = "Trigger for the Workflow with Cloud Scheduler"
}

variable "service_account_email" {
  description = "Service account email. Unused if service account is auto-created."
  type        = string
  default     = null
}


## Optional: Backend Settings
# backend
variable "key_terraform" {
  type        =   string
}

variable "gcp_service_list" {
  description ="The list of apis necessary for Cloud Workflows"
  type = list(string)
  default = [
    "iam.googleapis.com",
    "compute.googleapis.com"
  ]
}
