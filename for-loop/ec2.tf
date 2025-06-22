resource "aws_instance" "roboshop" {
    #for_each = var.server_name_map
    for_each = toset(var.ec2_tags)
  ami           = var.ami_id
  instance_type = each.key == "mysql" ? "t3.small" : "t3.micro"

  tags = {
    Name = each.key
  } 
}

resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "allow_all_requestes"
  
  egress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = var.sg_tags
}