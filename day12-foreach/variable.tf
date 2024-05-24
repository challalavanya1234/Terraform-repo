variable "ami_id" {
    type = string
    default = "ami-0cc9838aa7ab1dce7"
  
}
variable "instance_type" {
    type = string
    default = "t2.micro"
  
}
variable "key_name" {
    type = string
    default = "key"
  
}
variable "sandbox" {
    type = list(string)
    default = [ "lav","anu","sin" ]  
}