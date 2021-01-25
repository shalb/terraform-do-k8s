variable cluster_name {
  type        = string
  description = "(Required) Provide DigitalOcean cluster name"
}

variable region {
  type        = string
  description = "(Required) Provide DigitalOcean region"
}

variable default_node_group {
  type = any
}


variable k8s_version {
  type        = string
  description = "Provide DigitalOcean Kubernetes minor version (e.g. '1.15' or higher)"
  default     = "1.19.3-do"
}

variable vpc_id {
  type        = string
  description = "VPC id"
}

variable kubeconfig_bucket {
  type        = string
  description = "Bucket name for kubeconfig upload"
}

variable kubeconfig_bucket_region {
  type        = string
  description = "Region of bucket name for kubeconfig upload. Default will be set to kluster rregion."
  default     = ""
}

variable kubeconfig_bucket_key {
  type        = string
  description = "Path and filename og kubeconfig in do spaces bucket"
  default     = "kubeconfig"
}

variable additional_node_groups {
  description = "A list of worker groups configs"
  default     = []
  type        = any
}
