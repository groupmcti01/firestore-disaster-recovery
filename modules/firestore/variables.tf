# id project 
variable "project_id" {
  description = "Project ID"
  type        = string
}

variable "location" {
  description   = "location of the firestore database"
  type          = string
  default       = "northamerica-northeast1" 
}

variable "create_duration" {
  type = string
  default = "60s"
}

variable "disable_on_destroy" {
  type = bool
  default = false
}

variable "database_type" {
  description = "FireStore Database type"
  type        = string
  default     = "FIRESTORE_NATIVE"
}

variable "firestore_name" {
  description   = "Firestore database name"
  type          = string
  default       = "(default)" 
}

variable "concurrency_mode" {
  description   = "The concurrency control mode to use for this database"
  type          = string
}

variable "app_engine_integration_mode" {
  description = "The App Engine integration mode to use for this database"
  type        = string
}