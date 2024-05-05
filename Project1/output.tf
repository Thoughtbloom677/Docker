#Output of created EC2 server IP and Instance ID
output "instance_id" {
  value = aws_instance.example
}

output "public_ip" {
  value = aws_instance.example.public_ip
}