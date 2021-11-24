# Create the ArgoCD Project.
module "octal_extras_argocd_project" {
  source  = "project-octal/argocd-project/kubernetes"
  version = "2.0.0"

  count = anytrue(values(local.enabled_extras)[*]["enabled"]) ? 1 : 0

  namespace   = var.argocd_namespace
  name        = "project-octal-extras"
  description = "This project contains extra octal resources."
  destinations = concat(local.deployment_destinations, [
    {
      # This is required so that Argo can create the KubeDB RBAC RoleBinding
      # TODO: Find out if there's a way to get around this. It seems to be the only thing being created in kube-system
      server    = var.deployment_cluster
      namespace = "kube-system"
    }
  ])
  cluster_resource_whitelist = [
    {
      kind  = "*"
      group = "*"
    }
  ]
  namespace_resource_whitelist = [
    {
      kind  = "*"
      group = "*"
    }
  ]
  permissions = []
}
