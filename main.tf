resource "aws_s3_bucket" "terraform_state" {
  bucket = "aniket-terraform-backend-state100"  
  versioning {
    enabled = true
  }  
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_dynamodb_table" "terraform_lock" {
  name         = "terraform-backend-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"  
  
  attribute {
    name = "LockID"
    type = "S"
  }
}