resource "google_compute_instance_template" "default" {
  name        = "TestTerraform-variableICI"
  description = "This template is used to create VM."

  tags = ["Lenny", "est", "le", "plus", "bo"]

  instance_description = "description assigned to instances"
  machine_type         = "e2-medium"
  can_ip_forward       = false

  // Create a new boot disk from an image
  disk {
    source_image      = "debian-cloud/debian-11"
    auto_delete       = true
    boot              = true

  network_interface {
    network = "default"
  }
  }
}