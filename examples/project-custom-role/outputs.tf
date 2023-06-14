
output "data_roles" {
  description = "Included roles details"
  value       = module.iam_roles.data_roles
}
output "exclude_permissions" {
  description = "Requested permissions to exclude"
  value       = module.iam_roles.exclude_permissions
}
output "exclude_permissions_unsupported" {
  description = "Unsupported permissions to exclude"
  value       = module.iam_roles.exclude_permissions_unsupported
}
output "include_permissions" {
  description = "Requested permissions to include"
  value       = module.iam_roles.include_permissions
}
output "include_roles" {
  description = "Include roles to get permissions from"
  value       = module.iam_roles.include_roles
}
output "permissions" {
  description = "Actual permissions to grant"
  value       = module.iam_roles.permissions
}
output "roles" {
  description = "Managed roles"
  value       = module.iam_roles.roles
}
