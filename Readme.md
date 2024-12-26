# Local Development
This repository is configuration for local development. You can use docker compose or terraform to settup local development environment.

## Terraform
[How to setup terraform in local.](https://developer.hashicorp.com/terraform/install)
### How to run
1. Run `cd terraform`
2. Run `terraform init`
3. Rename `variables.tfvars.example` to `variables.tfvars`
4. Optionally, you can change the variables in `variables.tfvars`
5. Run `terraform apply`