resource "kubernetes_namespace" "kubedb_namespace" {
  # Here we're first checking to see if kubedb was enabled. If enabled we check to see if a custom namespace was specified.
  count = default(var.enabled_extras["kubedb"]["enabled"],false) ? var.enabled_extras.kubedb.namespace != null ? 1 : 0 : 0

  metadata {
    name = var.enabled_extras.kubedb.namespace
  }
}

module "octal_extras_kubedb" {
  source = "./terraform-octal-kubedb"
  count  = default(var.enabled_extras["kubedb"]["enabled"],false) ? 1 : 0

  argocd_namespace     = var.argocd_namespace
  argocd_project       = module.octal_extras_argocd_project[0].name
  deployment_namespace = local.enabled_extras["kubedb"]["namespace"]
}
