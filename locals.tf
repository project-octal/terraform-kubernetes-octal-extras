locals {
  enabled_extras = {
    kubedb = var.enabled_extras.kubedb == null ? {
      enabled   = false
      namespace = "kube-kubedb"
    } : var.enabled_extras.kubedb

    rookio = var.enabled_extras.rookio == null ? {
      enabled       = false
      namespace     = "kube-rookio"
      chart_version = "v1.5.9"
    } : var.enabled_extras.rookio

    code_server = var.enabled_extras.code_server == null ? {
      enabled   = false
      namespace = "code-server"
    } : var.enabled_extras.code_server
  }

  deployment_destinations = [for key, val in local.enabled_extras : { server = var.deployment_cluster, namespace = val["namespace"] } if val["enabled"]]
}
