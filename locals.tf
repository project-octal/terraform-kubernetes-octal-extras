locals {

  default_deployment_namespace = var.default_deployment_namespace == null ? "octal-extras" : var.default_deployment_namespace

  enabled_extras = {
    kubedb = var.enabled_extras.kubedb == null ? {
      enabled   = false
      namespace = "kube-kubedb"
    } : var.enabled_extras.kubedb

    rookio = var.enabled_extras.rookio == null ? {
      enabled   = false
      namespace = "kube-rookio"
    } : var.enabled_extras.rookio
  }

}
