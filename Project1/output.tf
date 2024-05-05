#Output of created EC2 server IP and Instance ID
output "instance_id" {
  value = aws_instance.Docker_Server.id
}

output "public_ip" {
  value = aws_instance.Docker_Server.public_ip
}