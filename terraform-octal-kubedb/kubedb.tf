module "kubedb_argocd_application" {
  source             = "github.com/project-octal/terraform-argocd-application"
  argocd_namespace   = var.argocd_namespace
  project            = var.argocd_project
  destination_server = var.deployment_cluster
  namespace          = var.deployment_namespace

  name            = "kubedb"
  release_name    = "fancy"
  repo_url        = "https://charts.appscode.com/stable/"
  chart           = "kubedb"
  target_revision = "v2021.03.17"
  helm_parameters = [
    {
      name         = "global.license"
      value        = var.license
      force_string = true
    }
  ]
}