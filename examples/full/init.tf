terraform {
  backend "s3" {
    bucket                      = "k8s-data"
    key                         = "k8s-cdev/k8s"
    region                      = "us-east-1"
    endpoint                    = "ams3.digitaloceanspaces.com"
    skip_credentials_validation = true
    skip_metadata_api_check     = true
    access_key                  = ""
    secret_key                  = ""
  }
  required_version = "~> 0.13"
}
