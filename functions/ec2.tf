resource "aws_instance" "roboshop" {
  count = length(var.ec2_tags)
  ami           = var.ami_id
  instance_type = var.ec2_tags[count.index] == "mysql" ? "t3.small" : "t3.micro"

  tags = merge(var.common_tags,
  {
    component = var.ec2_tags[count.index]
    name = var.ec2_tags[count.index]
  } 
  )
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

  tags = merge(var.common_tags,
    {
      Name = "allow"
    } 
  )
}