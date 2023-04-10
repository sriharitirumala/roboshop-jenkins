variable "folders" {
  default = ["Infra", "CI-Pipeline"]
}

variable "jobs" {
  default = [
    { name = "roboshop", folder = "Infra", repo_url = "https://github.com/sriharitirumala/roboshop-infra" },
    { name = "frontend", folder = "CI-Pipeline", repo_url = "https://github.com/sriharitirumala/frontend" },
    { name = "catalogue", folder = "CI-Pipeline", repo_url = "https://github.com/sriharitirumala/catalogue" },
    { name = "cart", folder = "CI-Pipeline", repo_url = "https://github.com/sriharitirumala/cart" },
    { name = "user", folder = "CI-Pipeline", repo_url = "https://github.com/sriharitirumala/user" },
    { name = "shipping", folder = "CI-Pipeline", repo_url = "https://github.com/sriharitirumala/shipping" },
    { name = "payment", folder = "CI-Pipeline", repo_url = "https://github.com/sriharitirumala/payment" }
  ]
}

variable "force" {
  default = false
}

