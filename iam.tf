resource "aws_iam_role" "Lambda_s3_ses" {
  name = var.iam_role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "my_role_policy_attachment_s3" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  role       = aws_iam_role.Lambda_s3_ses.name
}

resource "aws_iam_role_policy_attachment" "my_role_policy_attachment_ses" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonSESFullAccess"
  role       = aws_iam_role.Lambda_s3_ses.name
}

resource "aws_iam_role_policy_attachment" "my_role_policy_attachment_cloudwatch" {
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchFullAccess"
  role       = aws_iam_role.Lambda_s3_ses.name
}
