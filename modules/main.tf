resource "google_compute_instance_template" "default" {
  # Utilisation de l'interpolation ${var.env}
  name         = "test-terraform-${var.env}-template"
  machine_type = "e2-medium"


  disk {
    source_image = "debian-cloud/debian-11"
    auto_delete  = true
    boot         = true
  } 


  network_interface {
    network    = var.network_id
    subnetwork = var.subnetwork_id
  }
}