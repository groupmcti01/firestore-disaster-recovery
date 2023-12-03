# id project 
variable "project_id" {}

# name project 
variable "project_name" {}

# organization name
variable "organization" {}

# environment name
variable "environment" {}

# region
variable "region" {}

# storage class
variable "storage_class" {}

# uniform bucket-level access to a bucket  
variable "uniform_bucket_level_access" {}

# retention policy (seconds)
variable "retention_period" {} 

# lifecycle rule condition
variables "lifecycle_rule_age_coldline" {}

# lifecycle rule action 
variables "lifecycle_rule_set_storage_type" {}

# lifecycle rule action 
variables "lifecycle_rule_set_storage_class" {}

# lifecycle rule condition
variables "lifecycle_rule_age_deletion" {}

# lifecycle rule action 
variables "lifecycle_rule_set_deletion" {}

# bucket name
variables "bucket_name" {}

# backend
variables "key_terraform" {}