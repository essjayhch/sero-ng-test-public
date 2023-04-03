resource "google_cloudfunctions_function" "function" {
  name    = "${var.prefix}-${var.function_name}"
  runtime = "nodejs16"
  project = var.project_id
  region  = var.region

  available_memory_mb   = 128
  source_archive_bucket = var.google_bucket
  source_archive_object = var.archive
  trigger_http          = true
  entry_point           = var.entry_point


  environment_variables = {
    DATABASE_URL = "mysql://${var.db["username"]}:${var.db["password"]}@localhost/default?socket=/cloudsql/bouncing-panda:europe-west2:bouncing-panda"
  }
}

resource "google_cloudfunctions_function_iam_member" "invoker" {
  project        = google_cloudfunctions_function.function.project
  region         = google_cloudfunctions_function.function.region
  cloud_function = google_cloudfunctions_function.function.name

  role   = "roles/cloudfunctions.invoker"
  member = "allUsers"
}
