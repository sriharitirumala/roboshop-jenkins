
# Provide Hashicorp Registry Details
terraform {
  required_providers {
    jenkins = {
      source = "registry.terraform.io/taiidani/jenkins"
    }
  }
}


# Configure the Jenkins Provider
provider "jenkins" {
  server_url = "http://172.31.3.167:8080"
  username   = data.aws_ssm_parameter.jenkins_user.value
  password   = data.aws_ssm_parameter.jenkins_pass.value
}

data "aws_ssm_parameter" "jenkins_user"{
  name = "jenkins.user"
}

data "aws_ssm_parameter" "jenkins_pass"{
  name = "jenkins.pass"
}