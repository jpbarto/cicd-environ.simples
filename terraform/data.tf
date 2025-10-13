data "terraform_remote_state" "platform" {
  backend = "s3"
  config = {
    bucket = "cicd-environ-tofu-state-prod-ab12cf"
    key = "prod/platform/terraform.tfstate"
    region = "us-east-2"
  }
}
