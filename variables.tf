variable "project_id" {
  type        = string
  description = "project ID"
}

variable "region" {
  type        = string
  description = "Compute Region"
}

variable "zone" {
  type        = string
  description = "Compute Zone"
}
variable "prefix"{
  type        = string
  default="csp2"

variable "GOOGLE_CREDENTIALS"{
  type=string
}
