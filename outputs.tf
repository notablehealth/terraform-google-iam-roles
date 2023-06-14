
output "data_roles" {
  description = "Included roles details"
  value       = data.google_iam_role.self
}
output "exclude_permissions" {
  description = "Requested permissions to exclude"
  value       = local.exclude_permissions
}
output "exclude_permissions_unsupported" {
  description = "Unsupported permissions to exclude"
  value       = data.google_iam_testable_permissions.unsupported_permissions.permissions[*].name
}
output "include_permissions" {
  description = "Requested permissions to include"
  value       = local.include_permissions
}
output "include_roles" {
  description = "Include roles to get permissions from"
  value       = local.roles
}
output "permissions" {
  description = "Actual permissions to grant"
  value       = local.permissions
}

output "roles" {
  description = "Managed roles"
  value = { for role in(
    (var.target_level == "project") ?
    google_project_iam_custom_role.self :
  google_organization_iam_custom_role.self) : role.role_id => role }
}
