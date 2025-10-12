provider "aws" {
  region = var.aws_region
}

data "terraform_remote_state" "k8s_cluster" {
  backend = "s3"
  config = {
    bucket = "tofu-state-prod-AB12CF"
    key = "prod/platform/terraform.tfstate"
    region = "us-east-2"
  }
}

provider "helm" {
  kubernetes = {
    host                   = data.terraform_remote_state.k8s_cluster.eks_cluster_endpoint
    cluster_ca_certificate = base64decode(data.terraform_remote_state.k8s_cluster.eks_cluster_ca_certificate)
    exec = {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", data.terraform_remote_state.k8s_cluster.eks_cluster_name]
      command     = "aws"
    }
  }
}
