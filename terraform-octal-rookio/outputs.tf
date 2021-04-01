output "namespace" {
  depends_on = [module.rookio_argocd_application]
  value      = var.deployment_namespace
}