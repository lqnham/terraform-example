output "ip" {
  value = aws_instance.web-server.public_ip
  description = "The public IP of the web server"
}