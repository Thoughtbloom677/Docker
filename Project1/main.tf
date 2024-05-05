#DOCKER PROJECT ONE - Nginx, Grafana, Prometheus
provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "Docker_Server" {
  ami           = var.ami // Specify your desired AMI ID
  instance_type = var.instance_type //Specify your instance_type

  // User data to run Nginx, Grafana, and Prometheus Docker containers
  user_data = <<-EOF
              #!/bin/bash
              sudo yum install -y docker

              # Start Docker service
              sudo service docker start

              # Run Nginx container
              sudo docker run -d --name nginx -p 80:80 nginx

              # Wait for Nginx to start
              sleep 10

              # Run Grafana container
              sudo docker run -d --name grafana -p 3000:3000 grafana/grafana

              # Wait for Grafana to start
              sleep 10

              # Run Prometheus container
              sudo docker run -d --name prometheus -p 9090:9090 prom/prometheus
              EOF

  tags = {
    Name = var.servername
  }

  // Other instance configurations...
}
