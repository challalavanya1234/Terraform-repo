resource "aws_s3_bucket" "remote" {
       bucket = "state-remote-9441"
            
} 

resource "aws_s3_bucket_versioning" "ver_examp" {
    bucket = aws_s3_bucket.remote.id
    versioning_configuration {
      status = "Enabled"
    }
  
}

resource "aws_dynamodb_table" "dynamo_tf" {
    name = "terraform_state_lock_dynamo1234"
    hash_key = "lockID"
    read_capacity = 20
    write_capacity = 20
    attribute {
      name ="LockId"
      type = "S"
    }  
}
  
