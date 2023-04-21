variable "folders" {
  default = ["Infra", "CI-Pipeline"]
}

variable "m-jobs" {
  default = [
    { name = "frontend", folder = "CI-Pipeline", repo_url = "https://github.com/sriharitirumala/frontend" },
    { name = "catalogue", folder = "CI-Pipeline", repo_url = "https://github.com/sriharitirumala/catalogue" },
    { name = "cart", folder = "CI-Pipeline", repo_url = "https://github.com/sriharitirumala/cart" },
    { name = "user", folder = "CI-Pipeline", repo_url = "https://github.com/sriharitirumala/user" },
    { name = "shipping", folder = "CI-Pipeline", repo_url = "https://github.com/sriharitirumala/shipping" },
    { name = "payment", folder = "CI-Pipeline", repo_url = "https://github.com/sriharitirumala/payment" }
  ]
}



variable "s-jobs" {
  default = [
    { name = "roboshop", folder = "Infra", repo_url = "https://github.com/sriharitirumala/roboshop-infra", filename = "Jenkinsfile" },
    { name = "App-Deployment", folder = "Infra", repo_url = "https://github.com/sriharitirumala/roboshop-ansible", filename = "Jenkinsfile-deployment" }
  ]
}


variable "force" {
  default = false
}

