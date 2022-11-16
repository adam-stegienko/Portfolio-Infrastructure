resource "helm_release" "argocd" {
  name             = argocd_chart["name"]
  chart            = argocd_chart["chart"]
  namespace        = argocd_chart["namespace"]
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
  name             = root_chart["name"]
  chart            = root_chart["chart"]
  namespace        = root_chart["namespace"]
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

resource "null_resource" "kubectl" {
  provisioner "local-exec" {
    command = "az aks get-credentials --name ${var.cluster_name} --overwrite-existing --resource-group ${var.resource_group["name"]}"
  }

  depends_on = [
    azurerm_kubernetes_cluster.k8s
  ]
}
