variable "ami_id" {
  type    = string
  default = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
  
  default = "t3.micro"
}

variable "ec2_tag" {
  default = {
    name="helloworld"
    }
}

variable "sg_name"{
    default = "varfile_allow_all"
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

variable "cidr_blocks"{
  type = list(string)
  default = ["0.0.0.0/0"]
}

variable "sg_tags"{
    type = map(string)
    default = {
      Name = "Allow_All"
    }
}

variable "environment"{

  default = "prod"
}

variable "instances"{
  default = ["mongodb","reddis","mysql","rabbitmq"]
}