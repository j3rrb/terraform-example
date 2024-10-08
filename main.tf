provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0e86e20dae9224db8"
  instance_type = "t2.micro"             

  key_name = "teste-terraform"

  tags = {
    Name = "TesteTerraform"
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = "teste-terraform"
  public_key = file("~/.ssh/id_rsa.pub")
}

output "instance_id" {
  value = aws_instance.example.id
}
