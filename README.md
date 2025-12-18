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
- **State**: l'état Terraform est persistant dans un bucket GCS.
- **Séparation dev/prod**: la pipeline gère maintenant un `tfstate` distinct par environnement en utilisant un `prefix` différent dans le backend GCS (ex. `stockage_de_TFstate/dev` et `stockage_de_TFstate/prod`).
- **Variables importantes**: `student_name`, `env`, `gcp_region`, `gcp_zone`, `vm_ip` permettent d'adapter les noms et la configuration des ressources.

- **Remarques**: la VM est créée avec un disque d'amorçage, une option pour une IP publique éphémère, et le bucket est nommé en combinant `student_name` et `env`.

**Comment utiliser la pipeline pour dev ou prod**

- Pour lancer depuis l'interface GitHub Actions, cliquez sur **Run workflow** et choisissez l'input `env` (`dev` ou `prod`).
Le workflow initialisera Terraform en passant le `bucket` et le `prefix` via `-backend-config` (donc le backend est défini par la pipeline). Il utilisera le fichier de variables correspondant (`dev/dev.tfvars` ou `prod/prod.tfvars`).
Commandes locales rapides (exemple `dev`) :

```bash
terraform init -backend-config="bucket=bucket_tfstate" -backend-config="prefix=stockage_de_TFstate/dev"
terraform plan -var-file=dev/dev.tfvars
terraform apply -var-file=dev/dev.tfvars
```

Remplace `dev` par `prod` pour travailler sur l'environnement de production.

