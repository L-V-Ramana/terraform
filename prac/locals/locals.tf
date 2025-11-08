locals{
    final_name="${var.project}-${var.environment}-${var.component}"
    tags = merge(var.common_tags,{
        name ="locals"
    })
    sg_id =["aws_instance.locals.id"] 
}