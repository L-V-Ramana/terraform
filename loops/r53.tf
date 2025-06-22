resource "aws_route53_record" "www" {
    count = 4
  zone_id = var.hosted_zone_id
  name    = "${var.ec2_tags[count.index]}.${var.dns}"
  type    = "A"
  ttl     = 1
  records = [aws_instance.roboshop[count.index].private_ip]
  allow_overwrite = true
}