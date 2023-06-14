
# Exclude these from all roles
data "google_iam_testable_permissions" "unsupported_permissions" {
  full_resource_name   = var.target_level == "organization" ? "//cloudresourcemanager.googleapis.com/organizations/${var.target_id}" : "//cloudresourcemanager.googleapis.com/projects/${var.target_id}"
  stages               = ["GA", "ALPHA", "BETA"]
  custom_support_level = "NOT_SUPPORTED"
}

# gcloud iam list-testable-permissions \
#   https://www.googleapis.com/cloudresourcemanager/v1/projects/notable-terraform-testing \
#   --filter=
#  stage= in GA BETA ALPHA DEPRECATED
#  title=
#  customRolesSupportLevel = "TESTING", NOT_SUPPORTED
#  --format=(name)
#  # https://www.googleapis.com/compute/v1/projects/notable-terraform-testing \

data "google_iam_role" "self" {
  for_each = toset(local.roles)
  name     = "roles/${each.value}"
}
