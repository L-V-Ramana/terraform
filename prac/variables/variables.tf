variable "ami" {
  type = string
  default = "ami-09c813fb71547fc4f"
}

variable "instance_type"{
    type = string
    default = "t3.micro"
}

variable "from_port"{
    type = number
    default = 0
}

variable "to_port"{
    type = number
    default = 0
}

variable "cidr_blocks"{
    type = list(string)
    default = ["0.0.0.0/0"]

}

variable "ipv6_cidr_block"{

    default = ["::/0"]
}

variable "tags"{
    type = map(string)
    default = {
        Name  = "roboshop"
    }

}

variable "sgname"{
    type = string
    default = "from variable file"
}