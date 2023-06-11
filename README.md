# terraform-google-iam-roles

[![Releases](https://img.shields.io/github/v/release/notablehealth/terraform-google-iam-roles)](https://github.com/notablehealth/terraform-google-iam-roles/releases)

[Terraform Module Registry](https://registry.terraform.io/modules/notablehealth/iam-roles/google)

Template for creating a Terraform module for Google

## Features

- base terraform files
- pre-commit setup
- GitHub actions setup

## Usage

Copy contents or create new repository on GitHub and use this as a template

```hcl
module "MODULE-NAME" {
  source  = "ORGANIZATION/MODULE-NAME/google"
  # Recommend pinning every module to a specific version
  # version = "x.x.x"

}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
# terraform-google-iam-roles

[![Releases](https://img.shields.io/github/v/release/notablehealth/terraform-google-iam-roles)](https://github.com/notablehealth/terraform-google-iam-roles/releases)

[Terraform Module Registry](https://registry.terraform.io/modules/notablehealth/iam-roles/google)

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
| [google_iam_role.self](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/iam_role) | data source |
| [google_iam_testable_permissions.unsupported_permissions](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/iam_testable_permissions) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_roles"></a> [roles](#input\_roles) | Role objects to manage | <pre>list(object({<br>    description = string<br>    permissions = list(string)<br>    role_id     = string<br>    stage       = string<br>    title       = string<br>  }))</pre> | `[]` | no |
| <a name="input_target_id"></a> [target\_id](#input\_target\_id) | The id of the target resource (organization or project) ID) | `string` | n/a | yes |
| <a name="input_target_level"></a> [target\_level](#input\_target\_level) | The level at which to create the custom role (organization or project)) | `string` | `"project"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_data_roles"></a> [data\_roles](#output\_data\_roles) | Included roles details |
| <a name="output_exclude_permissions"></a> [exclude\_permissions](#output\_exclude\_permissions) | Requested permissions to exclude |
| <a name="output_include_permissions"></a> [include\_permissions](#output\_include\_permissions) | Requested permissions to include |
| <a name="output_permissions"></a> [permissions](#output\_permissions) | Actual permissions to grant |
| <a name="output_roles"></a> [roles](#output\_roles) | Included roles to get permissions from |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
