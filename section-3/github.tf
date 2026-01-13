terraform {
  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

# Configure the GitHub Provider
provider "github" {
  token = "OWN_TOKEN" # or `GITHUB_TOKEN`
}

resource "github_repository" "example2" {
  name        = "example2"
  description = "My awesome codebase"

  visibility = "public"

  # template {
  #   owner                = "github"
  #   repository           = "terraform-template-module"
  #   include_all_branches = true
  # }
}