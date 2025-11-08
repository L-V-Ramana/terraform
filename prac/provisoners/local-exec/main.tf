resource "aws_instance""local_exec"{
    ami = data.aws_ami.amiID.id
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.local-exec.id]

    provisioner "local-exec" {
      command = "${self.private_ip} >> inventroy"
      on_failure = continue
    }

    provisioner "local-exec" {
      command = "rm -rf ./inventroy"
      when = destroy
    }
}

resource "aws_security_group" "local-exec" {
    name = "local-exec"

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