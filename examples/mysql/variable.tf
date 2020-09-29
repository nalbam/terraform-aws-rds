# variable

variable "region" {
  default = "ap-northeast-2"
}

variable "name" {
  default = "db-demo-mysql"
}

variable "engine" {
  description = "Database engine"
  type        = string
  default     = "mysql"
}

variable "engine_version" {
  description = "Database engine version"
  type        = string
  default     = "12.3"
}

variable "instance_type" {
  description = "Instance type for database instance"
  type        = string
  default     = "db.t2.micro"
}

variable "database_name" {
  description = "Name of database inside storage engine"
  type        = string
  default     = "mysql"
}

variable "database_username" {
  description = "Name of user inside storage engine"
  type        = string
  default     = "mysql"
}

variable "database_password" {
  description = "Database password inside storage engine"
  type        = string
  default     = "mysql"
}

variable "database_port" {
  description = "Port on which database will accept connections"
  type        = number
  default     = 5432
}

variable "security_group_ids" {
  type    = list(string)
  default = []
}

# DB subnet group

variable "subnet_ids" {
  description = "A list of VPC subnet IDs"
  type        = list(string)
  default     = []
}

# DB parameter group

variable "family" {
  description = "The family of the DB parameter group"
  type        = string
  default     = "mysql12"
}

# DB option group

variable "major_engine_version" {
  description = "Specifies the major version of the engine that this option group should be associated with"
  type        = string
  default     = "12"
}
