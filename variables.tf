variable "region" {
  default = "ap-southeast-1"
  # Singapore
}

variable "ami_id" {
  default = "ami-06fb5332e8e3e577a"
  # Ubuntu 18.04 LTS
}

variable "ec2_instance_type" {
  default = "t2.micro"
}