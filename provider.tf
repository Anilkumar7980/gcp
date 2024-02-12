provider "google" {
  project     = var.project_id
  region      = var.region
  google_application_credentials = var.google_application_credentials
}
