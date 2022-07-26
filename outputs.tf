# output "ec2_key_pair_name" {
#   description = "The name of the generated EC2 Key Pair"
#   value       = aws_key_pair.generated_key.key_name
# }

# output "ec2_key_public_key" {
#   description = "The public key of the generated EC2 Key Pair"
#   value       = aws_key_pair.generated_key.public_key
# }

# output "tags" {
#   description = "The tags of the generated EC2 Key Pair"
#   value       = aws_key_pair.generated_key.tags
# }

output "ec2_key_pair" {
  value       = { for key, value in aws_key_pair.generated_key : key => value }
  description = "A map of properties for the generated EC2 Key pair."
}
