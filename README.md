# Terraform-test

##  Déploiement & Maintenance de l'Infrastructure

Cette pipeline GitHub Actions permet à la fois le déploiement continu et la destruction contrôlée de l'infrastructure GCP via Terraform.

### 🔹 Déploiement (Standard)
Le déploiement est automatique à chaque **push** sur la branche `main`.
1. Le job **Terraform Plan** génère l'aperçu des modifications.
2. Le job **Terraform Apply** se met en attente de validation manuelle (Environment: `production`).
3. Une fois validé, l'infrastructure est mise à jour.
4. Le job de destruction est automatiquement **ignoré** (Skipped).

### 🔹 Destruction (Manuelle)
Pour supprimer l'infrastructure, vous devez déclencher la pipeline manuellement :
1. Allez dans l'onglet **Actions** de GitHub.
2. Sélectionnez le workflow : `Deploy GCP VM with Terraform`.
3. Cliquez sur le bouton **Run workflow** à droite.
4. Cochez la case **"Cocher pour lancer le DESTROY"**.
5. Cliquez sur **Run workflow**.
6. Validez l'approbation manuelle sur l'environnement `production` pour confirmer la suppression définitive.
7. Lancement d'un Plan => validation manuel pour valider le destroy

> [!IMPORTANT]
> Si aucune action manuelle n'est effectuée lors du lancement, la pipeline ignorera l'étape de destruction par défaut pour garantir la sécurité de l'infrastructure.

**Description Simple du Code Terraform**

- **But**: Déployer une petite infrastructure GCP composée d'un réseau VPC, d'un sous‑réseau, d'une VM Compute Engine et d'un bucket de stockage.
- **Modules**: le dossier `modules/` contient le module principal qui crée la VPC, le subnet, la VM et le bucket.
- **Configuration principale**: le dossier `terraform/` utilise le dossier module et contient :
	- `providers.tf` : configuration du provider Google.
	- `backend.tf` : backend `gcs` pour stocker l'état Terraform dans un bucket GCS.
	- `variables.tf` : variables utilisées pour paramétrer le déploiement.
- **State**: l'état Terraform est persistant dans un bucket GCS sur google.
- **Variables importantes**: `student_name`, `env`, `gcp_region`, `gcp_zone`, `vm_ip` permettent d'adapter les noms et la configuration des ressources.

- **Remarques**: la VM est créée avec un disque d'amorçage, une option pour une IP publique éphémère, et le bucket est nommé en combinant `student_name` et `env`.

