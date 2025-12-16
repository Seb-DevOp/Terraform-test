variable "student_name" {
	description = "Nom de l'etudiant (sans espaces), utilisé pour le nommage"
	type        = string
    default     = "Seb"
}

variable "env" {
	description = "Environnement (dev/prod)"
	type        = string
}

variable "region" {
	description = "Région GCP"
	type        = string
}

variable "zone" {
	description = "Zone GCP"
	type        = string
}

variable "machine_type" {
	description = "Type de la machine"
	type        = string
	default     = "e2-medium"
}

variable "image" {
	description = "Image du disque d'amorçage"
	type        = string
	default     = "rocky-linux-cloud/rocky-linux-9"
}

variable "disk_size" {
	description = "Taille disque boot"
	type        = number
	default     = 50
}

variable "subnet_cidr" {
	description = "CIDR du subnet"
	type        = string
	default     = "10.10.0.0/24"
}

variable "vm_ip" {
	description = "IP interne optionnelle pour la VM (laisser vide pour DHCP)"
	type        = string
	default     = ""
}

variable "assign_public_ip" {
	description = "Attribuer une IP publique éphémère"
	type        = bool
	default     = true
}