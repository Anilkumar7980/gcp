provider "google" {
  project     = var.project_id
  region      = var.region
  credentials = var.google_application_credentials
}
