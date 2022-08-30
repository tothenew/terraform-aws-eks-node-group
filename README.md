## Node Group

This Terraform code snippet is used to launch a node group.

## Prerequisite

Before this module can be used on a project, you must ensure that the following pre-requisites are fulfilled:

1. Terraform is [installed](#software-dependencies) on the machine where Terraform is executed.
2. Make sure you had access to launch the resources in aws.
3. EKS Cluster needs to be created first.


### Software Dependencies
### Terraform
- [Terraform](https://www.terraform.io/downloads.html) 1.0.x



## Install

### Terraform
Be sure you have the correct Terraform version (1.0.x), you can choose the binary here:
- https://releases.hashicorp.com/terraform/

## File structure
The project has the following folders and files:

- main.tf: Main file for this module, contains all the resources to create
- provider.tf: File which will store the information about provider
- variables.tf: All the variables for the module
- output.tf: The outputs of the module
- README.md: This file
- lt.tf: Launch template configuration
- terrafrom.tfvars: Varaible files
 
## Usage

```
module "eks_cluster_nodegroup" {
  source = "git@github.com:IntelliGrape/terraform-aws-eks-node-group.git"
  environment = "testing"
  project     = "open source contribution"
  lt_name                 = "ng_eks_launch_template"
  vpc_security_group_ids  = ["sg-0f4b1084f64db50c5", "sg-024ac5730477138b4"]
  disable_api_termination = false
  image_id                = "ami-0cb0ebf0188779ab1"
  key_name                = "gocd_user"
  cluster_name    = "mycluster"
  node_group_name = "myfirstnodegroup"
  subnet_ids      = ["subnet-055eb434f841c1ec7", "subnet-082d1b94bacae6504", "subnet-05dec220d2885f6dd"]
  instance_types  = ["t3.medium", "t2.medium"]
  desired_size    = 2
  max_size        = 4
  min_size        = 1
}
```

### Step 1: Clone the repo
### Step 2: Then perform the following commands in the root folder:

- `terraform init` to get the plugins
- `terraform plan --var-file="terraform.tfvars"` to see the infrastructure plan
- `terraform apply --var-file="terraform.tfvars"` to apply the infrastructure build
- `terraform destroy --var-file="terraform.tfvars"` to destroy the built infrastructure

Note: We will require the following values in order to execute the code successfully: 
- EKS Cluster Name
- VPC Security Group IDs
- Subnet Ids

## Providers
| Name | Version |
|------|---------|
| aws  | 3.72.0 |

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
| node_role_arn | Amazon Resource Name (ARN) of the IAM Role that provides permissions for the EKS Node Group | `list(string)` | n/a | yes |
| lt_name | The name of Launch template | `string` | n/a | yes |
| vpc_security_group_ids | List of security group IDs to associate the Node Group with   | `list(string)` | n/a | yes |
| disable_api_termination | For enabeling EC2 Termination Protection, if it is true | `bool` | false | no |
| image_id | AMI id for node group | `string` | n/a | no |
| key_name | Key name for node group associated instance | `string` | n/a | yes |
| volume_size | Disk size in GiB for worker nodes  | `string` | 20 | no |
| volume_type | EBS Volume type of worker node | `string` | gp2 | no |
| cluster_name | Name of the EKS Cluster | `string` | n/a | yes |
| node_group_name | Name of the EKS Node Group. If omitted, Terraform will assign a random, unique name | `string` | n/a | yes |
| subnet_ids | Identifiers of EC2 Subnets to associate with the EKS Node Group.  | `list(string)` | n/a | yes |
| instance_types | List of instance types associated with the EKS Node Group | `list(string)` | ["t3.medium", "t2.medium"] | no |
| desired_size | Desired number of worker nodes | `number` | 2 | no |
| max_size | Maximum number of worker nodes | `number` | 4 | no |
| min_size | Minimum number of worker nodes | `number` | 1 | no |

## Output

| Name | Description | 
|------|-------------|
| node_role_arn | Amazon Resource Name (ARN) of the EKS Node Group | 

