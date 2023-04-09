resource "aws_lambda_function" "my_lambda_function" {
  filename         = "${data.archive_file.zip.output_path}"
  source_code_hash = "${data.archive_file.zip.output_base64sha256}"

  function_name    = var.function_name
  role             = aws_iam_role.Lambda_s3_ses.arn
  handler          = var.handler
  runtime          = var.runtime
}

data "archive_file" "zip" {
  type        = var.data_type
  source_file = var.data_source_file
  output_path = var.data_output_path
}


resource "aws_s3_bucket_notification" "my_bucket_notification" {
  bucket = aws_s3_bucket.my_bucket.id

  lambda_function {
    lambda_function_arn = aws_lambda_function.my_lambda_function.arn
    events              = ["s3:ObjectCreated:*"]
  }
}

resource "aws_lambda_permission" "allow_bucket" {
  statement_id  = var.statement_id
  action        = var.action
  function_name = aws_lambda_function.my_lambda_function.arn
  principal     = var.principal
  source_arn    = aws_s3_bucket.my_bucket.arn
}