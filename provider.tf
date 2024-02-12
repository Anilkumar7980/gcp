provider "google" {
  project     = var.project_id
  region      = var.region
  access_token = var.google_application_credentials
}  
