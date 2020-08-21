# postgres

terraform {
  backend "s3" {
    region         = "ap-northeast-2"
    bucket         = "terraform-nalbam-seoul"
    key            = "postgres-demo.tfstate"
    dynamodb_table = "terraform-nalbam-seoul"
    encrypt        = true
  }
  required_version = ">= 0.12"
}

provider "aws" {
  region = var.region
}

module "db" {
  source = "../../"

  region = var.region

  identifier = var.name

  engine            = var.engine
  engine_version    = var.engine_version
  instance_class    = var.instance_type
  allocated_storage = 20
  storage_encrypted = false

  # kms_key_id = "arm:aws:kms:<region>:<account id>:key/<kms key id>"

  name     = var.database_name
  username = var.database_username
  password = var.database_password
  port     = var.database_port

  # security group
  vpc_security_group_ids = var.security_group_ids

  # subnet group
  subnet_ids = var.subnet_ids

  # parameter group
  family = var.family

  # option group
  major_engine_version = var.major_engine_version

  # Snapshot name upon DB deletion
  final_snapshot_identifier = "db-demo-pg"

  maintenance_window = "Mon:00:00-Mon:03:00"
  backup_window      = "03:00-06:00"

  # disable backups to create DB faster
  backup_retention_period = 0

  enabled_cloudwatch_logs_exports = ["postgresql", "upgrade"]

  # Database Deletion Protection
  deletion_protection = false

  tags = {
    Owner       = "user"
    Environment = "dev"
  }
}
