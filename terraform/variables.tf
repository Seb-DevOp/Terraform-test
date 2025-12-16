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

variable "env" {
  description = "L'environnement (dev ou prod)"
  type        = string
}

variable "student_name" {
  description = "Nom de l'etudiant utilisé pour le nommage (sans espaces)"
  type        = string
  default     = "nometudiant"
}

variable "vm_ip" {
  description = "IP interne optionnelle pour la VM (laisser vide pour DHCP)"
  type        = string
  default     = ""
}