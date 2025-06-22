data "aws_instance" "joindevops" {
 
  filter {
    name   = "name"
    values = ["RHEL-9-DevOps-Practice"]
  }

  filter {
    name   = "Root device type"
    values = ["EBS"]
  }

  filter {
    name   = "Virtualization type "
    values = ["hvm"]
  }
  
}

output "aws_instance_joindevops" {
  value = data.aws_instance.joindevops
}
