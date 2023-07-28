# Use the debian module to provision the prod environment
module "debian_vm" {
  source = "../modules/debian_vm"
  
  # Input variables
  environment = "dev"
}