module "rookio_argocd_application" {
  source  = "project-octal/argocd-application/kubernetes"
  version = "2.0.1"

  argocd_namespace   = var.argocd_namespace
  project            = var.argocd_project
  destination_server = var.deployment_cluster
  namespace          = var.deployment_namespace

  name            = "rook-ceph"
  release_name    = "fancy"
  repo_url        = "https://charts.rook.io/release"
  chart           = "rook-ceph"
  target_revision = var.chart_version
}