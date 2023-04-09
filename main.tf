resource "jenkins_folder" "folders" {
  name = "Infra"
}

resource "jenkins_job" "job" {
  name     = "roboshop"
  folder   = jenkins_folder.folders.id
  template = templatefile("${path.module}/sb-job.xml", {
    description = ""
  })
}