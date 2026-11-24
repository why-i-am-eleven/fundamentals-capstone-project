output "vpc_id" {
  value       = aws_vpc.main.id
  description = "Created VPC ID"
}

output "subnet_ids" {
  value       = { for name, subnet in aws_subnet.tier : name => subnet.id }
  description = "Subnet IDs by tier and Availability Zone"
}

output "security_group_ids" {
  value = {
    alb = aws_security_group.alb.id
    app = aws_security_group.app.id
    db  = aws_security_group.db.id
  }
}
