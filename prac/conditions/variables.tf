variable "ami"{
    type = string
    default = "ami-09c813fb71547fc4f"
}

variable "instance_type"{
    type = string
    default = "t3.micro"
}

variable "cidr-blocks"{
    type = list(string)
    default = ["0.0.0.0/0"]
}

variable "ipv6"{
    type = list(string)
    default = [ "::/0" ]
}

variable "environment"{
    type = string
    default = "dev"
}

variable "tags" {
    type = map(string)
    default = {
      Name = "Condtions"
    }
}
