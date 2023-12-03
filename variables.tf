variable "bucket_name_state" {
    type        =   string
    description =   "Storage tf state file"
    default     =   "capstone2-bucket-tf-state"
}

variable "location_bucket_tf" {
  type          =   string
  description   =   "bucket region"
  default       =   "northamerica-northeast1"
}

variable "versioning" {
    type        =   string
    description =   "Bucket versioning"
    default     =   true
}

variable "apis_state" {
    type        =   string
    description =   "Enable API"
    default     =   true
}