resource "aws_instance""loops"{
    count = 2
    ami = var.ami
    instance_type = var.environment == "dev" ? "t3.micro" : "t3.small"
    vpc_security_group_ids= [aws_security_group.loops.id]
    tags ={
        Name = var.instances[count.index]
    } 
}

resource "aws_security_group" "loops" {
    name = "loops"
    description = "allows all traffic"

    ingress{
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    egress{
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
}