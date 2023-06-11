
output "data_roles" {
  description = "Included roles details"
  value       = module.iam_roles.data_roles
}
output "exclude_permissions" {
  description = "Requested permissions to exclude"
  value       = module.iam_roles.exclude_permissions
}
output "include_permissions" {
  description = "Requested permissions to include"
  value       = module.iam_roles.include_permissions
}
output "permissions" {
  description = "Actual permissions to grant"
  value       = module.iam_roles.permissions
}
output "roles" {
  description = "Included roles to get permissions from"
  value       = module.iam_roles.roles
}
