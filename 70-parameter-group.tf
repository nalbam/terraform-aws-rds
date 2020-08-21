# parameter_group

resource "aws_db_parameter_group" "this" {
  name_prefix = local.name_prefix
  description = format("Database parameter group for %s", var.identifier)

  family = var.family

  dynamic "parameter" {
    for_each = var.parameters
    content {
      name         = parameter.value.name
      value        = parameter.value.value
      apply_method = lookup(parameter.value, "apply_method", null)
    }
  }

  lifecycle {
    create_before_destroy = true
  }

  tags = merge(
    {
      "Name" = format("%s", var.identifier)
    },
    var.tags,
  )
}

output "parameter_group_id" {
  value = aws_db_parameter_group.this.id
}

output "parameter_group_arn" {
  value = aws_db_parameter_group.this.arn
}
