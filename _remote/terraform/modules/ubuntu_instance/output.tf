output "instance_id" {
  description = "The ID of the EC2 instance"
  value       = aws_instance.this.id
}

output "instance_security_group_id" {
  description = "The ID of the security group associated with the EC2 instance"
  value       = aws_security_group.this.id
}
