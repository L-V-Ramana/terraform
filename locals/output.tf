output "instances" {
  value = aws_instance.roboshop
}

output "sg_id" {
  value = aws_security_group.allow_all
}

output "from_local"{
    value = local.combo
}

output "from_local2"{
    value = local.ec2_output
}
output "aws_id_from-data"{
  value = local.ec2_output  
}

# output "servers"{
#   value = local.aws_instance.roboshop
# }

output "servers"{
  value = local.servers 
}