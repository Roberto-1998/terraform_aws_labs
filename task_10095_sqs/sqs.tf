resource "aws_sqs_queue" "queue" {
  name                        = "MyWhizQueue.fifo"
  fifo_queue                  = true
  content_based_deduplication = true
}

resource "aws_sqs_queue" "queue2" {
  name = "MyWhizQueue"
}