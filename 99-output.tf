# output

output "id" {
  value = aws_db_instance.this.id
}

output "hosted_zone_id" {
  value = aws_db_instance.this.hosted_zone_id
}

output "address" {
  value = aws_db_instance.this.address
}

output "name" {
  value = aws_db_instance.this.name
}

output "port" {
  value = aws_db_instance.this.port
}

output "username" {
  value = aws_db_instance.this.username
}

output "status" {
  value = aws_db_instance.this.status
}

output "endpoint" {
  value = aws_db_instance.this.endpoint
}

output "security_group_id" {
  value = aws_security_group.this.id
}
