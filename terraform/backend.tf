terraform {
  backend "gcs" {
    bucket = "bucket_tfstate"
    prefix = "stockage_de_TFstate"
  }
}
