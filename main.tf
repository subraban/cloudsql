

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
  
}

resource "google_sql_database_instance_import" "import" {
  name       = "import"
 
  instance   = google_sql_database_instance.sql_instance.name
  database   = "db3"
  uri        = "gs://$sqlservermedia/WideWorldImporters-Full.bak"
}
