locals {
  service_name = "simples"

  required_tags = {
    service_name = local.service_name,
    terraform   = "true"
  }
}