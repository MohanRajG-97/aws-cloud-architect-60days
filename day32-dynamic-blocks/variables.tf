variable "allowed_ports" {

  description = "Ports to allow"

  type = list(number)

  default = [
    22,
    80,
    443
  ]
}
