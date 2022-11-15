data "azurerm_container_registry" "container-registry" {
  name                = "digitalplanner"
  resource_group_name = "portfolio-develeap"
}

resource "helm_release" "argocd" {
  name             = "argocd"
  chart            = "./.terraform/modules/helm_release/charts/argocd"
  namespace        = "default"
  # create_namespace = true
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
  name             = "root"
  chart            = "./.terraform/modules/helm_release/apps"
  namespace        = "default"
  # create_namespace = true
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
