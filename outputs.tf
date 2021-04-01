output "kubedb_namespace" {
  value = var.enabled_extras.kubedb.enabled ? module.octal_extras_kubedb.namespace : null
}

output "rookio_namespace" {
  value = var.enabled_extras.rookio.enabled ? module.octal_extras_rookio.namespace : null
}