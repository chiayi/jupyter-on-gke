resource "google_storage_bucket" "persist_storage" {
  count         = var.include_module_storage ? 1 : 0
  name          = "${var.project_id}-bucket"
  location      = var.region
  force_destroy = true
}