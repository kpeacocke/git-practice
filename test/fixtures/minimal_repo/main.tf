output "repository_name" {
  value = module.repo.repository_name
}
module "repo" {
  source = "../../../modules/github-repo"

  name                     = var.name
  owner                    = var.github_owner
  visibility               = "private"
  enforce_gitflow          = false
  enforce_tests            = false
  enforce_security         = false
  enforce_docs             = false
  bootstrap_with_templates = true
  enforce_issue_integration = false
  enforce_project_board     = false
  traceability_enabled      = false
  enable_weekly_reporting   = false
}

variable "name" {
  type = string
}

variable "github_owner" {
  type = string
}