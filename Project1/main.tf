#DOCKER PROJECT ONE - Nginx, Grafana, Prometheus
provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "example" {
  ami           = "ami-07caf09b362be10b8" // Specify your desired AMI ID
  instance_type = "t2.micro"

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
    Name = "nginx-grafana-prometheus-instance"
  }

  // Other instance configurations...
}
