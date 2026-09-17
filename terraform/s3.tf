
#Create an S3 bucket and call it app inside Terraform.
resource "aws_s3_bucket" "app" {
  bucket = "{var.project_name}-app-storage"
#Terraform builds the bucket name using your project name.

  tags = {
    Name  = "${var.project_name}-app-storage"
  }
}

resource "aws_s3_bucket_public_access_block" "app" {
  bucket = aws_s3_bucket.app.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restric_public_buckets  = true
}
