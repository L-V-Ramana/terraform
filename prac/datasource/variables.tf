variable "environment" {
  default = "dev" 
  
}

variable "common_tags"{

    default ={
         project = "Roboshop"
        terraform = "true"
    }
   
}