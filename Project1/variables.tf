#Declare variables
variable "ami" {
  type        = string
  description = "AMI for the EC2"
  default     = "ami-07caf09b362be10b8"
}

variable "instance_type" {
  type        = string
  description = "Specify the instance type of the EC2"
  default     = "t2.micro"
}

variable "servername" {
  type        = string
  description = "Specify the name of server"
  default     = "nginx-grafana-prometheus-instance"
}
