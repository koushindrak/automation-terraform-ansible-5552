locals {
  common_tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "koushindra.kumar"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }

  load_balancer_inbound_rules = {
    allow_http = {
      name                       = "http"
      protocol                   = "Tcp"
      port                       = 80
      destination_address_prefix = "*"
    }
  }
  load_balancer_probe = {
    prob_config = {
      name = "port 80 is working"
      port = 80
    }
  }
}