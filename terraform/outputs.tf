output "cluster_name" {
  value = google_container_cluster.gke.name
}

output "artifact_repo" {
  value = google_artifact_registry_repository.repo.repository_id
}
