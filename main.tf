resource "google_sql_database_instance" "sql_instance" {
  name             = "instance1"
  database_version = "SQLSERVER_2017_EXPRESS"
   # ... Other configuration options for your SQL instance ...
}

resource "google_sql_database" "sql_database" {
  name   = "db4"
  instance = google_sql_database_instance.sql_instance.name
}

resource "google_storage_bucket" "backup_bucket" {
  name     = "sqlservermedia"
}

resource "null_resource" "import_script" {
  depends_on = [google_sql_database_instance.sql_instance]

  provisioner "local-exec" {
    command = <<EOF
gcloud sql import sqlserver "${google_sql_database_instance.sql_instance.name}" \
  "gs://${google_storage_bucket.backup_bucket.name}/WideWorldImporters-Full.bak" \
  --database="${google_sql_database.sql_database.name}"
EOF
  }
}
