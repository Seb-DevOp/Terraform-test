terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 7.12"
    }
  }
}

provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
}