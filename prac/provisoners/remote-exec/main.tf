resource "aws_instance""remote-state"{
    ami = data.aws_ami.amiID.id
    instance_type= "t3.micro"
    vpc_security_group_ids = [aws_security_group.remote_state.id]

    provisioner "local-exec" {
      command = "echo ${self.public_ip}>>inventroy"
    }
    connection {
        type = "ssh"
        user = "ec2-user"
        password = "DevOps321"
        host = self.public_ip
    }
    

    provisioner "remote-exec"{
        inline=[
            "sudo dnf install nginx -y",
            "sudo systemctl start nginx"
        ]
      
    }

    provisioner "remote-exec"{
        inline = [
            "sudo systemctl stop nginx"
        ]
        when = destroy
    }
}

resource "aws_security_group" "remote_state"{
    name= "remote_state"

    ingress{
        from_port = 0
        to_port = 0
        protocol= "-1"
        cidr_blocks= ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
    egress{
        from_port = 0
        to_port = 0
        protocol= "-1"
        cidr_blocks= ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

}