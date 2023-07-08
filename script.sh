resource "null_resource" "import_backup" {
  provisioner "local-exec" {
    command = <<EOT
      gcloud auth activate-service-account --key-file=creds.json
      echo Y | gcloud sql import sql instance3 gs://sqlservermedia/WideWorldImporters-Full.bak.bak --database=db1 --quiet
     
    EOT
}
}
