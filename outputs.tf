
output "data_roles" {
  description = "Included roles details"
  value       = data.google_iam_role.self
}
output "exclude_permissions" {
  description = "Requested permissions to exclude"
  value       = local.exclude_permissions
}
output "include_permissions" {
  description = "Requested permissions to include"
  value       = local.include_permissions
}
output "permissions" {
  description = "Actual permissions to grant"
  value       = local.permissions
}
output "roles" {
  description = "Included roles to get permissions from"
  value       = local.roles
}
