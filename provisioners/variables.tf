variable "ami_id" {
  type    = string
  default = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "from_port" {
 
  default = 0
}

variable "to_port" {
 
  default = 0
}

variable "cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "sg_tags"{
    default = {
        Name = "allow_all"
    }
}

variable "sg_name"{
    default = "allow_all"
}

variable "ec2_tags"{
    default = ["mongodb","mysql","rabbitmq","redis"]
}

variable "hosted_zone_id"{
    default = "Z03781442EPPF9VGY8NMT"
    
}

variable "dns"{
    default = "ramana.site"
    
}

variable "server_name_map"{
    default = {
      mongodb = "t3.micro"
      redis = "t3.micro"
      mysql = "t3.small"
      rabbitmq = "t3.micro"
    }
}

variable "ingress_ports"{
    default = [
      {from_port = 22
        to_port =22
      },
      {
        from_port =80
        to_port =80
      },
      {
        from_port = 8080
        to_port = 8080
      }
      ]

    
}

variable "sg_description"{
  type = string
  default = "Allow all traffic"
}

variable "sg_from_port"{
  default = 0
}

variable "sg_to_port"{
  type = number
  default = 0
}