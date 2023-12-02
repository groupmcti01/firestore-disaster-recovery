data "google_compute_default_service_account" "default" {
}

resource "google_cloud_scheduler_job" "capston2" {
  name             = "capston2-mcit"
  description      = "test http job"
  schedule         = 15*/1 * * * *"
  attempt_deadline = "320s"
  region           = northamerica-northeast1

  http_target {
    http_method = "POST"
    uri         = "https://cloudscheduler.googleapis.com/v1/projects/my-project-name/locations/us-west1/jobs"

    oauth_token {
      service_account_email = data.google_compute_default_service_account.default.email
    }
  }
}

resource "google_service_account" "capston2-mcit-service-testing" {
  account_id   = "my-account"
  display_name = "Test Service Account"
}

resource "google_workflows_workflow" "example" {
  name          = "workflow"
  region        = "us-central1"
  description   = "Magic"
  service_account = "capston2-mcit-service-testing"
  labels = {
    env = "test"
  }
  user_env_vars = {
    url = "https://timeapi.io/api/Time/current/zone?timeZone=Europe/Amsterdam"
  }
  source_contents = <<-EOF
  # This is a sample workflow. You can replace it with your source code.
  #
  # This workflow does the following:
  # - reads current time and date information from an external API and stores
  #   the response in currentTime variable
  # - retrieves a list of Wikipedia articles related to the day of the week
  #   from currentTime
  # - returns the list of articles as an output of the workflow
  #
  # Note: In Terraform you need to escape the $$ or it will cause errors.

  - getCurrentTime:
      call: http.get
      args:
          url: $${sys.get_env("url")}
      result: currentTime
  - readWikipedia:
      call: http.get
      args:
          url: https://en.wikipedia.org/w/api.php
          query:
              action: opensearch
              search: $${currentTime.body.dayOfWeek}
      result: wikiResult
  - returnOutput:
      return: $${wikiResult.body[1]}
EOF
}

resource "google_project" "project" {
  project_id = "mcti-capstone2-dev"
  name       = "001-mcti-capstone2-dev"
  org_id     = "0"
}

resource "time_sleep" "wait_60_seconds" {
  depends_on = [google_project.project]

  create_duration = "60s"
}

resource "google_project_service" "firestore" {
  project = google_project.project.project_id
  service = "firestore.googleapis.com"
  # Needed for CI tests for permissions to propagate, should not be needed for actual usage
  depends_on = [time_sleep.wait_60_seconds]
}

resource "google_firestore_database" "database" {
  project     = "project"
  name        = "(default)"
  location_id = "nam5"
  type        = "FIRESTORE_NATIVE"

  depends_on = [google_project_service.firestore]
}
