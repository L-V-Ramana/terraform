resource  "aws_instance""remote_state"{
    ami = data.aws_ami.amiID.id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.remote_state.id]
}

resource "aws_security_group" "remote_state"{
    
    name = "remote state"
    description = "allowing all traffic"

    ingress{
        from_port = 0
        to_port = 0
        protocol = "0"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    egress{
        from_port = 0
        to_port = 0
        protocol = "0"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
}