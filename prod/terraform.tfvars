#
# Setting for the prod environment

project_id                          =       "001"
project_name                        =       "capstone2"
organization                        =       "mcti"
environment                         =       "prod"
region                              =       "northamerica-northeast1"


# Bucket settings
project                             =       "${var.project_id}-${var.project_name}-${var.organization}-${var.environment}" 
bucket_name                         =       "backup"
storage_class                       =       "STANDARD"
uniform_bucket_level_access         =       true

## Retention period in seconds = 2 days
retention_period                    =       2592000

## Lifecycle rule policy 1 (if age greater than 7 days set to storage class Coldline)
lifecycle_rule_age_coldline         =       7
lifecycle_rule_set_storage_type     =       "SetStorageClass"     
lifecycle_rule_set_storage_class    =       "COLDLINE"

## Lifecycle rule policy 2 (if age greater than 2 days delete recovery point)
lifecycle_rule_age_deletion         =       365       
lifecycle_rule_set_deletion         =       "Delete"

# backend
key_terraform                       =       "prod/terraform.tfstate"