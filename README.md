# particle41-devops

## Tools Used
1. AWS Cloud
2. Github Actions
3. Terraform
4. Git
5. Python
6. aws-cli
7. eksctl
9. Kubectl
---

## Installation

### 1. Create IAM user
```
Inside AWS Console -  

step1:
    IF you have admin User in account:
        Use existing admin user
        Update Admin user name in terraform/terraform.tfvars file
        of variable AWS_ADMIN_USER_ARN, replace jay with your existing user name.
    Else:
        Create IAM user jay , assign AdminFull access

step2:
    create access and secret key for above user.

step3:
    create s3 bucket(name=custom-s3-bucket-name)
```

### 2. Update **terraform/backend.tf** with
```
bucket = "custom-s3-bucket-name"
```

### 3. Clone repo
```bash
git clone https://gitlab.com/jay416505/eks-devops.git
```

### 4. Create new repo in Github and Configure Following secrets in GithubActions
```
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY
AWS_REGION
```

AWS_ECR_LINK = 861936062471.dkr.ecr.us-east-1.amazonaws.com/particle41_ecr_repo
AWS_ECR_REPO_NAME = particle41_ecr_repo
AWS_EKS_CLUSTER_NAME


### 5. Push changes to new Github repo
```bash
cd eks-devops
git remote remove origin
git remote add origin <<https-url-of-your-new-git-remote-repo>>
git branch -M main
git push -uf origin main
```






