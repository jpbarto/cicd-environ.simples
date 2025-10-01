provider "aws" {
  region = var.aws_region
}

provider "helm" {
  kubernetes = {
    host                   = var.kubernetes_host
    cluster_ca_certificate = base64decode(var.kubernetes_cluster_ca_certificate)
    exec = {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", var.kubernetes_cluster_name]
      command     = "aws"
    }
  }
}