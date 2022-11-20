resource "kubernetes_secret" "azure-secret-sp" {
  metadata {
    name = var.secret["name"]
  }

  data = {
    ClientID     = var.secret["ClientID"]
    ClientSecret = var.secret["ClientSecret"]
  }

  depends_on = [
    null_resource.kubectl
  ]
}