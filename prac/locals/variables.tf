variable "project" {
  default = "Roboshop"
}

variable "environment"{
    default = "dev"
}

variable "component" {
    default = "locals"
}   
variable "common_tags" {
    default = {
        project = "roboshop"
        environment="dev"
    }
}   

# variable "final_name"{
#     default = "${var.project}-${var.environment}-${var.component}"
# }