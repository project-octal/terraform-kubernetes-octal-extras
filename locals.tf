locals {

  deployment_namespace = var.default_deployment_namespace == null ? "octal-extras" : var.default_deployment_namespace

  enabled_extras = defaults(var.enabled_extras, {
    kubedb = {
      enabled   = false
      namespace = var.default_deployment_namespace
    },
    rookio = {
      enabled   = false
      namespace = var.default_deployment_namespace
    }
  })
}
