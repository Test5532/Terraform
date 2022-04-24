provider "aws" {
	region = "us-east-1"
}


variable "VPC_cidr_block"{
    description= "VPC_cidr_block_A"
}


variable "subnet_cidr_block_A"{
    description= "subnet_cidr_block_A"
}

variable "subnet_cidr_block_B"{
     description= "subnet_cidr_block_B"
}


resource "aws_vpc" "Testv1-vpc"{
cidr_block = var.VPC_cidr_block
#cidr_block = "10.202.0.0/16"
instance_tenancy = "default"
enable_dns_support=true
enable_dns_hostnames=true
tags = {
    Name = "Testv1-vpc"
	Place= "Virginia"
  }
}


resource "aws_subnet" "AZA" {
vpc_id = aws_vpc.Testv1-vpc.id
cidr_block = var.subnet_cidr_block_A
#cidr_block = "10.202.1.0/24"
availability_zone="us-east-1a"
map_public_ip_on_launch="true"
 tags = {
    Name = "AZA"
  }
}

resource "aws_subnet" "AZB" {
vpc_id = aws_vpc.Testv1-vpc.id
cidr_block = var.subnet_cidr_block_B
#cidr_block = "10.202.3.0/24"
availability_zone="us-east-1a"
map_public_ip_on_launch="true"
 tags = {
    Name = "AZB"
  }
}


 
output "vpc_id"{
value = aws_vpc.Testv1-vpc.id
}

output "subnet_idA"{
value = aws_subnet.AZA.id
}

output "subnet_idB"{
value = aws_subnet.AZB.id
}