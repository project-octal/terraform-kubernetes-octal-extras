resource "kubernetes_namespace" "kubedb_namespace" {
  count = var.enabled_extras.kubedb != null ? var.enabled_extras.kubedb.namespace != null ? 1 : 0 : 0

  metadata {
    name = var.enabled_extras.kubedb.namespace
  }
}

module "octal_extras_kubedb" {
  source = "./terraform-octal-kubedb"
  count  = var.enabled_extras.kubedb != null ? var.enabled_extras.kubedb.enabled ? 1 : 0 : 0

  argocd_namespace     = var.argocd_namespace
  argocd_project       = module.octal_extras_argocd_project[0].name
  deployment_namespace = local.enabled_extras["kubedb"]["namespace"]
  license              = var.enabled_extras.kubedb.license
  kubedb_version       = var.enabled_extras.kubedb.kubedb_version
}
