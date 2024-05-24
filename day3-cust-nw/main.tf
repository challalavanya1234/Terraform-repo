resource "aws_vpc" "dev" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "cust-vpc"
    }

  


}
resource "aws_subnet" "dev" {
    vpc_id = aws_vpc.dev.id
    cidr_block = "10.0.0.0/24"
    tags  = {
      Name="subnet"
    }
  
}
resource "aws_internet_gateway" "dev" {
    vpc_id = aws_vpc.dev.id
    tags = {
      Name="tf ig"
    }
  
}
resource "aws_route_table" "dev" {
    vpc_id = aws_vpc.dev.id

    route  {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.dev.id
    }
    tags = {
      Name="tf rt"
    }
  
}
resource "aws_route_table_association" "dev" {
    subnet_id = aws_subnet.dev.id
    route_table_id = aws_route_table.dev.id
  
}
resource "aws_security_group" "dev" {
    vpc_id = aws_vpc.dev.id
    tags = {
        Name= "tf_sg"

    }

    ingress {
        description = "ssh from vpc"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

   # ingress {
      #  description = "TLS from vpc"
       # from_port = 443
       # to_port = 443
      #  protocol = "tcp"
       # cidr_blocks = ["0.0.0.0/0"]
   # }

    #  ingress {
       # description = "HTTP from vpc"
       # from_port = 80
       # to_port = 80
       # protocol = "Tcp"
       # cidr_blocks = ["0.0.0.0/0"]
   # }

    egress { 
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]


    }
  
}
resource "aws_instance" "dev" {
    ami                     = "ami-0cc9838aa7ab1dce7"
    instance_type           = "t3.micro"
    subnet_id               = aws_subnet.dev.id
    key_name                = "key"
    vpc_security_group_ids  = [aws_security_group.dev.id]
    
    tags = {
      Name= "today"
    }
}
