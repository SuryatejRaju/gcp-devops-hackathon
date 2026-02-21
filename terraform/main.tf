# -------------------------------
# GKE CLUSTER
# -------------------------------
resource "google_container_cluster" "gke" {
  name     = var.cluster_name
  location = var.zone

  remove_default_node_pool = true
  initial_node_count       = 1

  networking_mode = "VPC_NATIVE"
}

# -------------------------------
# NODE POOL
# -------------------------------
resource "google_container_node_pool" "primary_nodes" {
  name       = "primary-node-pool"
  location   = var.zone
  cluster    = google_container_cluster.gke.name

  node_config {
    machine_type = "e2-medium"

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }

  initial_node_count = 1
}

# -------------------------------
# ARTIFACT REGISTRY
# -------------------------------
resource "google_artifact_registry_repository" "repo" {
  location      = var.region
  repository_id = "hackathon-repo"
  format        = "DOCKER"
}
