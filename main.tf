locals {
  create_role = length(var.node_role_arn) == 0
}

resource "aws_eks_node_group" "terraform_node_group" {
  cluster_name    = "testing-cluster"
  node_group_name = "testing-node-group"
  node_role_arn   = local.create_role ? aws_iam_role.eks-iam-ng[0].arn : var.node_role_arn[0]
  #aws_iam_role.eks-iam-ng.arn
  subnet_ids     = ["subnet-055eb434f841c1ec7", "subnet-082d1b94bacae6504", "subnet-05dec220d2885f6dd"]
  instance_types = ["t3.medium", "t2.medium"]
  scaling_config {
    desired_size = 2
    max_size     = 4
    min_size     = 1
  }

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
