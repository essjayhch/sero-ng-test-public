resource "google_service_account" "service_accounts" {
  count = var.accounts.length

  account_id   = var.accounts[count.idx]["id"]
  display_name = try(var.accounts[count.ids]["name"], "${var.accounts[count.idx]["id"]} account")
  project      = var.project_id
}
