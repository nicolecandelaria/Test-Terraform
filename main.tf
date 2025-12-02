terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = "test-terraform-project-2025"
  region  = "us-central1"
}

module "storage_bucket" {
  source            = "./modules/storage"
  bucket_name       = "nicole-terraform-bucket-0112"
  region            = "US"
  enable_versioning = true
}