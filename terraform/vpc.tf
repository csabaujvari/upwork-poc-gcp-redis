resource "google_compute_network" "vpc_network" {
  name                    = var.private_network_name
  auto_create_subnetworks = true
}

