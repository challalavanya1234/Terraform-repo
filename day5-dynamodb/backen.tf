terraform {
    backend "s3" {
    bucket = "state-remote-9441"
    key = "terraform.tfstate"
    region = "ap-south-1"
    #dynamodb_table = "terraform_state_lock_dynamo1234"
   # encrypt = true
    
  }
}