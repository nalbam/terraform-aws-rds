# security_group

resource "aws_security_group" "this" {
  name        = var.identifier
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
  description              = "Allow connect to communicate with each other"
  security_group_id        = aws_security_group.this.id
  source_security_group_id = aws_security_group.this.id
  from_port                = 0
  to_port                  = 65535
  protocol                 = "-1"
  type                     = "ingress"
}

resource "aws_security_group_rule" "allow_ip" {
  description       = "Allow connect to communicate with the ip address"
  security_group_id = aws_security_group.this.id
  cidr_blocks       = var.allow_ip_address
  # from_port         = var.port
  # to_port           = var.port
  from_port         = 0
  to_port           = 65535
  protocol          = "-1"
  type              = "ingress"
}
