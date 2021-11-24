<p align="center">
  <img width="460" height="300" src="https://project-octal-static-assets.nyc3.digitaloceanspaces.com/project-octal-extras.svg" unselectable="on">
</p>

---
### terraform-kubernetes-octal-extras

Project Octal Extras is a collection of helm charts that can be selectively and easily deployed to any Kubernetes cluster with ArgoCD. 

---

## IMPORTANT: Upgrading from v0.0.1 to v1.0.0
If you're currently on version `v0.0.1` or older the following steps need to be followed to prevent potential disruption. The following steps assume the root Octal-Extras module was created with the name `my_octal_extras`
```shell
# Import the Octal-Extras ArgoCD Project
terraform import -var-file=secrets.tfvars 'module.my_octal_extras.module.octal_extras_argocd_project[0].kubernetes_manifest.argo_project' "apiVersion=argoproj.io/v1alpha1,kind=AppProject,namespace=kube-argocd,name=project-octal-extras"

# Import the KubeDB ArgoCD Application
terraform import -var-file=secrets.tfvars 'module.my_octal_extras.module.octal_extras_kubedb[0].module.kubedb_argocd_application.kubernetes_manifest.argo_application' "apiVersion=argoproj.io/v1alpha1,kind=Application,namespace=kube-argocd,name=kubedb"

# Import the Rookio ArgoCD Application
terraform import -var-file=secrets.tfvars 'module.my_octal_extras.module.octal_extras_rookio[0].module.rookio_argocd_application.kubernetes_manifest.argo_application' "apiVersion=argoproj.io/v1alpha1,kind=Application,namespace=kube-argocd,name=rook-ceph"

# Delete the old Octal-Extras ArgoCD Project state object
terraform state rm 'module.my_octal_extras.module.octal_extras_argocd_project[0].k8s_manifest.argo_project'

# Delete the old Kubedb ArgoCD state object
terraform state rm 'module.my_octal_extras.module.octal_extras_kubedb[0].module.kubedb_argocd_application.k8s_manifest.argo_application' 

# Delete the old RookIO ArgoCD state object
terraform state rm 'module.my_octal_extras.module.octal_extras_rookio[0].module.rookio_argocd_application.k8s_manifest.argo_application' 

# Lastly, run a Terraform apply to make sure the states are synced up.
terraform apply -var-file secrets.tfvars
```

---

### Available Extras
| Name                  | Version   | Link | License |
| --------------------- | --------- | ---- | ------- |
| Kubedb     | v2021.03.17 | https://kubedb.com/ | [AppsCode-Community-1.0.0](https://github.com/kubedb/operator/blob/master/LICENSE.md) |
| Rook | v1.5.9 | https://rook.io/ | [Apache License 2.0](https://github.com/rook/rook/blob/master/LICENSE) |

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.8, < 2.0.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.6.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.6.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_octal_extras_argocd_project"></a> [octal\_extras\_argocd\_project](#module\_octal\_extras\_argocd\_project) | git::https://github.com/project-octal/terraform-argocd-project | feature/kubernetes_manifest |
| <a name="module_octal_extras_kubedb"></a> [octal\_extras\_kubedb](#module\_octal\_extras\_kubedb) | ./terraform-octal-kubedb | n/a |
| <a name="module_octal_extras_rookio"></a> [octal\_extras\_rookio](#module\_octal\_extras\_rookio) | ./terraform-octal-rookio | n/a |

## Resources

| Name | Type |
|------|------|
| [kubernetes_namespace.kubedb_namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_namespace.rookio_namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_argocd_namespace"></a> [argocd\_namespace](#input\_argocd\_namespace) | n/a | `string` | n/a | yes |
| <a name="input_deployment_cluster"></a> [deployment\_cluster](#input\_deployment\_cluster) | n/a | `string` | `"https://kubernetes.default.svc"` | no |
| <a name="input_enabled_extras"></a> [enabled\_extras](#input\_enabled\_extras) | n/a | <pre>object({<br>    rookio = optional(object({<br>      enabled   = bool<br>      namespace = string<br>    }))<br>    kubedb = optional(object({<br>      enabled   = bool<br>      namespace = string<br>      license   = string<br>    }))<br>    code_server = optional(object({<br>      enabled   = bool<br>      namespace = string<br>    }))<br>  })</pre> | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kubedb_namespace"></a> [kubedb\_namespace](#output\_kubedb\_namespace) | n/a |
| <a name="output_rookio_namespace"></a> [rookio\_namespace](#output\_rookio\_namespace) | n/a |
<!-- END_TF_DOCS -->