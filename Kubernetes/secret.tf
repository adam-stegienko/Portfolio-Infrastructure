resource "kubernetes_secret" "azure-secret-sp" {
  metadata {
    name = var.secret["name"]
  }

  data = {
    ClientID     = var.secret["ClientID"]
    ClientSecret = var.secret["ClientSecret"]
  }

  depends_on = [
    azurerm_kubernetes_cluster.k8s
  ]
}