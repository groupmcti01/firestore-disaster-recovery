# id project 
variable "project_id" {
  type        =   string
  description =   "Project ID"
  default     =   "001"
}

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
variable "region" {
  type        =   string
  description =   "Region"
  default     =   "northamerica-northeast1 
}

# environment name
variable "environment" {
  type        =   string
  description =   "Environment Name"
  default     =   "test"
}

# storage class
variable "storage_class" {}

# uniform bucket-level access to a bucket  
variable "uniform_bucket_level_access" {}

# retention policy (seconds)
variable "retention_period" {} 

# lifecycle rule condition
variable "lifecycle_rule_age_coldline" {}

# lifecycle rule action 
variable "lifecycle_rule_set_storage_type" {}

# lifecycle rule action 
variable "lifecycle_rule_set_storage_class" {}

# lifecycle rule condition
variable "lifecycle_rule_age_deletion" {}

# lifecycle rule action 
variable "lifecycle_rule_set_deletion" {}

# bucket name
variable "bucket_name" {}

# backend
variable "key_terraform" {}
