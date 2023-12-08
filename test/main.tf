module "bucket" {
  source = "../modules/bucket"

  bucket_name                   =   var.bucket_name
  location                      =   var.location
  project_id                    =   var.project_id
  storage_class                 =   var.storage_class

  retention_policy = var.retention_policy
  lifecycle_rules = var.lifecycle_rules

  iam_members = var.iam_members
 
}

module "firestore" {
  source = "../modules/firestore"

  location                      =   var.location
  project_id                    =   var.project_id
  
  create_duration     = var.creation_duration
  disable_on_destroy  = var.disable_on_destroy
  database_type       = var.database_type
  firestore_name      = var.firestore_name
  concurrency_mode    = var.concurrency_mode
  concurrency_mode    = var.app_engine_integration_mode

}