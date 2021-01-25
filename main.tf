data "digitalocean_kubernetes_versions" "k8s" {
  version_prefix = "${var.k8s_version}."
}

resource "digitalocean_kubernetes_cluster" "k8s" {
  name     = var.cluster_name
  region   = var.region
  version  = data.digitalocean_kubernetes_versions.k8s.latest_version
  vpc_uuid = var.vpc_id

  node_pool {
    name       = "${var.cluster_name}-worker-pool"
    size       = local.default_node_group.node_type
    auto_scale = local.default_node_group.auto_scale
    min_nodes  = local.default_node_group.min_nodes
    max_nodes  = local.default_node_group.max_nodes
    node_count = local.default_node_group.node_count
    labels     = local.default_node_group.labels
    tags       = local.default_node_group.tags
  }
}

resource "digitalocean_spaces_bucket_object" "kubeconfig" {
  region  = local.kubeconfig_bucket_regoin
  bucket  = var.kubeconfig_bucket
  key     = var.kubeconfig_bucket_key
  content = digitalocean_kubernetes_cluster.k8s.kube_config.0.raw_config
}

resource "digitalocean_kubernetes_node_pool" "additional_pool" {
  for_each   = local.worker_groups_map
  cluster_id = digitalocean_kubernetes_cluster.k8s.id
  name       = each.key
  size       = each.value.node_type
  auto_scale = each.value.auto_scale
  min_nodes  = each.value.min_nodes
  max_nodes  = each.value.max_nodes
  node_count = each.value.node_count
  labels     = each.value.labels
  tags       = each.value.tags
}
