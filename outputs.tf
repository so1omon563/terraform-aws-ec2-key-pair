output "ec2_key_pair" {
  value       = { for key, value in aws_key_pair.generated_key : key => value }
  description = "A map of properties for the generated EC2 Key pair."
}
