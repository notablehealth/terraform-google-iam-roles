
module "iam_roles" {
  source = "../../"

  roles = [
    {
      description = "Custom role for testing"
      permissions = [
        "cloudtrace.traces.list",
        "exclude:cloudnotifications.activities.list",
        "opsconfigmonitoring.resourceMetadata.list",
        "role:logging.viewer",
        "role:looker.viewer",
        "role:monitoring.viewer",
        "exclude:looker.backups.get",
        "exclude:looker.backups.list",
      ]
      role_id = "test.monitoring.viewer"
      stage   = "ALPHA"
      title   = "Terraform Testing role"
    },
  ]
  target_id    = "terraform-testing"
  target_level = "project"
}
