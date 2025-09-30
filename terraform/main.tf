module "sqs" {
  source  = "terraform-aws-modules/sqs/aws"

  name = "simples-queue"

  create_dlq = true
  redrive_policy = {
    # default is 5 for this module
    maxReceiveCount = 10
  }

  tags = local.required_tags
}

output "sqs_queue_name" {
  value = module.sqs.queue_name
}

output "dead_letter_queue_name" {
  value = module.sqs.dead_letter_queue_name
}