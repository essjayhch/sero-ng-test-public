output "emails" {
  value = google_service_account.service_accounts.*.email
}


output "keys" {
  value     = google_service_account_key.keys
  sensitive = true
}
