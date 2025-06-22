# Find the latest available AMI that is tagged with Component = web
data "aws_ami" "roboshopami" {
     owners = ["973714476881"]
      most_recent = true
  filter {
    name   = "name"
    values = ["RHEL-9-DevOps-Practice"]
  }
  filter {
  name   = "root-device-type"
  values = ["ebs"]
  }

 
  filter {
    name = "virtualization-type"
    values = ["hvm"]
  }

  
}

output "roboshopamiId" {
  value = data.aws_ami.roboshopami.id
}

