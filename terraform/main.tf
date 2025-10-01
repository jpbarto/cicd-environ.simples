module "sqs" {
  source = "terraform-aws-modules/sqs/aws"

  name = "simples-queue"

  create_dlq = true
  redrive_policy = {
    # default is 5 for this module
    maxReceiveCount = 10
  }

  tags = local.required_tags
}

resource "helm_release" "simples" {
  name             = "simples"
  chart            = "simples"
  repository       = "../helm"
  namespace        = "simples"
  create_namespace = true

  set = [
    {
      name  = "env.SQS_QUEUE_NAME",
      value = module.sqs.queue_name
    },
    {
      name  = "env.SQS_DLQ_NAME",
      value = module.sqs.dead_letter_queue_name
    }
  ]
}

output "sqs_queue_name" {
  value = module.sqs.queue_name
}

output "dead_letter_queue_name" {
  value = module.sqs.dead_letter_queue_name
}