#
# Setting for the testing environment

organization                          =     "mcti-group"
workspace                             =     "firestore-disaster-recovery-dev"
location                              =     "northamerica-northeast1"
project_id                            =     "mcti-capstone2-dev"

# Bucket settings 

bucket_name                         =       "mcti-capstone2-firestore-backup-dev"
storage_class                       =       "STANDARD"
uniform_bucket_level_access         =       true

## Retention period in seconds = 5 days

retention_policy = {
  retention_period   =       432000
  is_locked          =       true
}

lifecycle_rules = [
  ## Lifecycle rule policy 1 (if age greater than 1 day set to storage class Coldline)
  {
    action = {
      type          = "SetStorageClass"
      storage_class = "COLDLINE"
    }
    condition = {
      age           = 2
    }
  },
  ## Lifecycle rule policy 2 (if age greater than 4 days delete recovery point)
  {
    action = {
      type          = "Delete"
    }
    condition = {
      age           = 6
    }
  }
]

iam_members = [{
    role   = "roles/storage.objectViewer"
    member = "group:mcti.testing@labroom.online"
  }]


## Firestore Settings
create_duration               = "60s"
disable_on_destroy            = false
database_type                 = "FIRESTORE_NATIVE"
firestore_name                = "(default)"
concurrency_mode              = "OPTIMISTIC"
app_engine_integration_mode   = "DISABLED"


## Workflows and Scheduler

workflow_name         =     "mcit-capstone2-scheduler-workflow-export-dev"
workflow_description  =     "Export firestore data"
workflow_service_account  = "capstone2-mcti-dev-sa@mcti-capstone2-dev.iam.gserviceaccount.com"


workflow_trigger = {
  name                  = "mcit-capstone2-export-dev"
  description           = "Cron job for workflows mctit-capstone2-workflow-dev"
  schedule              = "0 1 * * *"
  time_zone             = "America/New_York"
  attempt_deadline      = "300s"
}

workflow_source         = ""


# backend
key_terraform                       =       "dev/terraform.tfstate"