terraform {
  required_version = "~> 0.13.0"
  required_providers {
    digitalocean = {
      version = "~> 2.4.0"
      source  = "digitalocean/digitalocean"
    }
  }
}
