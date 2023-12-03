#
# Setting for the dev environment

project_id                          =       "001"
project_name                        =       "capstone2"
organization                        =       "mcti"
environment                         =       "dev"
region                              =       "northamerica-northeast1"


# Bucket settings 
project                             =       "${var.project_id}-${var.project_name}-${var.organization}-${var.environment}" 
bucket_name                         =       "backup"
storage_class                       =       "STANDARD"
uniform_bucket_level_access         =       true

## Retention period in seconds = 2 days
retention_period                    =       172800

## Lifecycle rule policy 1 (if age greater than 1 day set to storage class Coldline)
lifecycle_rule_age_coldline         =       1
lifecycle_rule_set_storage_type     =       "SetStorageClass"     
lifecycle_rule_set_storage_class    =       "COLDLINE"

## Lifecycle rule policy 2 (if age greater than 2 days delete recovery point)
lifecycle_rule_age_deletion         =       2       
lifecycle_rule_set_deletion         =       "Delete" 

# backend
key_terraform                       =       "dev/terraform.tfstate"