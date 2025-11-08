variable "instances"{
    default = ["mongodb","catalogue"]
}

variable "common_tags"{
    default = {
        project = "roboshop"
        terraform =  true
    }
} 

variable "environment"{

}

variable "instance_type"{
    
}