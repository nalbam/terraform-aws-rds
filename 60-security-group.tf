# security_group

resource "aws_security_group" "this" {
  vpc_id = var.vpc_id

  tags = merge(
    {
      "Name" = format("%s", var.identifier)
    },
    var.tags,
  )
}
