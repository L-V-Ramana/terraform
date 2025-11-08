resource "aws_instance""datasources"{
    
    ami = data.aws_ami.joindevops.id
    instance_type =var.environment == "dev" ? "t3.micro" : "t2.micro"
    vpc_security_group_ids = [""]

    tags = merge(var.common_tags,{
        name = "datasource"
    })
}

resource "aws_security_group" "datasource"{

    ingress {
        from_port =0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    egress {
        from_port =0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
}