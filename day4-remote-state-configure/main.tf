resource "aws_instance" "name" {
    ami = "ami-0cc9838aa7ab1dce7"
    instance_type = "t2.micro"
    key_name = "key"

    tags = {
      Name="newtag"
    }
  
}


terraform {
  backend "s3" {
    bucket = "state-remote-store121"
    key = "terraform.tfstate"
    region = "ap-south-1"
    
  }
}