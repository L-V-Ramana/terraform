locals {
  
  ec2_output = data.aws_ami.roboshopami.id
  combo = merge(var.sample1,var.sample2)
  servers = aws_instance.roboshop
   
}

variable "sample1"{
    default = {
      Name = "ramana"
      last_name = "venkata"
    } 
}

variable "sample2"{
    default = {
      Name = "lella"
      last_name = "lakshmi"
      }
}
# variable combo{
#     default = merge(var.sample1,var.sample2)
# }



# variable "route53_name" {
  
#   default = var.instance
# }

# variable "service_token" {
#   type      = string
#   ephemeral = true
# }

# locals {
#   service_tag   = "${var.service_name}-${var.environment}"
#   session_token = "${var.service_name}:${var.service_token}"
# }
