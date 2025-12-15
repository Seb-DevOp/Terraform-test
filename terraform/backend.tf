terraform {
  backend "gcs" {
    bucket = "bucket_tfstate"
    key = "stockage_de_TFstate/rocky.tfstate"
  }
}
  
  provider "google" {
  project = var.gcp_project_id
  region  = var.gcp_region
}
## prefix = "stockage_de_TFstate"