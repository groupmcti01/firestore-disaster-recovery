# name project 
variable "project_name" {
  type        =   string
  description =   "Project Name"
  default     =   "capstone2"
}

# organization name
variable "organization" {
  type        =   string
  description =   "Organization Name"
  default     =   "mcti"
}

# region
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

variable "project_id" {
  description = "Project ID"
  type        = string
  default     = "${var.organization}-${var.project_name}-${var.environment}"
}

# bucket name
variable "bucket_name" {
  type        =   string
  description =   ""
  default     =   "${var.organization}-${var.project_name}-firestore-backup-${var.environment}"
}

# backend
variable "key_terraform" {}
