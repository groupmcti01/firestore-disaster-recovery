module "bucket" {
  source = "../modules/bucket"
  

  name = "${var.project_name}-${var.organization}-${var.name_bucket}-${var.environment}"
  location                      =   var.region
  project                       =   "${var.project_id}-${var.project_name}-${var.organization}-${var.environment}"
  storage_class                 =   var.storage_class
  uniform_bucket_level_access   =   var.uniform_bucket_level_access
  retention_period              =   var.retention_period

}