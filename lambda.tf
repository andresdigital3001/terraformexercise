resource "aws_lambda_function" "data_processor" {
  function_name    = "data-processor_jl"
  handler         = "index.handler"
  runtime         = "python3.9"
  role            = aws_iam_role.lambda_role.arn
  filename        = "lambda_function.zip" 

  environment {
    variables = {
      KINESIS_STREAM = aws_kinesis_stream.data_stream.name
    }
  }
}

resource "aws_iam_role" "lambda_role" {
  name = "lambda_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = { Service = "lambda.amazonaws.com" }
    }]
  })
}
