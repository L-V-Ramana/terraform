variable "ami_id"{
    default = "ami-09c813fb71547fc4f"
}

variable "portnumbers"{
    default = [ 
        {
            from_port : 22
            to_port: 22
         },
         {
            from_port=80
            to_port = 80
         }
]
}