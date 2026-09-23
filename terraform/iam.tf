resource "aws_iam_role_policy" "ec2_s3" {
  name = "${var.project_name}-ec2-s3-policy"
  role = aws_iam_role.ec2_ssm.id

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject"
        ]

        # Object permissions for objects inside your specific bucket.
        Resource = "${aws_s3_bucket.app.arn}/*"
      },
      {
        Effect = "Allow"

        Action = [
          "s3:ListBucket"
        ]

        # Bucket-level ListBucket permission.
        Resource = aws_s3_bucket.app.arn
      }
    ]
  })
}
