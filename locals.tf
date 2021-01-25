locals {
  kubeconfig_bucket_regoin = var.kubeconfig_bucket_region == "" ? var.region : var.kubeconfig_bucket_region
  default_nodes_tags       = []
  default_nodes_labels     = {}
  default_node_group = {
    min_nodes  = lookup(var.default_node_group, "min_nodes", null)
    max_nodes  = lookup(var.default_node_group, "max_nodes", null)
    node_count = lookup(var.default_node_group, "node_count", null)
    auto_scale = lookup(var.default_node_group, "auto_scale", null)
    node_type  = var.default_node_group.node_type
    name       = var.default_node_group.name
    labels     = merge(lookup(var.default_node_group, "labels", {}), local.default_nodes_labels)
    tags       = concat(lookup(var.default_node_group, "tags", []), local.default_nodes_tags)
  }
  worker_groups_map = {
    for key, node_group_config in var.additional_node_groups :
    key => {
      min_nodes  = lookup(node_group_config, "min_nodes", null)
      max_nodes  = lookup(node_group_config, "max_nodes", null)
      node_count = lookup(node_group_config, "node_count", null)
      auto_scale = lookup(node_group_config, "auto_scale", null)
      node_type  = node_group_config.node_type
      labels     = merge(lookup(node_group_config, "labels", {}), local.default_nodes_labels)
      tags       = concat(lookup(node_group_config, "tags", []), local.default_nodes_tags)
    }
  }
}
