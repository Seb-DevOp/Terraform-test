terraform {
  backend "gcs" {
    bucket  = "bucket_tfstate/stockage_de_TFstate/"
    key = "Rocky_VM.tfstate"
  }
  
  provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
}
}