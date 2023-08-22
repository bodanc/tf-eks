resource "helm_release" "gitlab-runner" {
  name       = "gitlab-runner"
  namespace  = var.gitlab-namespace
  repository = "https://charts.gitlab.io"
  chart      = "gitlab-runner"

  values = [
    file("${path.module}/gitlab-runner-values.yaml")
  ]
}

resource "kubernetes_secret" "gitlab-runner" {
  metadata {
    name = "gitlab-runner"
  }
  data = {
    runner-registration-token: ""
    runnerToken = "test"
  }
}
