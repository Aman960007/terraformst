provider "aws" {
  region = "ap-south-1"
  access_key =
  secret_key =
}



resource "aws_instance" "myec2" {
  ami = "ami-0a9d27a9f4f5c0efc"
  instance_type = lookup(var.instance_type,terraform.workspace)
}


variable "instance_type" {
  type = map
  default = {
    default = "t2.nano"
    dev     = "t2.micro"
    prod     = "t2.large"
  }
}
