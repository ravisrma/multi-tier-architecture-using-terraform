output "web-server-dns" {
    value = aws_lb.wb-lb.dns_name
}