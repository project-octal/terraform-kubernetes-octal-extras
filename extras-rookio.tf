resource "kubernetes_namespace" "rookio_namespace" {
  # Here we're first checking to see if rookio was enabled. If enabled we check to see if a custom namespace was specified.
  count = local.enabled_extras["rookio"]["enabled"] ? var.enabled_extras.rookio.namespace != null ? 1 : 0 : 0

  metadata {
    name = var.enabled_extras.kubedb.namespace
  }
}

module "octal_extras_rookio" {
  source = "./terraform-octal-rookio"
  count  = local.enabled_extras["rookio"]["enabled"] ? 1 : 0

  argocd_namespace     = var.argocd_namespace
  argocd_project       = module.octal_extras_argocd_project[0].name
  deployment_namespace = local.enabled_extras["rookio"]["namespace"]
}
