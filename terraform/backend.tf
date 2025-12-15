terraform {
  backend "gcs" {
    bucket  = "bucket_tfstate/stockage_de_TFstate/"
    prefix  = "gcp/rocky-vm"
  }
}