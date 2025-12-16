variable "gcp_project_id" {
  description = "project ID"
  type        = string
}

variable "gcp_region" {
  description = "Région GCP"
  type        = string
  default     = "europe-west1"
}
 variable "gcp_zone" {
  description = "Zone Région GCP"
  type        = string
  default     = "europe-west1-b"
}
