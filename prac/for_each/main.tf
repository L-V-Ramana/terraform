resource "aws_instance" "for_each"{
    for_each = var.instances
    ami = var.ami
    instance_type = each.value
    vpc_security_group_ids = [ aws_security_group.for_each.id ]

    tags = {
        Name = each.key
    }
}

resource "aws_security_group" "for_each" {
  name = "for_each"
  description = "allow all"

  ingress{
    from_port = 0
    to_port = 0
    protocol ="-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  egress{
    from_port = 0
    to_port = 0
    protocol ="-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}