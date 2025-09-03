provider "aws" {
  region = "ap-south-1"
}

# CREATE VPC
resource "aws_vpc" "project_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "ProjectVPC"
  }
}

# CREATE 2 SUBNETS
resource "aws_subnet" "project_public_subnet_01" {
  vpc_id                  = aws_vpc.project_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-south-1a"
  tags = {
    Name = "project-public-subnet-01"
  }
}

resource "aws_subnet" "project_public_subnet_02" {
  vpc_id                  = aws_vpc.project_vpc.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "ap-south-1b"
  tags = {
    Name = "project-public-subnet-02"
  }
}

# INTERNET GATEWAY
resource "aws_internet_gateway" "project_igw" {
  vpc_id = aws_vpc.project_vpc.id
  tags = {
    Name = "Project-IGW"
  }
}

# ROUTE TABLE
resource "aws_route_table" "project_public_rt" {
  vpc_id = aws_vpc.project_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.project_igw.id
  }

  tags = {
    Name = "Project-RT"
  }
}

# ROUTE TABLE ASSOCIATION
resource "aws_route_table_association" "project_subnet_1" {
  subnet_id      = aws_subnet.project_public_subnet_01.id
  route_table_id = aws_route_table.project_public_rt.id
}

resource "aws_route_table_association" "project_subnet_2" {
  subnet_id      = aws_subnet.project_public_subnet_02.id
  route_table_id = aws_route_table.project_public_rt.id
}

# SECURITY GROUP
resource "aws_security_group" "project_sg" {
  name        = "project-sg"
  description = "Providing SSH Access"
  vpc_id      = aws_vpc.project_vpc.id

  ingress {
    description = "SSH Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

ingress {
    description = "Jenkins Access"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

ingress {
    description = "Sonarqube Access"
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "project-sg"
  }
}

# EC2 INSTANCES
resource "aws_instance" "demo_server" {
  ami                    = "ami-0e35ddab05955cf57"
  instance_type          = "t2.medium"
  key_name               = "kubernetes"
  subnet_id              = aws_subnet.project_public_subnet_01.id
  for_each               = toset(["Ansible", "Jenkins", "Docker"])
  vpc_security_group_ids = [aws_security_group.project_sg.id]

  tags = {
    Name = each.key
  }
}
