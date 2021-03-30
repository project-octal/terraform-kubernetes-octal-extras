variable "argocd_namespace" {
  type        = string
  description = ""
}

variable "deployment_cluster" {
  type        = string
  description = ""
  default     = "https://kubernetes.default.svc"
}

variable "deployment_namespace" {
  type        = string
  description = ""
  default     = "octal-extras"
}

variable "enabled_extras" {
  type = object({
    kubedb = optional(bool)
    rookio = optional(bool)
  })
}