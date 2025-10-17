provider "aws" {
  region = var.region
}

provider "helm" {
  kubernetes = {
    host                   = data.terraform_remote_state.platform.outputs.eks_cluster_endpoint
    cluster_ca_certificate = base64decode(data.terraform_remote_state.platform.outputs.eks_cluster_ca_certificate)
    exec = {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", data.terraform_remote_state.platform.outputs.eks_cluster_name]
      command     = "aws"
    }
  }
}
