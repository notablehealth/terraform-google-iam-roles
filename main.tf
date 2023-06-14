/**
 * # terraform-google-iam-roles
 *
 * [![Releases](https://img.shields.io/github/v/release/notablehealth/terraform-google-iam-roles)](https://github.com/notablehealth/terraform-google-iam-roles/releases)
 *
 * [Terraform Module Registry](https://registry.terraform.io/modules/notablehealth/iam-roles/google)
 *
 * This module manages custom IAM roles in Google Cloud Platform.
 *
 * ## Features
 *
 * - Manage roles at the organization or project level
 * - Include permissions from existing roles
 * - Exclude permissions
 * - Manage multiple roles at once
 *
 */

locals {
  # Roles to get permissions from
  roles = compact(flatten([for role in var.roles : [
    for perm in role.permissions : (
    startswith(perm, "role:") ? substr(perm, 5, -1) : null)
    ]
  ]))
  # Requested permissions to exclude
  exclude_permissions = {
    for role in var.roles :
    (role.role_id) => toset(compact(flatten([for perm in role.permissions : (
      startswith(perm, "exclude:") ? substr(perm, 8, -1) : null
    ) if perm != null])))
  }
  # Requested permissions to include
  include_permissions = {
    for role in var.roles :
    (role.role_id) => toset(flatten([for perm in role.permissions : (
      startswith(perm, "role:") ? data.google_iam_role.self[substr(perm, 5, -1)].included_permissions : (!startswith(perm, "exclude:") ? [perm] : [])
    ) if perm != null]))
  }
  # Actual permissions to grant
  permissions = {
    for role in var.roles :
    (role.role_id) => toset([for perm in local.include_permissions[role.role_id] :
      perm if !(
        contains(local.exclude_permissions[role.role_id], perm) ||
        contains(data.google_iam_testable_permissions.unsupported_permissions.permissions[*].name, perm)
      )
    ])
  }
}

resource "google_organization_iam_custom_role" "self" {
  for_each = {
    for role in var.roles :
    role.role_id => role
    if var.target_level == "organization"
  }

  org_id      = var.target_id
  description = each.value.description
  permissions = local.permissions[each.value.role_id]
  role_id     = each.value.role_id
  stage       = each.value.stage
  title       = each.value.title
}
resource "google_project_iam_custom_role" "self" {
  for_each = {
    for role in var.roles :
    role.role_id => role
    if var.target_level == "project"
  }

  project     = var.target_id
  description = each.value.description
  permissions = local.permissions[each.value.role_id]
  role_id     = each.value.role_id
  stage       = each.value.stage
  title       = each.value.title
}
