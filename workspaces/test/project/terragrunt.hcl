terraform {
  source = "tfr:///terraform-google-modules/project-factory/google?version=14.2.0"
}

inputs = {
  name              = "bouncing-panda"
  random_project-id = true
  billing_account   = "REDACTED"
  org_id            = REDACTED
  activate_apis = [
    "compute.googleapis.com",
    "iam.googleapis.com",
    "cloudbuild.googleapis.com",
    "logging.googleapis.com",
    "pubsub.googleapis.com",
    "cloudfunctions.googleapis.com",
    "sqladmin.googleapis.com",
    "cloudkms.googleapis.com"
  ]
}
