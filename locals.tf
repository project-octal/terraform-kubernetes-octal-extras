locals {

  default_deployment_namespace = var.default_deployment_namespace == null ? "octal-extras" : var.default_deployment_namespace

  enabled_extras = [for enabled_extra in var.enabled_extras :
    defaults(enabled_extra, {
      enabled   = false
      namespace = local.default_deployment_namespace
    })
  ]

  #enabled_extras = defaults(var.enabled_extras, {
  #  kubedb = {
  #    enabled   = false
  #    namespace = local.default_deployment_namespace
  #  },
  #  rookio = {
  #    enabled   = false
  #    namespace = local.default_deployment_namespace
  #  }
  #})
}
