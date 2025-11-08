resource "aws_instance" "conditions"{
    ami = var.ami
    instance_type = var.environment == "dev" ? "t3.micro" : "t3.small" 
    vpc_security_group_ids = [aws_security_group.conditions.id]

    tags = var.tags
}

resource "aws_security_group" "conditions"{
   
   name = "security-group-conditions"
   description = "allowing all traffic"
    ingress{
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = var.cidr-blocks
        ipv6_cidr_blocks = var.ipv6
    }

     egress{
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = var.cidr-blocks
        ipv6_cidr_blocks = var.ipv6
    }
}
