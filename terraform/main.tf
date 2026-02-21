resource "google_container_cluster" "gke" {
  name     = var.cluster_name
  location = var.region

  remove_default_node_pool = true
  initial_node_count       = 1
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "node-pool"
  location   = var.region
  cluster    = google_container_cluster.gke.name

  node_config {
    machine_type = "e2-medium"
  }

  initial_node_count = 1
}

resource "google_artifact_registry_repository" "repo" {
  location      = var.region
  repository_id = "hackathon-repo"
  format        = "DOCKER"
}
