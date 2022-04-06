module "kubedb_argocd_application" {
  source  = "project-octal/argocd-application/kubernetes"
  version = "2.0.1"

  argocd_namespace   = var.argocd_namespace
  project            = var.argocd_project
  destination_server = var.deployment_cluster
  namespace          = var.deployment_namespace

  name            = "kubedb"
  release_name    = "fancy"
  repo_url        = "https://charts.appscode.com/stable/"
  chart           = "kubedb"
  target_revision = var.kubedb_version
  helm_parameters = [
    {
      name         = "global.license"
      value        = var.license
      force_string = true
    }
  ]
  ignore_differences = [
    {
      kind  = "APIService"
      group = "apiregistration.k8s.io"
      name  = "v1alpha1.validators.kubedb.com"
      jsonPointers = [
        "/spec/caBundle",
        "/metadata"
      ]
    }
  ]
}