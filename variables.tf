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
      enabled   = bool
      namespace = string
    }))
    kubedb = optional(object({
      enabled   = bool
      namespace = string
      license   = string
    }))
  })
  default = {}
}
