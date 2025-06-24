provider "aws" {
  region = "eu-west-2"
}

resource "aws_s3_bucket" "examplebucket" {
  bucket = "sample-bucket-evelyn-2025"
}

resource "aws_s3_bucket_versioning" "example_bucket_versioning" {
  bucket = aws_s3_bucket.examplebucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "example_bucket_encryption" {
  bucket = aws_s3_bucket.examplebucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

output "bucket_name" {
  value       = aws_s3_bucket.examplebucket.bucket
  description = "terraform_demo_bucket"
}
