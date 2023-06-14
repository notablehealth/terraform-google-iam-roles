
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
        "exclude:resourcemanager.projects.list",
      ]
      role_id = "test.monitoring.viewer"
      stage   = "BETA"
      title   = "Terraform Testing role"
    },
  ]
  target_id    = var.target_id
  target_level = "organization"
}
