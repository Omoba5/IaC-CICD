# Create Network (VPC)
resource "google_compute_network" "vpc_network" {
  name                    = "${var.environment}-network"
  auto_create_subnetworks = false
}

# Create Subnetwork
resource "google_compute_subnetwork" "tf_subnet" {
  name          = "${var.environment}-subnetwork"
  ip_cidr_range = "10.128.10.0/24"
  region        = "us-central1"
  network       = google_compute_network.vpc_network.name
}

# Create Virtual Machine
resource "google_compute_instance" "vm_instance" {
  name                      = var.environment
  machine_type              = "e2-small"
  tags                      = ["${var.environment}"]
  allow_stopping_for_update = true

  boot_disk {
    # auto_delete = false
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  # Adding SSH keys
  metadata = {
    ssh-keys = "${var.ssh_user}:${file(var.pubkey_file)}"
  }

  network_interface {
    network    = google_compute_network.vpc_network.name
    subnetwork = google_compute_subnetwork.tf_subnet.name
    access_config {
    }
  }
}

# Create firewall rules
resource "google_compute_firewall" "rules" {
  name        = "fwr-${var.environment}"
  network     = google_compute_network.vpc_network.name
  description = "Creates firewall rule targeting tagged instances for terraform infrastructure"

  allow {
    protocol = "tcp"
    ports    = ["80", "8080", "22", "1000-2000"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["${var.environment}"]
}

# Copy the IP address into a txt file
resource "local_file" "vm_ip" {
  content  = google_compute_instance.vm_instance.network_interface[0].access_config[0].nat_ip
  filename = "../IPs/${var.environment}_vm_ip.txt"
}