resource  "aws_instance""remote_state"{
    
    count = length(var.instances)
    ami = data.aws_ami.amiID.id
    instance_type =lookup(var.instance_type,terraform.workspace)
    vpc_security_group_ids = [aws_security_group.workspace.id]

    tags = merge(var.common_tags,
        {
            Name = "roboshop-${terraform.workspace}-${var.instances[count.index]}"
        }
    )
}

resource "aws_security_group" "workspace"{
    
    name = "roboshop-${terraform.workspace}"
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

    tags = {
        Name = "roboshop-${terraform.workspace}"
    }
}