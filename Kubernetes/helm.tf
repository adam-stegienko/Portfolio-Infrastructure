resource "helm_release" "argocd" {
  name             = var.argocd_chart["name"]
  chart            = var.argocd_chart["chart"]
  namespace        = var.argocd_chart["namespace"]
  create_namespace = true

  depends_on = [
    null_resource.kubectl
  ]
}