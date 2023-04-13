resource "jenkins_folder" "folders" {
  count = length(var.folders)
  name =  element(var.folders, count.index )
}

resource "jenkins_job" "a-jobs" {
  depends_on = [jenkins_folder.folders]
  count    = length(var.a-jobs)
  name     = lookup(element(var.a-jobs, count.index), "name", null)
  folder   = "/job/${lookup(element(var.a-jobs, count.index), "folder", null)}"

  template = templatefile("${path.module}/sb-job.xml", {
    repo_url = lookup(element(var.a-jobs, count.index), "repo_url", null)
    name     = lookup(element(var.a-jobs, count.index), "name", null)
  })


  lifecycle {
    ignore_changes = [ template ]

  }
}

resource "jenkins_job" "o-jobs" {
  depends_on = [jenkins_folder.folders]
  count    = length(var.o-jobs)
  name     = lookup(element(var.o-jobs, count.index), "name", null)
  folder   = "/job/${lookup(element(var.o-jobs, count.index), "folder", null)}"

  template = templatefile("${path.module}/mb-job.xml", {
    repo_url = lookup(element(var.o-jobs, count.index), "repo_url", null)
    name     = lookup(element(var.o-jobs, count.index), "name", null)
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