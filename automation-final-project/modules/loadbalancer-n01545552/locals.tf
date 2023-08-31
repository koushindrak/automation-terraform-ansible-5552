locals {
  common_tags = {
    Assignment     = "CCGC 5502 Automation Assignment"
    Name           = "koushindra.kumar"
    ExpirationDate = "2024-12-31"
    Environment    = "Learning"
  }

  load_balancer_rules = {
    http = {
      name                       = "http"
      protocol                   = "Tcp"
      frontend_port              = 80
      backend_port               = 80
      destination_address_prefix = "*"
    }
  }
  load_balancer_probes = {
    http = {
      name = "http-running-probe"
      port = 80
    }
  }
}