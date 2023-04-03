terraform {
  source = "tfr:///GoogleCloudPlatform/sql-db/google//modules/mysql?version=13.0.0"
}

dependency "project" {
  config_path = "../project"
}

inputs = {
  name             = "bouncing-panda"
  project_id       = dependency.project.outputs.project_id
  database_version = "MYSQL_8_0"
  zone             = "europe-west2-a"
  region           = "europe-west2"
  tier             = "db-f1-micro" # Set to a more appropriate size when available
}
