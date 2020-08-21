# locals

locals {
  account_id = data.aws_caller_identity.current.account_id
}

locals {
  name_prefix = "${var.identifier}-"
}
