# Overview

Terraform module for Azure log collecting.

## Usage

```terraform
module "logs" {
  source                  = "git@github.com:ArmandoPitotti/az-terraform-logs.git?ref=master"
  resource_group_name     = "group-name"
  resource_group_location = "westeurope"
}
```

Replace `master` with version tag to prevent module auto-update.

## Variables

See variables from [variables.tf](variables.tf)

## Outputs

See outputs from [outputs.tf](outputs.tf)
