#
# Setting for the testing environment


location                              =     "northamerica-northeast1"
project_id                            =       "mcti-capstone2-testing"

# Bucket settings 

bucket_name                         =       "mcti-capstone2-firestore-backup-testing"
storage_class                       =       "STANDARD"
uniform_bucket_level_access         =       true

## Retention period in seconds = 3 days

retention_policy = [
{
  retention_period   =       259200
  is_locked          =       true
}
]

## Lifecycle rule policy 1 (if age greater than 1 day set to storage class Coldline)
#lifecycle_rule_age_coldline         =       1
#lifecycle_rule_set_storage_type     =       "SetStorageClass"     
#lifecycle_rule_set_storage_class    =       "COLDLINE"

## Lifecycle rule policy 2 (if age greater than 4 days delete recovery point)
#lifecycle_rule_age_deletion         =       4       
#lifecycle_rule_set_deletion         =       "Delete"


# backend
key_terraform                       =       "test/terraform.tfstate"