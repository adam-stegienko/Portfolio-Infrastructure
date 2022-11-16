resource "helm_release" "argocd" {
  name             = var.argocd_chart["name"]
  chart            = var.argocd_chart["chart"]
  namespace        = var.argocd_chart["namespace"]
  create_namespace = true
  # replace          = true
  # wait             = true

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [
    null_resource.kubectl
  ]
}

resource "helm_release" "root" {
  name             = var.root_chart["name"]
  chart            = var.root_chart["chart"]
  namespace        = var.root_chart["namespace"]
  create_namespace = true
  # replace          = true
  # wait             = false

  lifecycle {
    create_before_destroy = true
  }

  depends_on = [
    helm_release.argocd
  ]
}