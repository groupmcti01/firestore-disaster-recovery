module "bucket" {
  source = "../modules/bucket"

  bucket_name                   =   var.bucket_name
  location                      =   var.location
  project_id                    =   var.project_id
  storage_class                 =   var.storage_class

  retention_policy = var.retention_policy
  lifecycles_rules = var.lifecycle_rules
 
}