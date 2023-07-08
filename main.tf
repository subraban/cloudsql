

resource "google_sql_database_instance" "sql_instance" {
  name             = "mssqlinstance"
  database_version = "SQLSERVER_2019_EXPRESS"
  region           = "us-central1"
  project          = "groovy-karma-388506"

  settings {
    tier = "db-n1-standard-2"
  }
}

resource "google_storage_bucket_object" "backup_object" {
  name       = "WideWorldImporters-Full.bak"
  bucket     = "sqlservermedia"
  source     = "https://storage.cloud.google.com/sqlservermedia/WideWorldImporters-Full.bak" 
  project    = "groovy-karma-388506"
  
}

resource "google_sql_database_instance_imports" "import" {
  name             = "import-operation"
  instance         = google_sql_database_instance.sql_instance.name
  database         = "db2"
  type             = "IMPORT"
  file_type        = "BACKUP"
  uri              = google_storage_bucket_object.backup_object.self_link
  project          = "groovy-karma-388506"
  region           = "us-central1"
  database_version = "SQLSERVER_2019_EXPRESS"
}
