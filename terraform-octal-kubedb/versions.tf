terraform {
  required_version = ">= 0.14"
  required_providers {
    kubernetes = {
      source = "hashicorp/kubernetes"
    }
    k8s = {
      source  = "banzaicloud/k8s"
      version = "0.8.0"
    }
  }
}