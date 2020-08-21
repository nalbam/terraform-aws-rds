# security_group

resource "aws_security_group" "this" {
  description = format("Database security group for %s", var.identifier)

  vpc_id = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(
    {
      "Name" = format("%s", var.identifier)
    },
    var.tags,
  )
}

resource "aws_security_group_rule" "self" {
  description              = "Allow worker to communicate with each other"
  security_group_id        = aws_security_group.this.id
  source_security_group_id = aws_security_group.this.id
  from_port                = var.port
  to_port                  = var.port
  protocol                 = "-1"
  type                     = "ingress"
}
