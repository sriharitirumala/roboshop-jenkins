resource "jenkins_folder" "folders" {
  count = length(var.folders)
  name =  element(var.folders, count.index )
}

resource "jenkins_job" "m-job" {
  depends_on = [jenkins_folder.folders]

  count    = length(var.m-jobs)
  name     = lookup(element(var.m-jobs, count.index), "name", null)
  folder   = "/job/${lookup(element(var.m-jobs, count.index), "folder", null)}"

  template = templatefile("${path.module}/mb-job.xml", {
    repo_url = lookup(element(var.m-jobs, count.index), "repo_url", null)
    name     = lookup(element(var.m-jobs, count.index), "name", null)
  })


  lifecycle {
    ignore_changes = [ template ]
  }
}


resource "jenkins_job" "s-job" {
  depends_on = [jenkins_folder.folders]
  count    = length(var.s-jobs)
  name     = lookup(element(var.s-jobs, count.index), "name", null)
  folder   = "/job/${lookup(element(var.s-jobs, count.index), "folder", null)}"

  template   = templatefile("${path.module}/sb-job.xml", {
    repo_url = lookup(element(var.s-jobs, count.index), "repo_url", null)
    name     = lookup(element(var.s-jobs, count.index), "name", null)
    filename = lookup(element(var.s-jobs, count.index), "filename", null)
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


#######################################################should be done in .xml file#####################################
#change https code to ${repo_url} to fetch automatically
##Delete all  the .plugins in above code and the view should be above
###mention token as above given
####   template = templatefile("${path.module}/sb-job.xml", {
#repo_url = lookup(element(var.jobs, count.index), "repo_url", null)
#name     = lookup(element(var.jobs, count.index), "name", null)
#})
######this needs to be same in roboshop-jenkins/main.tf  ######