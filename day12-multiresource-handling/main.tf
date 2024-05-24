resource "aws_instance" "name" {
    ami = "ami-0cc9838aa7ab1dce7"
    instance_type = "t2.micro"
    key_name = "key"

    tags = {
      Name="newtag"
    }
  
}

resource "aws_s3_bucket" "name" {
    bucket = "utdjcwwwiug1"
  
}