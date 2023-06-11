
# Exclude these from all roles
data "google_iam_testable_permissions" "unsupported_permissions" {
  full_resource_name   = var.target_level == "org" ? "//cloudresourcemanager.googleapis.com/organizations/${var.target_id}" : "//cloudresourcemanager.googleapis.com/projects/${var.target_id}"
  stages               = ["GA", "ALPHA", "BETA"]
  custom_support_level = "NOT_SUPPORTED"
}

data "google_iam_role" "self" {
  for_each = toset(local.roles)
  name     = "roles/${each.value}"
}
