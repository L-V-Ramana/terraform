resource "aws_route53_record" "www" {
    # count= lenght(var.instance)
    # for_each = output.instance
    for_each = aws_instance.roboshop
    zone_id = var.zone_id
  # name    = "${var.instance[count.index]}.${var.domainname}"
  name    = "${each.key}.${var.domainname}"
  type    = "A"
  ttl     = 1
  records = [each.value.private_ip]
}