resource "aws_instance" "roboshop"{
    ami = var.ami
    instance_type = var.instance_type
    vpc_security_group_ids = [ aws_security_group.allow_all2.id ]
    tags = var.tags
}

resource "aws_security_group" "allow_all2" {
  ingress{
    from_port = var.from_port
    to_port = var.to_port
    protocol =  "-1"
    cidr_blocks = var.cidr_blocks
    ipv6_cidr_blocks= var.ipv6_cidr_block
  }

  egress {
    from_port= var.from_port
    to_port = var.to_port
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
    tags={
        name = var.sgname
    }
}