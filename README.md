# terraform-do-k8s
Terraform module to create an managed kubernetes cluster in DigitalOcean cloud.

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | ~> 0.13.0 |
| digitalocean | ~> 2.4.0 |

## Providers

| Name | Version |
|------|---------|
| digitalocean | ~> 2.4.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| additional\_node\_groups | A list of worker groups configs | `any` | `[]` | no |
| cluster\_name | (Required) Provide DigitalOcean cluster name | `string` | n/a | yes |
| default\_node\_group | n/a | `any` | n/a | yes |
| k8s\_version | Provide DigitalOcean Kubernetes minor version (e.g. '1.15' or higher) | `string` | `"1.19.3-do"` | no |
| kubeconfig\_bucket | Bucket name for kubeconfig upload | `string` | n/a | yes |
| kubeconfig\_bucket\_key | Path and filename og kubeconfig in do spaces bucket | `string` | `"kubeconfig"` | no |
| kubeconfig\_bucket\_region | Region of bucket name for kubeconfig upload. Default will be set to kluster rregion. | `string` | `""` | no |
| region | (Required) Provide DigitalOcean region | `string` | n/a | yes |
| vpc\_id | VPC id | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| cluster\_endpoint | n/a |
| cluster\_status | n/a |
| id | n/a |
| kubeconfig | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
