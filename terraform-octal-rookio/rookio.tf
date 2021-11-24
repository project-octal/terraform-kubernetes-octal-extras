module "rookio_argocd_application" {
#  source             = "github.com/project-octal/terraform-argocd-application"
  source             = "git::https://github.com/project-octal/terraform-argocd-application.git?ref=feature/kubernetes_manifest"
  argocd_namespace   = var.argocd_namespace
  project            = var.argocd_project
  destination_server = var.deployment_cluster
  namespace          = var.deployment_namespace

  name            = "rook-ceph"
  release_name    = "fancy"
  repo_url        = "https://charts.rook.io/release"
  chart           = "rook-ceph"
  target_revision = "v1.5.9"
}
