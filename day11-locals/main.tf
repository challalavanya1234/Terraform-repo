locals {
  bucket-name = "${var.layer}-${var.env}-bucket-lavanya"
}

resource "aws_s3_bucket" "demo" {
    bucket = local.bucket-name
    tags = {
      Name=local.bucket-name
      Environment = var.env
    }
  
}