variable "instance_type"{
    default = {
        dev = "t3.micro"
        prod = "t3.small"
        qa = "t2.small"
    }
}

variable "instances"{
    default = ["mongodb","catalogue"]
}

variable "common_tags"{
    default = {
        project = "roboshop"
        terraform = "true"
    }
}

variable "ports" {
    default = [
        {
            from_port =0
            to_port = 0
        },
        {
            from_port = 80
            to_port = 80
        }

        ]
  
}