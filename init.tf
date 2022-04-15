terraform {
  required_version = ">= 1.0.0"
  required_providers {
    digitalocean = {
      version = "~> 2.4.0"
      source  = "digitalocean/digitalocean"
    }
  }
}
