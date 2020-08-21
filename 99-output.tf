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

output "port" {
  value = aws_db_instance.this.port
}

output "endpoint" {
  value = aws_db_instance.this.endpoint
}
