resource "aws_instance" "roboshop" {
  # count = 4
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  

  tags = {
    Name = "helloworld"
  }

 

  provisioner "local-exec" {
    command = "echo ${self.private_ip} > inventory" 
    on_failure = continue
  }

   provisioner "local-exec" {
    command = "echo 'when instance is destroying'" 
    when = destroy
  }

  
  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo dnf install nginx -y"  ,
      "sudo systemctl start nginx",
    ]
  }

  provisioner "remote-exec" {
    when = destroy
    inline = [
      "sudo systemctl stop nginx",
    ]
  }
  
}

resource "aws_security_group" "allow_all" {
  name        = var.sg_name
  description = var.sg_description
 
     egress {
    from_port        = var.sg_from_port
    to_port          = var.sg_to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
  }

  ingress {
    from_port        = var.sg_from_port
    to_port          = var.sg_to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }



  tags = var.sg_tags
}