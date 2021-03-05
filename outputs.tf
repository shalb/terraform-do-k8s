output "cluster_status" {
  value = digitalocean_kubernetes_cluster.k8s.status
}

output "cluster_endpoint" {
  value = digitalocean_kubernetes_cluster.k8s.endpoint
}

output "kubeconfig" {
  value = digitalocean_kubernetes_cluster.k8s.kube_config.0.raw_config
}

output "id" {
  value = digitalocean_kubernetes_cluster.k8s.id
}
