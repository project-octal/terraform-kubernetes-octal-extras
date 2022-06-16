terraform {
  required_version = ">= 0.14.8, < 2.0.0"
  experiments      = [module_variable_optional_attrs]
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
    }
  }
}
