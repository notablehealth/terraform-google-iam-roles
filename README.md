
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
# terraform-google-iam-roles

[![Releases](https://img.shields.io/github/v/release/notablehealth/terraform-google-iam-roles)](https://github.com/notablehealth/terraform-google-iam-roles/releases)

[Terraform Module Registry](https://registry.terraform.io/modules/notablehealth/iam-roles/google)

This module manages custom IAM roles in Google Cloud Platform.

## Features

- Manage roles at the organization or project level
- Include permissions from existing roles
- Exclude permissions
- Manage multiple roles at once

## Usage

Basic usage of this module is as follows:

```hcl
module "example" {
    source = "notablehealth/<module-name>/google"
    # Recommend pinning every module to a specific version
    # version = "x.x.x"

    # Required variables
    target_id =
}
```

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.7 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 4.51.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.68.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_organization_iam_custom_role.self](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/organization_iam_custom_role) | resource |
| [google_project_iam_custom_role.self](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_custom_role) | resource |
| [google_iam_role.self](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/iam_role) | data source |
| [google_iam_testable_permissions.unsupported_permissions](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/iam_testable_permissions) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_roles"></a> [roles](#input\_roles) | Role objects to manage | <pre>list(object({<br>    description = string<br>    permissions = list(string)<br>    role_id     = string<br>    stage       = string # Validate: ALPHA, BETA, GA, DEPRECATED, DISABLED<br>    title       = string<br>  }))</pre> | `[]` | no |
| <a name="input_target_id"></a> [target\_id](#input\_target\_id) | The id of the target resource (organization or project) ID) | `string` | n/a | yes |
| <a name="input_target_level"></a> [target\_level](#input\_target\_level) | The level at which to create the custom role (organization or project)) | `string` | `"project"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_data_roles"></a> [data\_roles](#output\_data\_roles) | Included roles details |
| <a name="output_exclude_permissions"></a> [exclude\_permissions](#output\_exclude\_permissions) | Requested permissions to exclude |
| <a name="output_exclude_permissions_unsupported"></a> [exclude\_permissions\_unsupported](#output\_exclude\_permissions\_unsupported) | Unsupported permissions to exclude |
| <a name="output_include_permissions"></a> [include\_permissions](#output\_include\_permissions) | Requested permissions to include |
| <a name="output_include_roles"></a> [include\_roles](#output\_include\_roles) | Include roles to get permissions from |
| <a name="output_permissions"></a> [permissions](#output\_permissions) | Actual permissions to grant |
| <a name="output_roles"></a> [roles](#output\_roles) | Managed roles |


<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
