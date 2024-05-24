provider "aws" { 
       
} 
data "aws_subnet" "selected" { 
  filter { 
    name   = "tag:Name" 
    values = ["subnet"] 
  } 
} 
 
resource "aws_instance" "dependency" { 
    ami = "ami-0cc9838aa7ab1dce7"
    instance_type = "t2.micro" 
    key_name = "key" 
    subnet_id = data.aws_subnet.selected.id 
    tags = { 
      Name="datasource" 
    } 
   
}