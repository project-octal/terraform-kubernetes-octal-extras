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
variable "argocd_namespace" {
  type        = string
  description = ""
}
variable "argocd_project" {
  type        = string
  description = ""
}

variable "chart_version" {
  type        = string
  description = "The version of the RookIO chart to deploy"
}