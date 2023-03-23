resource "aws_instance" "ec2-instance" {
  ami                     = var.ami
  instance_type           = var.instance_type
 tags = {
   "Name" = "jenkins-server"
 }

 key_name = "MyKeyPair"

 user_data = file("jenkins-server-script.sh")

 vpc_security_group_ids = [aws_security_group.default-sg.id]

 subnet_id = aws_subnet.my_subnet_1.id

 associate_public_ip_address = true
}

# resource "aws_key_pair" "ssh-key"{
#   key_name   = "id_rsa"
#   public_key = file("/home/vagrant/.ssh/id_rsa.pub")
# }

# Security group

resource "aws_security_group" "default-sg" {
  name        = "allow_ssh_access and jenkins default port"
  description = "Allow port 22 and port 8080 inbound traffic"
  vpc_id      = aws_vpc.my_assignment_vpc.id

  ingress {
    description      = "TLS from VPC"
    from_port        = "${var.inbound_ports[0]}"
    to_port          = "${var.inbound_ports[0]}"
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "TLS from VPC"
    from_port        = "${var.inbound_ports[1]}"
    to_port          = "${var.inbound_ports[1]}"
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 9411
    to_port     = 9411
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 9090
    to_port     = 9090
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 30001
    to_port     = 30001
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 30002
    to_port     = 30002
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
   from_port   = 31601
   to_port     = 31601
   protocol    = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
 }
  ingress {
   from_port   = 30008
   to_port     = 30008
   protocol    = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
 }
  ingress {
   from_port   = 5432
   to_port     = 5432
   protocol    = "tcp"
   cidr_blocks = ["0.0.0.0/0"]
 }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "altschoolAssignment-sg"
  }
}