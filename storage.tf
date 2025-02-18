resource "aws_s3_bucket" "raw_data" {
  bucket = "raw-data-bucket"
}

resource "aws_dynamodb_table" "processed_data" {
  name         = "processed-data"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "id"

  attribute {
    name = "id"
    type = "S"
  }
}
