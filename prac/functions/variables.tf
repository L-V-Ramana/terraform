variable "common_tags"{
    default = {
        project = "Roboshop"
        terraform = "true"
    }
}

variable instances{
    default = ["mongodb","catalogue"]
}

variable "portnumbers"{
    default = [
        {
            from_port = 0
            to_port =0
        }
    ]
}