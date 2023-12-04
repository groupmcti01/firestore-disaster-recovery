module "bucket" {
  source = "../modules/bucket"

  name = var.bucket_name
  location                      =   var.location
  project                       =   var.project_id
  storage_class                 =   "STANDARD"

  ## Retention period in seconds = 3 days
  retention_period                    =       259200
  
  ## Lifecycle rule policy 1 (if age greater than 1 day set to storage class Coldline)
  lifecycle_rules = [
    {
      action = {
        type          = "SetStorageClass"
        storage_class = "COLDLINE"
      }
      condition = {
        age           = 1
      }
    }
  ]
  ## Lifecycle rule policy 2 (if age greater than 4 days delete recovery point)
  #lifecycle_rules = [
  #{
  #  action = {
  #    type = "Delete"
  #  }
  #  condition = {
  #    age = "4"
  #  }
  #}
  #]
}