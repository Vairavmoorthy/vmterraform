provider "aws" {
  region = "ap-south-1"
}

resource "aws_vpc" "awsvpc" {
  cidr_block = "10.0.0.0/16"

}
resource "aws_subnet" "public" {
 vpc_id = aws_vpc.awsvpc.id
 cidr_block = "10.0.2.0/24"
 availability_zone = "ap-south-1b"
}
resource "aws_internet_gateway" "aig" {
  vpc_id = aws_vpc.awsvpc.id
}
resource "aws_route_table" "public_RT" {
    vpc_id = aws_vpc.awsvpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.aig.id

    }
}
resource "aws_route_table_association" "pub_subnet_asn" {
        subnet_id = aws_subnet.public.id
        route_table_id = aws_route_table.public_RT.id
}
resource "aws_security_group" "public_sec" {
  name_prefix = "access8080"
  vpc_id = aws_vpc.awsvpc.id
  ingress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_instance" "ubuntu20-a" {
  ami = "ami-08e5424edfe926b43"
  instance_type = "t2.micro"
  key_name = "vm"
  user_data = file("apache.sh")
 subnet_id = aws_subnet.public.id
 vpc_security_group_ids = [aws_security_group.public_sec.id]
 associate_public_ip_address = true
}
resource "aws_instance" "ubuntu20-splunk" {
  ami = "ami-08e5424edfe926b43"
  instance_type = "t2.micro"
  key_name = "vm"
 user_data = file("Docker.sh")
 subnet_id = aws_subnet.public.id
 vpc_security_group_ids = [aws_security_group.public_sec.id]
 associate_public_ip_address = true
}
