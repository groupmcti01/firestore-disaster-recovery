resource "time_sleep" "wait_60_seconds" {
  
  create_duration = var.create_duration
}

resource "google_project_service" "firestore-api" {
  project 	            = var.project_id
  service 	            = "firestore.googleapis.com"
  disable_on_destroy    = var.disable_on_destroy

  depends_on 	= [time_sleep.wait_60_seconds]
}

resource "google_firestore_database" "database" {
  project     			        =   var.project_id
  name                          =   var.firestore_name
  location_id                   =   var.location
  type                          =   var.database_type
  concurrency_mode              =   var.concurrency_mode
  app_engine_integration_mode   =   var.app_engine_integration_mode

  depends_on 			= [google_project_service.firestore-api]
}