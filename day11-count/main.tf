resource "aws_instance" "name" {
    ami="ami-0cc9838aa7ab1dce7"
    instance_type = "t2.micro"
    count = length(var.sandbox)
    tags = {
      Name=var.sandbox[count.index]
    }
  
}