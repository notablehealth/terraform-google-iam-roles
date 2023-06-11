
variable "roles" {
  description = "Role objects to manage"
  type = list(object({
    description = string
    permissions = list(string)
    role_id     = string
    stage       = string
    title       = string
  }))
  default = []
}

variable "target_id" {
  description = "The id of the target resource (organization or project) ID)"
  type        = string
}

variable "target_level" {
  description = "The level at which to create the custom role (organization or project))"
  type        = string
  default     = "project"
  validation {
    condition = contains(
      ["project", "organization"],
      var.target_level
    )
    error_message = "Must be one of: project, organization."
  }
}
