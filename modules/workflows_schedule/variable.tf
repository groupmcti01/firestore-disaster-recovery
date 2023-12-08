variable "project_id" {
  description = "The project ID to deploy to"
  type        = string
}

# environment name
variable "environment" {
  type        =   string
  description =   "Environment Name"
  default     =   "testing"
}

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

variable "location" {
  description = "The name of the region where workflow will be created"
  type        = string
  default     = "northamerica-northeast1"
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

variable "service_account_create" {
  description = "Auto-create service account."
  type        = bool
  default     = false
}