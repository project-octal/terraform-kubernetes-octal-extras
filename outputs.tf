output "kubedb_namespace" {
  value = local.enabled_extras.kubedb["enabled"] ? module.octal_extras_kubedb[0].namespace : null
}

output "rookio_namespace" {
  value = local.enabled_extras.rookio["enabled"] ? module.octal_extras_rookio[0].namespace : null
}