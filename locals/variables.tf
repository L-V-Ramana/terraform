variable "instance_type"{
    default = "t3.micro"
}

variable "ec2_tags"{
    default = {
        Name = "helloworld"
    }
}

variable "from_port"{
    default =  0
}

variable "to_port"{
    default =  0
}

variable "cidr_blocks"{
    type = list(string)
    default = ["0.0.0.0/0"]
    
}

variable "instances"{
    default = ["mysql","rabbitmq","mongodb"]
}


variable "domainname"{
    default = "ramana.site"
}

variable "zone_id"{
    default = "Z03781442EPPF9VGY8NMT]"
    }

variable "sg_tag"{
    default = {
        Name = "allow_all"
    }
}

variable "instances"{
    default = {
        "mysql" = "t3.small"
        "rabbitmq" = "t3.micro"
        "mongodb" = "t3.micro"
        
    }
}

