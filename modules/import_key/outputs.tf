output "ec2_key_pair" {
  value       = { for key, value in aws_key_pair.imported_key : key => value }
  description = "A map of properties for the imported EC2 Key."
}
