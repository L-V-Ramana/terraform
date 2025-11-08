variable "ami"{
    default = "ami-09c813fb71547fc4f"
}

variable "environment"{
    default = "dev"
}

variable "tags"{
    default = {
      Name = "roboshop"
    }
}

variable "instances"{
  type = list
  default = [ "mongodb","catalogue" ]
}

variable "zone_id"{
  default = "Z09108151OJP740F79CO"
}

variable "domain_name"{
  default = "ramana.site"
}