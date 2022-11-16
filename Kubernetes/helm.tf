resource "helm_release" "argocd" {
  name             = var.argocd_chart["name"]
  chart            = var.argocd_chart["chart"]
  namespace        = var.argocd_chart["namespace"]
  create_namespace = true

  depends_on = [
    null_resource.kubectl
  ]

  values = [
    "${file(".terraform/modules/helm_release/apps/templates/root.yaml")}"
  ]

}

# resource "helm_release" "root" {
#   name             = var.root_chart["name"]
#   chart            = var.root_chart["chart"]
#   namespace        = var.root_chart["namespace"]
#   create_namespace = true

#   depends_on = [
#     helm_release.argocd
#   ]
# }
