terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.70.0"
    }
    google-beta = {
      source  = "hashicorp/google-beta"
      version = ">= 4.48.0, < 5.0"
    }
  }
}

provider "google" {
  credentials=file("creds.json")
  project = "groovy-karma-388506"
  region  = "us-central1"
  zone    = "us-central1-a"
}
provider "google-beta" {
  credentials=file("creds.json")
  project = "groovy-karma-388506"
  region  = "us-central1"
  zone    = "us-central1-a"
}
