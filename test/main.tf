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

  location                        =   var.location
  project_id                      =   var.project_id
  
  create_duration                = var.create_duration
  disable_on_destroy             = var.disable_on_destroy
  database_type                  = var.database_type
  firestore_name                 = var.firestore_name
  concurrency_mode               = var.concurrency_mode
  app_engine_integration_mode    = var.app_engine_integration_mode

}

module "workflows_schedule" {
  source = "../modules/workflows_schedule"

location                      =   var.location
project_id                    =   var.project_id
environment                   =   var.environment


workflow_name                 =     var.workflow_name
workflow_description          =     var.workflow_description
workflow_service_account      =     var.workflow_service_account


workflow_trigger              = var.workflow_trigger

workflow_source               = <<EOT
- initialize:
    assign:
      - project: mcti-capstone2-testing
      - firestoreID: (default)
      - backupStorage: gs://mcti-capstone2-testing
- export:
    call: googleapis.firestore.v1.projects.databases.exportDocuments
    args:
      name: $${"projects/" + project + "/databases/(default)"}
      body:
        outputUriPrefix: $${backupStorage}
    result: result
- result: 
    return: $${result}
  EOT

}