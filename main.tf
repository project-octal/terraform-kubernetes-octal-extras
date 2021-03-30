locals {
  deployment_namespace = var.deployment_namespace == null ? "octal-extras" : var.deployment_namespace
}

# The namespace the project will reside in
resource "kubernetes_namespace" "octal_extras_namespace" {
  count = anytrue(values(var.enabled_extras)) ? 1 : 0

  metadata {
    name = local.deployment_namespace
  }
}

# Create the ArgoCD Project.
module "octal_extras_argocd_project" {
  source = "github.com/project-octal/terraform-argocd-project?ref=v1.0.1"
  count  = anytrue(values(var.enabled_extras)) ? 1 : 0

  argocd_namespace = var.argocd_namespace
  name             = local.deployment_namespace
  description      = "This project contains extra octal resources."
  destinations = [
    {
      # This is required so that Argo can create the KubeDB RBAC RoleBinding
      # TODO: Find out if there's a way to get around this. It seems to be the only thing being created in kube-system
      server    = var.deployment_cluster
      namespace = "kube-system"
    },
    {
      server    = var.deployment_cluster
      namespace = kubernetes_namespace.octal_extras_namespace[0].metadata.0.name
    }
  ]
  permissions = []
}

module "octal_extras_kubedb" {
  source = "./terraform-octal-kubedb"
  count  = var.enabled_extras.kubedb == null ? 0 : 1

  argocd_namespace = var.argocd_namespace
  argocd_project   = module.octal_extras_argocd_project[0].name
}

module "octal_extras_rookio" {
  source = "./terraform-octal-rookio"
  count  = var.enabled_extras.rookio == null ? 0 : 1

  argocd_namespace = var.argocd_namespace
  argocd_project   = module.octal_extras_argocd_project[0].name
}
