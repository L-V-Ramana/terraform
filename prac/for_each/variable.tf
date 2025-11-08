variable "ami" {
  default = "ami-09c813fb71547fc4f"
}

variable "instances"{
    type = map
    default = {
        mongodb = "t3.micro"
        catalogue = "t3.small"
    }
}

variable "zone_id"{
    default = "ami-09c813fb71547fc4f"
}

variable "domain_name"{
    default= "ramana.site"
}