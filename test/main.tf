module "bucket" {
  source = "../modules/bucket"

  bucket_name                   =   var.bucket_name
  location                      =   var.location
  project_id                    =   var.project_id
  storage_class                 =   "STANDARD"


  retention_policy = {
    is_locked        =  false
    retention_period =  259200
  }
  
  
  lifecycle_rules = [
    ## Lifecycle rule policy 1 (if age greater than 1 day set to storage class Coldline)
    {
      action = {
        type          = "SetStorageClass"
        storage_class = "COLDLINE"
      }
      condition = {
        age           = 1
      }
    },
  ## Lifecycle rule policy 2 (if age greater than 4 days delete recovery point)
    {
      action = {
        type          = "Delete"
      }
      condition = {
        age           = 4
      }
    }
  ]
}