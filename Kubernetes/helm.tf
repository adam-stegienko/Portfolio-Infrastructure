# data "azurerm_container_registry" "container-registry" {
#   name                = "digital-planner"
#   resource_group_name = "portfolio-develeap"
# }

# resource "helm_release" "argo" {
#   name             = "argo"
#   repository       = "https://argoproj.github.io/argo-helm"
#   chart            = "argo-cd"
#   version          = "5.13.8"
#   namespace        = "default"
#   create_namespace = true

#   set {
#     name  = "argo-cd"
#     value = "LoadBalancer"
#   }
# }