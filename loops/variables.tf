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

variable "ec2_tags"{
    default = ["mongodb","mysql","rabbitmq","reddis"]
}

variable "hosted_zone_id"{
    default = "Z03781442EPPF9VGY8NMT"
    
}

variable "dns"{
    default = "ramana.site"
    
}

variable "common_tags"{
  default = {
    name = "roboshop"
    source = "terraform"
  }
}


