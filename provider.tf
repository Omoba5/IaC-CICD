# Authenticate with GCP Service account
provider "google" {
  credentials = file("CREDENTIAL")

  project = "infrastructure-393911"
  region  = "us-central1"
  zone    = "us-central1-c"
}