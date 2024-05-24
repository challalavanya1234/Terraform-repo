resource "aws_instance" "dependency" {
    ami = "ami-0cc9838aa7ab1dce7"
    instance_type = "t2.micro"
    key_name = "key"
    tags = {
        Name = "myec2"
    }
  
}

resource "aws_s3_bucket" "dependency" {
    bucket = "kjfklduoelj"
    depends_on = [ aws_instance.dependency ]
  
}