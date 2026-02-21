resource "google_container_cluster" "primary" {
  name     = "hackathon-gke-cluster"
  location = var.zone

  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "primary-node-pool"
  cluster    = google_container_cluster.primary.name
  location   = var.zone

  node_config {
    machine_type = "e2-medium"
  }

  node_count = 1
}
