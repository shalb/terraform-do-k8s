variable "region" {
  type    = string
  default = "ams3"
}

data "digitalocean_vpc" "default" {
  region = var.region
}

module "k8s" {
  source = "../../"
  additional_node_groups = {
    ng2 = {
      auto_scale = false
      node_count = 2
      node_type  = "s-1vcpu-2gb"
    }
    ng3 = {
      auto_scale = true
      max_nodes  = 3
      min_nodes  = 1
      node_type  = "s-1vcpu-2gb"
    }
  }
  cluster_name      = "k8s-cluster"
  region            = var.region
  vpc_id            = data.digitalocean_vpc.default.vpc_id
  k8s_version       = "1.19.3-do"
  kubeconfig_bucket = "k8s-data"
  default_node_group = {
    auto_scale = true
    max_nodes  = 3
    min_nodes  = 1
    name       = "default-ng"
    node_type  = "s-1vcpu-2gb"
  }
}
