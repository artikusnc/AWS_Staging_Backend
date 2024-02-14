resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucketSergio"
 
  tags = {
    Name        = "Sergios S3 bucket"
    Environment = "Dev"
  }
}