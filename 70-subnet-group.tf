# subnet_group

resource "aws_db_subnet_group" "this" {
  name_prefix = local.name_prefix
  description = format("Database subnet group for %s", var.identifier)

  subnet_ids  = var.subnet_ids

  tags = merge(
    {
      "Name" = format("%s", var.identifier)
    },
    var.tags,
  )
}

output "subnet_group_id" {
  value = aws_db_subnet_group.this.id
}

output "subnet_group_arn" {
  value = aws_db_subnet_group.this.arn
}
