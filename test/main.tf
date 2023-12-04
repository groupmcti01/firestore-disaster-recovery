module "bucket" {
  source = "../modules/bucket"

  name = "${var.project_name}-${var.organization}-${var.bucket_name}-${var.environment}"
  location                      =   var.region
  project                       =   "${var.project_id}-${var.project_name}-${var.organization}-${var.environment}"
  storage_class                 =   var.storage_class
  uniform_bucket_level_access   =   var.uniform_bucket_level_access
  retention_period              =   var.retention_period

  ## Retention period in seconds = 3 days
  retention_period                    =       259200

## Lifecycle rule policy 1 (if age greater than 1 day set to storage class Coldline)
lifecycle_rule_age_coldline         =       1
lifecycle_rule_set_storage_type     =       "SetStorageClass"     
lifecycle_rule_set_storage_class    =       "COLDLINE"

## Lifecycle rule policy 2 (if age greater than 4 days delete recovery point)
lifecycle_rule_age_deletion         =       4       
lifecycle_rule_set_deletion         =       "Delete"

}
