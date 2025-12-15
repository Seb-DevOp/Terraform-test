resource "google_compute_network" "vpc" {
  name                    = "TestTerraform-vpc"
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = "rocky-subnet"
  ip_cidr_range = "10.10.0.0/24"
  region        = var.gcp_region
  network       = google_compute_network.vpc.id
}


resource "google_compute_instance" "vm" {
  name         = "rocky-vm"
  machine_type = "e2-medium"
  zone         = var.gcp_zone


  boot_disk {
    initialize_params {
      image = "rocky-linux-cloud/rocky-linux-9"
      size  = 50
      type  = "pd-balanced"
    }
  }

