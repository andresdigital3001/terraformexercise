resource "aws_kinesis_stream" "data_stream" {
  name             = "data-stream"
  shard_count      = 2
  retention_period = 24
}
