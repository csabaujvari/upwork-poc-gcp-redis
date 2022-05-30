data "google_compute_network" "default-network" {
  name = "default"
}

resource "google_redis_instance" "cache" {
  project        = var.project
  name           = "cache-1"
  tier           = "STANDARD_HA"
  memory_size_gb = 1

  location_id             = var.zone
  alternative_location_id = var.alternative_zone

  authorized_network = data.google_compute_network.default-network.id

  redis_version = "REDIS_6_X"
  display_name  = "Redis for GKE cluster-1"


  maintenance_policy {
    weekly_maintenance_window {
      day = "TUESDAY"
      start_time {
        hours   = 0
        minutes = 30
        seconds = 0
        nanos   = 0
      }
    }
  }
}
