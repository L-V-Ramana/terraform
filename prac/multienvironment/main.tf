resource "aws_instance""roboshop"{
    count = length(var.instances)
    ami = data.aws_ami.amiID.id
    instance_type = var.instance_type
    vpc_security_group_ids = [aws_security_group.vartf.id]

    tags=merge(var.common_tags,
    {
        Name = "${var.environment}-${var.instances[count.index]}"
    }
    )
}

resource "aws_security_group""vartf"{
    # count = length(var.instances)
    name = "${var.environment}-allow-all"
    description ="allowing all traffic from all ports"

    ingress{
        from_port= 0
        to_port =0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    egress{
        from_port= 0
        to_port =0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

}