locals {
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

  deployment_destinations = [for key,val in local.enabled_extras : { server = var.deployment_cluster, namespace = val["namespace"]} if val["enabled"] ]
}
