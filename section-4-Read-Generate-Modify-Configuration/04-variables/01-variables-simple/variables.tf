variable "vpn_ip_address" {
  description = "The IP address of the VPN server."
  type        = string
  default     = "127.0.0.1/32"
}

variable "app_port" {
  default = "8080"
}

variable "tls_port" {
    default = "443"
}

variable "ssh_port" {
  default = "22"
}

variable "ftp_port" {
  default = "21"
}

variable "ip_protocol" {
  default = "tcp"
}
