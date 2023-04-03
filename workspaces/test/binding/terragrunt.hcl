terraform {
  source = "tfr:///terraform-google-modules/iam/google//modules/service_accounts_iam?version=7.1.0"
}

dependency "project" {
  config_path = "../project"
}

dependency "service_accounts" {
  config_path = "../service-accounts"
}
inputs = {
  project          = dependency.project.outputs.project_id
  service_accounts = dependency.service_accounts.outputs.emails
  mode             = "additive"

  bindings = {
    "roles/cloudsql.client" = dependency.service_accounts.outputs.emails
  }
}
