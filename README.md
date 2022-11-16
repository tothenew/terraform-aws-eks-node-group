# terraform-aws-eks-node-group

[![Lint Status](https://github.com/tothenew/terraform-aws-eks-node-group/workflows/Lint/badge.svg)](https://github.com/tothenew/terraform-aws-eks-node-group/actions)
[![LICENSE](https://img.shields.io/github/license/tothenew/terraform-aws-eks-node-group)](https://github.com/tothenew/terraform-aws-eks-node-group/blob/master/LICENSE)

This is a eks-node-group to use for baseline. The default actions will provide updates for section bitween Requirements and Outputs.

The following content needed to be created and managed:
 - Introduction
     - Explaination of module 
     - Intended users
 - Resource created and managed by this module
 - Example Usages

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.72 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.10 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 3.72 |
| <a name="provider_template"></a> [template](#provider\_template) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eks_node_group.terraform_node_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eks_node_group) | resource |
| [aws_iam_role.eks-iam-ng](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.eks-iam-ng-AmazonEC2ContainerRegistryReadOnly](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks-iam-ng-AmazonEKSWorkerNodePolicy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks-iam-ng-AmazonEKS_CNI_Policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.eks-iam-ng-AmazonSSMManagedInstanceCore](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_launch_template.ng_eks_launch_template](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_template) | resource |
| [template_file.launch_template_user_data](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_Name"></a> [Name](#input\_Name) | n/a | `string` | `"EKS-MANAGED-NODE"` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | The name of the EKS cluster | `string` | n/a | yes |
| <a name="input_desired_size"></a> [desired\_size](#input\_desired\_size) | Initial desired number of worker nodes (external changes ignored) | `number` | `2` | no |
| <a name="input_disable_api_termination"></a> [disable\_api\_termination](#input\_disable\_api\_termination) | It enables EC2 Termination Protection, if it is true. | `bool` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment Tag value | `string` | n/a | yes |
| <a name="input_image_id"></a> [image\_id](#input\_image\_id) | The AMI from which to launch the instance. | `any` | n/a | yes |
| <a name="input_instance_types"></a> [instance\_types](#input\_instance\_types) | Instance types to use for this node group. | `list(string)` | <pre>[<br>  "t3.medium",<br>  "t2.medium"<br>]</pre> | no |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | SSH Key to access Instances. | `string` | n/a | yes |
| <a name="input_lt_name"></a> [lt\_name](#input\_lt\_name) | The name of the launch template. If blank, Terraform will auto-generate a unique name. | `string` | n/a | yes |
| <a name="input_max_size"></a> [max\_size](#input\_max\_size) | Maximum number of worker nodes | `number` | `4` | no |
| <a name="input_min_size"></a> [min\_size](#input\_min\_size) | Minimum number of worker nodes | `number` | `1` | no |
| <a name="input_node_group_name"></a> [node\_group\_name](#input\_node\_group\_name) | The name of the EKS cluster | `string` | n/a | yes |
| <a name="input_node_role_arn"></a> [node\_role\_arn](#input\_node\_role\_arn) | ARN of the IAM policy. | `list(string)` | `[]` | no |
| <a name="input_project"></a> [project](#input\_project) | Environment Tag value | `string` | n/a | yes |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | A list of subnet IDs to launch resources in | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags | `map(string)` | n/a | yes |
| <a name="input_volume_size"></a> [volume\_size](#input\_volume\_size) | Size of worker node | `string` | `"20"` | no |
| <a name="input_volume_type"></a> [volume\_type](#input\_volume\_type) | EBS Volume type of worker node | `string` | `"gp2"` | no |
| <a name="input_vpc_security_group_ids"></a> [vpc\_security\_group\_ids](#input\_vpc\_security\_group\_ids) | List of security group IDs to associate the Node Group with. | `list(string)` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->

## Authors

Module managed by [TO THE NEW Pvt. Ltd.](https://github.com/tothenew)

## License

Apache 2 Licensed. See [LICENSE](https://github.com/tothenew/terraform-aws-eks-node-group/blob/main/LICENSE) for full details.
