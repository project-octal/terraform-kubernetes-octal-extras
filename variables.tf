variable "argocd_namespace" {
  type        = string
  description = ""
}

variable "deployment_cluster" {
  type        = string
  description = ""
  default     = "https://kubernetes.default.svc"
}

variable "default_deployment_namespace" {
  type        = string
  description = "The namespace the extra helm charts will be deployed to if no specific namespace is given."
  default     = "octal-extras"
}

variable "enabled_extras" {
  type = object({
    kubedb = optional(object({
      enabled   = bool
      namespace = optional(string)
    }))
    rookio = optional(object({
      enabled   = bool
      namespace = optional(string)
    }))
  })
  default = {}
}
