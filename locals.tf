locals {

  default_deployment_namespace = var.default_deployment_namespace == null ? "octal-extras" : var.default_deployment_namespace

  enabled_extras = {for key,val in var.enabled_extras :
    key => defaults(enabled_extra, {
      enabled   = false
      namespace = local.default_deployment_namespace
    })
  }

  # enabled_extras = defaults(var.enabled_extras, {
  #   kubedb = {
  #     enabled   = false
  #     namespace = "kube-kubedb"
  #   }
  #   rookio = {
  #     enabled   = false
  #     namespace = "kube-rook"
  #   }
  # })
}
