resource "google_service_account" "service_accounts" {
  count = length(var.accounts)

  account_id   = var.accounts[count.index]["id"]
  display_name = try(var.accounts[count.index]["name"], "${var.accounts[count.index]["id"]} account")
  project      = var.project_id
}

resource "google_service_account_key" "keys" {
  count              = length(var.accounts)
  service_account_id = google_service_account.service_accounts[count.index].name
}

resource "google_project_iam_member" "project" {
  count   = length(var.accounts)
  project = var.project_id
  role    = "roles/cloudsql.client"
  member  = "serviceAccount:${google_service_account.service_accounts[count.index].email}"
}
