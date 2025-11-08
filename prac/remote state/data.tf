data "aws_ami" "amiID"{
    owners = ["973714476881"]
    most_recent = true

    filter{
        name = "name"
        values = ["RHEL-9-DevOps-Practice"]
    }
}