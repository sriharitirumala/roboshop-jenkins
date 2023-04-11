resource "jenkins_folder" "folders" {
  count = length(var.folders)
  name =  element(var.folders, count.index )
}

resource "jenkins_job" "job" {
  depends_on = [jenkins_folder.folders]
  count    = length(var.jobs)
  name     = lookup(element(var.jobs, count.index), "name", null)
  folder   = "/job/${lookup(element(var.jobs, count.index), "folder", null)}"

  template = templatefile("${path.module}/sb-job.xml", {
    repo_url = lookup(element(var.jobs, count.index), "repo_url", null)
  })

  lifecycle {
    ignore_changes = [ template ]

  }
}

data "aws_instance" "jenkins"{
  instance_id = "i-0281c09e1a1c9282b"
}

resource "aws_route53_record" "jenkins" {
  zone_id = "Z099374713TEKOU3HRH9T"
  name    = "jenkins.devopsb71services.site"
  type    = "A"
  ttl     = 30
  records = [data.aws_instance.jenkins.public_ip]
}
