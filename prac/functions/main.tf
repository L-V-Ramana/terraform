resource "aws_instance""functions"{
    count = length(var.instances)
    ami = data.aws_ami.amiId.id
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.functions.id]
    tags = merge(var.common_tags,
    {
        name = var.instances[count.index]
    })
}

resource "aws_security_group""functions"{
    name = "functions"
    description = "allow all traffic"

    dynamic "ingress" {
        for_each = var.portnumbers
        content {
          from_port = ingress.value["from_port"]
        to_port = ingress.value["to_port"]
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
        }
        
    }

    egress {
        from_port =0
        to_port =0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
}