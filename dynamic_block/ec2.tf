resource "aws_instance" "roboshop" {
  count = 4
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_all.id]
  

  tags = {
    Name = "helloworld"
  }
  
}

resource "aws_security_group" "allow_all" {
  name        = var.sg_name
  description = "allow all traffic"
 
   dynamic  "egress" {
    for_each = var.ingress_ports
    content{
        from_port        = egress.value["from_port"]
        to_port          = egress.value["to_port"]
        protocol         = "-1"
        cidr_blocks      = var.cidr_blocks
    }
   
  }

 dynamic "ingress" {
    for_each =  var.ingress_ports
    content  {
        from_port        = ingress.value["from_port"]
        to_port          = ingress.value["to_port"]
        protocol         = "-1"
        cidr_blocks      = var.cidr_blocks
        ipv6_cidr_blocks = ["::/0"]
    }
    
  }



  tags = var.sg_tags
}