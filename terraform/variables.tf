variable "gcp_project_id" {
  description = "project ID"
  type        = string
}

variable "gcp_region" {
  description = "Région GCP"
  type        = string
  default     = "europe-west1"
}

variable "ssh_user" {
  description = "Utilisateur SSH"
  type        = string
}

variable "ssh_public_key" {
  description = "Chemin vers la clé publique SSH"
  type        = string
}