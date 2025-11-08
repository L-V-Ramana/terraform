data "aws_ami" "amiId"{
    owners = ["973714476881"]
    
    most_recent = true

    filter{
        name = "name"
        values = ["RHEL-9-DevOps-Practice"]
    }
}

# output "ami_info"{
#     value = data.aws_ami.joindevops
# }