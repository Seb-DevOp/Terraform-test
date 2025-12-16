# terraform/main.tf

module "vm_module" {
  source = "../modules"

  student_name = var.student_name
  env          = var.env
  region       = var.gcp_region
  zone         = var.gcp_zone
  vm_ip = var.vm_ip

  # On utilise les valeurs par défaut pour image/machine_type/disk_size
}
