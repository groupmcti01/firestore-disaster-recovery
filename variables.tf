# id project 
variable "project_id" {
  type        =   string
  description =   "Project ID"
  default     =   "001"
}

# name project 
variable "project_name" {
  type        =   string
  description =   "Project Name"
  default     =   "capstone2"
}

# organization name
variable "organization" {
  type        =   string
  description =   "Organization Name"
  default     =   "mcti"
}

# region
variable "region" {
  type        =   string
  description =   "Region"
  default     =   "northamerica-northeast1" 
}

# environment name
variable "environment" {
  type        =   string
  description =   "Environment Name"
  default     =   "test"
}

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