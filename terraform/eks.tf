# eks cluster
resource "aws_eks_cluster" "particle41-eks" {
  name     = var.eks_cluster_name
  role_arn = aws_iam_role.eks_cluster_role.arn
  version  = "1.31"

  access_config {
    authentication_mode = "API_AND_CONFIG_MAP"
  }

  vpc_config {
    subnet_ids = [aws_subnet.private_subet_a.id, aws_subnet.private_subet_b.id]
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_policy,  
    aws_iam_role_policy_attachment.eks_service_policy,
  ]

  tags = {
    Name = var.eks_cluster_name
  }
}

# add access entry for admin user
resource "aws_eks_access_entry" "access_entry" {
  cluster_name      = aws_eks_cluster.particle41-eks.name
  principal_arn     = var.AWS_ADMIN_USER_ARN
  kubernetes_groups = ["masters"]
  type              = "STANDARD"
}

# for admin user grant permissions on user 
resource "aws_eks_access_policy_association" "eks_admin_policy_association" {
  cluster_name  = aws_eks_cluster.particle41-eks.name
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
  principal_arn = var.AWS_ADMIN_USER_ARN

  access_scope {
    type       = "cluster"
  }
}

# eks cluster node group
resource "aws_eks_node_group" "node_group" {
  cluster_name    = aws_eks_cluster.particle41-eks.name
  node_group_name = "node_group"
  node_role_arn   = aws_iam_role.eks_node_role.arn 
  subnet_ids      = [aws_subnet.private_subet_a.id, aws_subnet.private_subet_b.id]

  scaling_config {
    desired_size = 2
    max_size     = 2
    min_size     = 2
  }

 update_config {
    max_unavailable = 1
  }

  # capacity_type = "SPOT"  # ON_DEMAND
  instance_types = ["t2.micro"]  # ["t3.medium"]
  disk_size = 20

  # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
  # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
  depends_on = [
    aws_iam_role_policy_attachment.eks_worker_node_policy,
    aws_iam_role_policy_attachment.eks_cni_policy,
    aws_iam_role_policy_attachment.ec2_container_registry_readonly_policy,
  ]
}