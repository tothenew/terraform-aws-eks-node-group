## Node Group

This Terraform code snippet is used to launch a node group

## Requirements

Before this module can be used on a project, you must ensure that the following pre-requisites are fulfilled:

1. Terraform is [installed](#software-dependencies) on the machine where Terraform is executed.
2. Make sure you had access to launch the resources in aws.


### Software Dependencies
### Terraform
- [Terraform](https://www.terraform.io/downloads.html) 1.0.x
- [terraform-provider-google](https://github.com/terraform-providers/terraform-provider-google) plugin v3.79.0

### Configure a Service Account
In order to execute this module you must have a Service Account with the
following project roles:
- roles/owner

## Install

### Terraform
Be sure you have the correct Terraform version (1.0.x), you can choose the binary here:
- https://releases.hashicorp.com/terraform/

## File structure
The project has the following folders and files:

- /: Root folder
 
## Usage

## Step 1: Clone the repo
## Step 2: Then perform the following commands in the root folder:
```
- `terraform init` to get the plugins
```

```
- `terraform plan --var-file="terraform.tfvars"` to see the infrastructure plan
```

```
- `terraform apply --var-file="terraform.tfvars"` to apply the infrastructure build
```

```
- `terraform destroy --var-file="terraform.tfvars"` to destroy the built infrastructure
```

## Providers
| Name | Version |
|------|---------|
| aws  | 4.5.0 |

## Resources

| Name | Type |
|------|------|
| aws_eks_node_group  | resource |
| aws_iam_role | resource |
| aws_iam_role_policy_attachment | resource |
| aws_launch_template | resource |


## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
|  |  | `string` | n/a | yes |
|  |  | `string` | n/a | yes |
