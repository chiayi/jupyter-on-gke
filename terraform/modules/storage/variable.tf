variable "include_module_storage" {
  type = bool
  description = "If true it will include the storage module in apply/destroy"
}

output "project_id" {
  description = "GCP project id"
  value       = resource.google_container_cluster.gke[0].project
}

variable "region" {
  type        = string
  description = "GCP project region or zone"
  default     = "us-central1"
}