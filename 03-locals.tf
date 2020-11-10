# locals

locals {
  account_id = data.aws_caller_identity.current.account_id
}

locals {
  name_prefix = "${var.identifier}-"

  security_group_ids = compact(concat(
    var.vpc_security_group_ids,
    [aws_security_group.this.id],
  ))
}
