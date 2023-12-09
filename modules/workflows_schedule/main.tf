/**
 * Cloud Workflows triggered by Cloud Scheduler
 *
 */

data "google_compute_default_service_account" "default" {
  project = var.project_id
}

resource "google_cloud_scheduler_job" "mcit-capstone2-scheduler-workflow" {
  project           =   var.project_id
  name              =   var.workflow_trigger.name
  description       =   var.workflow_trigger.description
  schedule          =   var.workflow_trigger.schedule
  time_zone         =   var.workflow_trigger.time_zone
  attempt_deadline  =   var.workflow_trigger.attempt_deadline
  region            =   var.location

  http_target {
    http_method     =   "POST"
    uri             =   "https://workflowexecutions.googleapis.com/v1/${google_workflows_workflow.mcti-capstone2-workflow.id}/executions"
    #uri            =   "https://workflowexecutions.googleapis.com/v1/projects/mcti-project/locations/northamerica-northeast1/workflows/capston2-mcti-workflow-testing/executions"
    body = base64encode(
      jsonencode({
        "argument" : null,
        "callLogLevel" : "CALL_LOG_LEVEL_UNSPECIFIED"
        }
    ))

  oauth_token {
    service_account_email   = data.google_compute_default_service_account.default.email
    scope                   = "https://www.googleapis.com/auth/cloud-platform"
  }
  }
}

resource "google_workflows_workflow" "mcti-capstone2-workflow" {
  name              =   var.workflow_name
  region            =   var.location
  description       =   var.workflow_description
  service_account   =   var.workflow_service_account
  labels = {
    env = var.environment
  }
  project           = var.project_id

## Improvement YAML file - interpolation problem - last error on result variable
  #source_contents = templatefile("${path.root}/templates/export.yaml",{ 
  #  project = "mcti-capstone2-testing", 
  #  backupStorage = "gs://mcti-capstone2-poc", 
  #  firestoreID = "(default)",
  # result  = "result" })

  source_contents = var.workflow_source

}