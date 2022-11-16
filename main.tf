locals {
  create_role = length(var.node_role_arn) == 0
}

resource "aws_eks_node_group" "terraform_node_group" {
  cluster_name    = var.cluster_name
  node_group_name = var.node_group_name
  node_role_arn   = local.create_role ? aws_iam_role.eks-iam-ng[0].arn : var.node_role_arn[0]
  subnet_ids      = var.subnet_ids
  instance_types  = var.instance_types
  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }
  tags = var.tags
  launch_template {
    name    = aws_launch_template.ng_eks_launch_template.name
    version = aws_launch_template.ng_eks_launch_template.latest_version
  }
  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [aws_iam_role_policy_attachment.eks-iam-ng-AmazonEKSWorkerNodePolicy, aws_iam_role_policy_attachment.eks-iam-ng-AmazonEKS_CNI_Policy, aws_iam_role_policy_attachment.eks-iam-ng-AmazonEC2ContainerRegistryReadOnly, aws_iam_role_policy_attachment.eks-iam-ng-AmazonSSMManagedInstanceCore, aws_launch_template.ng_eks_launch_template
  ]
}

resource "aws_iam_role" "eks-iam-ng" {
  count = local.create_role ? 1 : 0

  name = "eks-node-group-example"

  assume_role_policy = jsonencode({
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
    }]
    Version = "2012-10-17"
  })
}

resource "aws_iam_role_policy_attachment" "eks-iam-ng-AmazonEKSWorkerNodePolicy" {
  count      = local.create_role ? 1 : 0
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = aws_iam_role.eks-iam-ng[0].name
}

resource "aws_iam_role_policy_attachment" "eks-iam-ng-AmazonEKS_CNI_Policy" {
  count      = local.create_role ? 1 : 0
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = aws_iam_role.eks-iam-ng[0].name
}

resource "aws_iam_role_policy_attachment" "eks-iam-ng-AmazonEC2ContainerRegistryReadOnly" {
  count      = local.create_role ? 1 : 0
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = aws_iam_role.eks-iam-ng[0].name
}

resource "aws_iam_role_policy_attachment" "eks-iam-ng-AmazonSSMManagedInstanceCore" {
  count      = local.create_role ? 1 : 0
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  role       = aws_iam_role.eks-iam-ng[0].name
}
