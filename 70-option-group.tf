# option_group

resource "aws_db_option_group" "this" {
  name_prefix              = local.name_prefix
  option_group_description = format("Database option group for %s", var.identifier)

  engine_name          = var.engine
  major_engine_version = var.major_engine_version

  dynamic "option" {
    for_each = var.options
    content {
      option_name                    = option.value.option_name
      port                           = lookup(option.value, "port", null)
      version                        = lookup(option.value, "version", null)
      db_security_group_memberships  = lookup(option.value, "db_security_group_memberships", null)
      vpc_security_group_memberships = lookup(option.value, "vpc_security_group_memberships", null)

      dynamic "option_settings" {
        for_each = lookup(option.value, "option_settings", [])
        content {
          name  = lookup(option_settings.value, "name", null)
          value = lookup(option_settings.value, "value", null)
        }
      }
    }
  }

  timeouts {
    delete = lookup(var.option_group_timeouts, "delete", null)
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


output "option_group_id" {
  value = aws_db_option_group.this.id
}

output "option_group_arn" {
  value = aws_db_option_group.this.arn
}
