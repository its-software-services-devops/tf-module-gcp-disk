
terraform {
  required_providers {
    google = "~> 3.4.0"
  }

  backend "gcs" {
    bucket  = "its-terraform-states"
    prefix  = "tf-module-gcp-disk"
  }  
}

provider "google" {  
  project     = "its-artifact-commons"
  region      = "asia-southeast1"
  credentials = file("D:/dev/keys/its-artifact-commons-6eb8e8c315b3.json")
}

locals {
  zone = "asia-southeast1-b"
  region = "asia-southeast1"
}

module "unit-testing-disk-00" {
  source    = "../modules/"
  disk_name = "tf-module-unit-testing-disk-00"
  disk_zone = local.zone
  disk_size_gb = 50
  snapshot_region = local.region
}
