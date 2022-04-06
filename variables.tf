variable "argocd_namespace" {
  type        = string
  description = ""
}

variable "deployment_cluster" {
  type        = string
  description = ""
  default     = "https://kubernetes.default.svc"
}

variable "enabled_extras" {
  type = object({
    rookio = optional(object({
      enabled       = bool
      namespace     = string
      chart_version = string
    }))
    kubedb = optional(object({
      enabled        = bool
      namespace      = string
      license        = string
      kubedb_version = string
    }))
    code_server = optional(object({
      enabled   = bool
      namespace = string
    }))
  })
  default = {}
}
