module "google_compute_instance_template" {
  source = "../modules" 
  env           = var.env
  network_id    = google_compute_instance_template.vpc.id
  subnetwork_id = google_compute_instance_template.subnet.id
}


resource "google_compute_instance" "vm" {
  name         = "rocky-vm"
  machine_type = "e2-medium"
  zone         = var.gcp_zone


  boot_disk {
    initialize_params {
      image = "google_compute_instance_template.source_image"
      size  = 50
      type  = "pd-balanced"
    }
  }

network_interface {
    network = "default"

    # Optionnel : ajouter access_config pour donner une IP publique à la VM
    access_config {
      // Laisser vide pour une IP éphémère
    }
  }
}