# Declare provider module to be used
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.51.0"
    }
  }
  backend "http" {
    # Some other credentials
  }
}