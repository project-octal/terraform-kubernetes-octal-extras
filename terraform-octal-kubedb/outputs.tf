output "namespace" {
  depends_on = [module.kubedb_argocd_application]
  value      = var.deployment_namespace
}