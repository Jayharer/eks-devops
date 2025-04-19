# # eks cluster
# resource "aws_eks_cluster" "particle41_eks" {
#   name     = "particle41_eks"
#   role_arn = aws_iam_role.eks_cluster_role.arn

#   vpc_config {
#     subnet_ids = [aws_subnet.private_subet_1.id, aws_subnet.private_subet_2.id]
#   }

#   depends_on = [
#     aws_iam_role_policy_attachment.eks_cluster_policy,  
#     aws_iam_role_policy_attachment.eks_service_policy,
#   ]

#   tags = {
#     Name = "particle41_eks"
#   }
# }

# # eks cluster
# resource "aws_eks_node_group" "particle41_eks_node_grop" {
#   cluster_name    = aws_eks_cluster.particle41_eks.name
#   node_group_name = "particle41_eks_node_grop"
#   node_role_arn   = aws_iam_role.eks_node_role.arn 
#   subnet_ids      = [aws_subnet.private_subet_1.id, aws_subnet.private_subet_2.id]

#   scaling_config {
#     desired_size = 1
#     max_size     = 1
#     min_size     = 1
#   }

#   # Ensure that IAM Role permissions are created before and deleted after EKS Node Group handling.
#   # Otherwise, EKS will not be able to properly delete EC2 Instances and Elastic Network Interfaces.
#   depends_on = [
#     aws_iam_role_policy_attachment.eks_worker_node_policy,
#     aws_iam_role_policy_attachment.eks_cni_policy,
#     aws_iam_role_policy_attachment.ec2_container_registry_readonly_policy,
#   ]
# }