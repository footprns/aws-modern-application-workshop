# Using a single workspace:
terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "BSOCloud02"

    workspaces {
      name = "aws-modern-application-workshop"
    }
  }
}