locals {
  vpc_name     = lower("VPC-${var.student_name}-${var.env}")
  subnet_name  = lower("subnet-${var.student_name}-${var.env}")
  vm_name      = lower("VM-${var.student_name}-${var.env}")
  storage_name = lower("storage-${var.student_name}-${var.env}")
}

resource "google_compute_network" "vpc" {
  name                    = local.vpc_name
  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "subnet" {
  name          = local.subnet_name
  ip_cidr_range = var.subnet_cidr
  region        = var.region
  network       = google_compute_network.vpc.id
}

resource "google_compute_instance" "vm" {
  name         = local.vm_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image
      size  = var.disk_size
      type  = "pd-balanced"
    }
  }

  network_interface {
    network    = google_compute_network.vpc.self_link
    subnetwork = google_compute_subnetwork.subnet.self_link
    network_ip = var.vm_ip == "" ? null : var.vm_ip

    dynamic "access_config" {
      for_each = var.assign_public_ip ? [1] : []
      content {}
    }
  }

}

resource "google_storage_bucket" "bucket" {
  name          = local.storage_name
  location      = var.region
  force_destroy = true
}

